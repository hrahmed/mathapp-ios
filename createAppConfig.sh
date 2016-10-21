###### Change these values to create tenant-app specific config key and value ######
appId=MathApp-IOS
tenantId=HAROON.AHMED@CA.COM-C
configKey=APMUrl
APMHostPort=10.130.179.231:8080

# Uncomment only one of the below URL configuration for APM
#APM url for 9.7
#configValue='http://'$APMHostPort'/#investigator;mp=By+Business+Service|{bsname}|{btname}+via+{platform}+{platform_major_version};re=30000;smm=false;st={starttime};et={endtime};tab-in=tm;tab-mv=tm;tr=-1'
#APM url for 10.0
#only bs
#configValue='http://'$APMHostPort'/ApmServer/#/map?m=H&ts1={starttime}&ts2={endtime}&f={\"bsf\":[\"{bsname}\"]}'
#APM url for 10.1 (includes both bs and bt)
#configValue='http://'$APMHostPort'/ApmServer/#/map?m=H&ts1={starttime}&ts2={endtime}&f={\"bsf\":[\"{bsname}\"],\"trf\":[\"{btname}+via+{platform}+{platform_major_version}\"]}'
#APM url for 10.2 with Advance Filter
configValue='http://'$APMHostPort'/ApmServer/#/map?m=H&ts1={starttime}&ts2={endtime}&fa=[{\"n\":\"serviceId\",\"o\":\"AND\",\"v\":[\"{bsname}\"]},{\"n\":\"transactionId\",\"o\":\"AND\",\"v\":[\"{btname} via {platform} {platform_major_version}\"]}]&u=UNFWEnterprise Team Center&cht=0&chs=1&cha=0&g=PE1'

###################################################################################

####### Environment details to execute the API ####################################
USER=haroon.ahmed@ca.com
COHORT=haroon.ahmed@ca.com
PASS=C@demo123
SERVER=https://axa.trials.ca.com
URL_CREATE_APP_CONFIG=$SERVER/mdo/v1/apps/config
###################################################################################



PAYLOAD='{"appId": "'$appId'","tenantId":"'$tenantId'","configKey":"'$configKey'","configValue":"'$configValue'"}'

echo $PAYLOAD

cohort=`echo $COHORT | openssl enc -base64`
echo
echo Using Server : $SERVER with User : $USER and cohort : $COHORT
echo

#TOKEN=`curl -s  -X POST -H "Authorization: Basic $cohort" -d "grant_type=PASSWORD&username=$USER&password=$PASS" $SERVER/ess/security/v1/token| sed -E 's/,/\\\n/g'|grep tkn |grep -v rtkn|awk -F\" '{print $4}'`

TOKEN=`curl -s  -X POST -H "Authorization: Basic $cohort" -d "grant_type=PASSWORD&username=$USER&password=$PASS" $SERVER/ess/security/v1/token|grep tkn |grep -v rtkn|awk -F\" '{print $4}'`


echo "TOKEN:" $TOKEN

if [ -z "$TOKEN" ]; then
TOKEN=`curl -s  -X POST -H "Authorization: Basic $cohort" -d "grant_type=PASSWORD&username=$USER&password=$PASS" $SERVER/ess/security/v1/token|awk -F, '{print $2}' |awk -F\" '{print $4}'`

echo "TOKEN:" $TOKEN
if [ -z "$TOKEN" ]; then
echo no token
exit 1
fi
fi

ENC_AUTHZ=`echo \{\"tkn\":\"$TOKEN\",\"t\":\"$COHORT\"\}    | openssl enc -base64 -A`
echo 'ENC_AUTHZ' $ENC_AUTHZ
echo

echo
echo
echo
curl -s -H "Authorization: Bearer $ENC_AUTHZ" -H "Content-Type: application/json;charset=UTF-8" -H "Accept: application/json" -X POST -i --data "$PAYLOAD" "$SERVER/mdo/v1/apps/config"

echo
echo
