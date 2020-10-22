#hardcode the local dev account for test
export AWS_ENVIRONMENT="qa"
export AWS_DEFAULT_REGION=us-east-1
export Route53_NAME="${AWS_ENVIRONMENT}-CDN-Stack"
export Route_Config_YML="./route53.yml"


echo "Creating route 53 host zone..."
aws cloudformation create-stack \
    --stack-name "${Route53_NAME}" \
    --template-body file://"${Route_Config_YML}" \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters ParameterKey="DomainName",ParameterValue="9447.me" ParameterKey="S3Record",ParameterValue="http://qa-comp9447-team4-mythical-mysfits.s3-website-us-east-1.amazonaws.com"\
     ParameterKey="HostedZoneId",ParameterValue="Z0356916NZWKOARDXAL1"\
     ParameterKey
#wait_build "${Route53_NAME}"