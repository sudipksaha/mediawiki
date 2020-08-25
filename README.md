# mediawiki
Implementing MediaWilki Project

Cluster Creation 
aws eks --region <region> create-cluster --name <clusterName> 
--role-arn <EKS-role-ARN> --resources-vpc-config 
subnetIds=<subnet-id-1>,<subnet-id-2>,<subnet-id-3>,securityGroupIds=
<security-group-id>
