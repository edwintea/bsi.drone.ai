import base64

def encode_string(date_str, image_name):
  """Encodes a combined string using base64."""
  combined_str = date_str.replace("-", "") + image_name
  encoded_str = base64.b64encode(combined_str.encode('utf-8')).decode('utf-8')
  return encoded_str

def decode_string(encoded_str):
  """Decodes a base64 encoded string."""
  decoded_bytes = base64.b64decode(encoded_str)
  decoded_str = decoded_bytes.decode('utf-8')
  return decoded_str