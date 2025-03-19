from datetime import datetime

def get_date_yearmonthday():
    now = datetime.now()
    date_str = now.strftime("%Y%m%d")
    return date_str

def get_today():
    today = datetime.date.today()
    return today

def get_day():
    today = datetime.date.today()
    day = today.day
    return day

def get_month():
    today = datetime.date.today()
    month = today.month
    return month

def get_year():
    today = datetime.date.today()
    year = today.year
    return year