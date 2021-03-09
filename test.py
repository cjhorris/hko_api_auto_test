import datetime

import pytz

hk_timezone = pytz.timezone('Hongkong')
us_timezone = pytz.timezone('US/Pacific')
time_format = "%Y-%m-%dT%H:%M:%S+08:00"
# now = datetime.now().strptime(time_format).replace(tzinfo=hk_timezone)

datetime.tzinfo = us_timezone
print(datetime.datetime.now(tz=hk_timezone))
