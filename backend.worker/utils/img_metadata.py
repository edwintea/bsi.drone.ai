import exifread
from io import BytesIO
from fractions import Fraction

def extract_exif_data(image):

  with BytesIO(image) as output:
    try:
      tags = exifread.process_file(output)
      data = format_exif_data(tags)
      return data
    except Exception:
      return None

def convert_to_decimal_degrees(dms_values, ref):
    degrees = float(dms_values[0])
    minutes = float(dms_values[1])
    seconds = float(Fraction(dms_values[2]))

    decimal_degrees = degrees + (minutes / 60.0) + (seconds / 3600.0)

    if ref in ['S', 'W']:
        decimal_degrees = -decimal_degrees

    return decimal_degrees

def extract_lat_long(gps_data):
    lat_ref = gps_data['GPS GPSLatitudeRef']
    lat_values = eval(gps_data['GPS GPSLatitude'])  # Converts the string to a list of values

    lon_ref = gps_data['GPS GPSLongitudeRef']
    lon_values = eval(gps_data['GPS GPSLongitude'])  # Converts the string to a list of values

    latitude = convert_to_decimal_degrees(lat_values, lat_ref)
    longitude = convert_to_decimal_degrees(lon_values, lon_ref)

    return (round(latitude,6), round(longitude,6))

def format_exif_data(tags):
    exif_data = {}
    fields_of_interest = [
        'Image Make', 'Image Model', 'Image Orientation', 'Image XResolution', 
        'Image YResolution', 'Image DateTime', 'GPS GPSLatitudeRef', 'GPS GPSLatitude', 
        'GPS GPSLongitudeRef', 'GPS GPSLongitude', 'EXIF ExposureTime', 'EXIF FNumber', 
        'EXIF ISOSpeedRatings', 'EXIF DateTimeOriginal', 'EXIF FocalLength', 
        'EXIF WhiteBalance'
    ]

    for field in fields_of_interest:
        if field in tags:
            exif_data[field] = str(tags[field])

    return exif_data