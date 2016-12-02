read -r -p "Are you sure? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 


instances1="$(aws ec2 describe-instances --filters 'Name=tag-value,Values=instance1' --output json --query 'Reservations[].Instances[].PublicDnsName')"
instances2="$(aws ec2 describe-instances --filters 'Name=tag-value,Values=instance2' --output json --query 'Reservations[].Instances[].PublicDnsName')"
instances3="$(aws ec2 describe-instances --filters 'Name=tag-value,Values=instance3' --output json --query 'Reservations[].Instances[].PublicDnsName')"

instances1=`echo "$instances1" | jq -c '.[]'`
if [ "$instances1" != "" ]; then
    instances1=`echo "$instances1" | tr -d '"'`
fi

instances2=`echo "$instances2" | jq -c '.[]'`
if [ "$instances2" != "" ]; then
    instances2=`echo "$instances2" | tr -d '"'`
fi

instances3=`echo "$instances3" | jq -c '.[]'`
if [ "$instances3" != "" ]; then
    instances3=`echo "$instances3" | tr -d '"'`
fi

instances=`echo "$instances1 instances2 instances3"`

if [ "$instances" != "" ]; then
    instances=($instances)

    for instance_id in "${instances[@]}";
    do
    osascript -e "tell application \"Terminal\"" \
                        -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
                        -e "do script \"ssh -i pem/intance.pem ubuntu@$instance_id\" in front window" \
                        -e "end tell"
                        > /dev/null
    done
fi

        osascript -e 'display notification "Completed" with title "AWS-SERVER LOGIN"'

        ;;
    *)
        ;;
esac
