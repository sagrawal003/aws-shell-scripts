# This is the instance id of the aws instance on which the script will run.
#  You can set value of this variable to any thing to uniquely identify the server.
instance_id="$(ec2metadata --instance-id)"

# In below application log will get moved to s3 path for current date assuming logs files
# are getting created every day based on current date.(assuming your logs files are at "/var/www/html/".
aws s3 cp /var/www/html/logs/log-`date +%Y-%m-%d`.log s3://application-log/log-`date +%Y-%m-%d`-$instance_id.log
