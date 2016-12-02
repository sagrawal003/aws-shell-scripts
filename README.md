# AWS Shell Scripts

## Requirement:

* jq: You need to have jq installed.
<br />
https://stedolan.github.io/jq/download/
(jq is like sed for JSON data – you can use it to slice and filter and map and transform structured data with the same
ease that sed, awk, grep and friends let you play with text)
<br />
below is the command to install jq:
<br />
"sudo yum install jq"
<br />
OR
<br />
"sudo apt-get install jq"
* aws cli:<br />
Below is the command to install aws cli. after installation you need to configure aws cli by providing aws access/secret keys.
<br />
"sudo apt-get install -y python-pip"
<br />
"sudo pip install awscli"
<br />
"aws configure"
* All instances need to have a tag name and need to specify that tag name in the script aws-logins.command.


## These shell scripts are:
- preserve-logs:<br />
This directory contains scripts for moving servers log to s3 where you can have multiple autoscaled servers and you
want to preserve log of that server to s3.
- aws-logins.command:<br />
To login to multiple aws ec2 instances at once where you can have multiple instance under a loadbalancer/autoscaling. In this
script multiple instance dns is fetched using the tag value.


## Usage:
These scripts are tested successfully in mac.
Since this .command file so you just need to double click the file(permission should be executable for the file).

Script also has notification enabled, so once scripts gets completed, it will show mac notification bar with message for
its status as completed so that you do not need to keep watching the terminal to see if its completed or not.
