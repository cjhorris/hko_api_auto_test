# HKO Open Data API test automation
### python + cucumber(behave)

#### 1. Docker build image
``
 docker build -t python-behave . 
``
#### 2-1. Docker run with tag
``
docker run python-behave behave resources/features -t @time_validation
``
#### 2-2. Docker run all features
``
docker run python-behave behave resources/features
``
#### 3. Report will be generated as "behave-report.html"
``
docker run python-behave behave resources/features -f html -o behave-report.html
``



