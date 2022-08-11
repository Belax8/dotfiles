
INSTANCE_ID='<instance-id>'
SUBDOMAIN='<target-domain-name>'
HOSTED_ZONE='<hosted-zone-id>'
TEMP_FILE=$HOME/ip_change_request.json

INSTANCE_IP_ADDRESS=`aws ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[*].Instances[*].PublicIpAddress" --output text`

touch $TEMP_FILE

echo '{' >> $TEMP_FILE
echo '  "Changes": [' >> $TEMP_FILE
echo '    {' >> $TEMP_FILE
echo '      "Action": "UPSERT",' >> $TEMP_FILE
echo '      "ResourceRecordSet": {' >> $TEMP_FILE
echo "        \"Name\": \"$SUBDOMAIN\"," >> $TEMP_FILE
echo '        "Type": "A",' >> $TEMP_FILE
echo '        "TTL": 300,' >> $TEMP_FILE
echo '        "ResourceRecords": [' >> $TEMP_FILE
echo '          {' >> $TEMP_FILE
echo "            \"Value\": \"$INSTANCE_IP_ADDRESS\"" >> $TEMP_FILE
echo '          }' >> $TEMP_FILE
echo '        ]' >> $TEMP_FILE
echo '      }' >> $TEMP_FILE
echo '    }' >> $TEMP_FILE
echo '  ]' >> $TEMP_FILE
echo '}' >> $TEMP_FILE

aws route53 change-resource-record-sets --hosted-zone-id $HOSTED_ZONE --change-batch file://$TEMP_FILE

rm $TEMP_FILE
