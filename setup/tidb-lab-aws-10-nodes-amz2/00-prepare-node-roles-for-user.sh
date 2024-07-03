#!/bin/bash

# Example: ./00-prepare-node-roles-for-user.sh <user_name_tag_assigned_by_instructor> <instructor_name_tag>

# Setup ENV
source ~/cloud-env.sh

case ${REGION_CODE} in
    "us-west-2")
        REGION_NAME="oregon"
        ;;
    "ap-northeast-1")
        REGION_NAME="tokyo"
        ;;
    "ap-southeast-1")
        REGION_NAME="singapore"
        ;;
    "eu-central-1")
        REGION_NAME="frankfurt"
        ;;
esac

# Enter the classroom username such as "user1" assigned by the instructor. 
export USER=${1}
# The instructor's name tag shared by your instructor.
export TRAINER=${2}

# Node 1
HOST_PD1_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=pd1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_PD1_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=pd1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 2
HOST_PD2_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=pd2" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_PD2_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=pd2" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 3
HOST_PD3_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=pd3" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_PD3_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=pd3" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 4
HOST_KV1_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=kv1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_KV1_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=kv1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 5
HOST_KV2_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=kv2" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_KV2_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=kv2" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 6
HOST_KV3_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=kv3" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_KV3_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=kv3" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 7
HOST_DB1_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=db1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_DB1_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=db1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 8
HOST_DB2_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=db2" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_DB2_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=db2" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 9
HOST_MONITOR1_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=monitor1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_MONITOR1_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=monitor1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

# Node 10
HOST_TIFLASH1_PRIVATE_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=tiflash1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PrivateIpAddress" \
--output text \
--region ${REGION_CODE}`

HOST_TIFLASH1_PUBLIC_IP=`aws ec2 describe-instances \
--filter "Name=instance-state-name,Values=running" "Name=tag:student,Values=${USER}" "Name=tag:role,Values=tiflash1" "Name=tag:trainer,Values=${TRAINER}" \
--query "Reservations[0].Instances[0].PublicIpAddress" \
--output text \
--region ${REGION_CODE}`

echo export HOST_MONITOR1_PRIVATE_IP=${HOST_MONITOR1_PRIVATE_IP} > ./hosts-env.sh
echo export HOST_MONITOR1_PUBLIC_IP=${HOST_MONITOR1_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_CM_PRIVATE_IP=${HOST_MONITOR1_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_CM_PUBLIC_IP=${HOST_MONITOR1_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_PD1_PRIVATE_IP=${HOST_PD1_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_PD1_PUBLIC_IP=${HOST_PD1_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_PD2_PRIVATE_IP=${HOST_PD2_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_PD2_PUBLIC_IP=${HOST_PD2_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_PD3_PRIVATE_IP=${HOST_PD3_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_PD3_PUBLIC_IP=${HOST_PD3_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_DB1_PRIVATE_IP=${HOST_DB1_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_DB1_PUBLIC_IP=${HOST_DB1_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_DB2_PRIVATE_IP=${HOST_DB2_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_DB2_PUBLIC_IP=${HOST_DB2_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_KV1_PRIVATE_IP=${HOST_KV1_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_KV1_PUBLIC_IP=${HOST_KV1_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_KV2_PRIVATE_IP=${HOST_KV2_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_KV2_PUBLIC_IP=${HOST_KV2_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_KV3_PRIVATE_IP=${HOST_KV3_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_KV3_PUBLIC_IP=${HOST_KV3_PUBLIC_IP} >> ./hosts-env.sh
echo export HOST_TIFLASH1_PRIVATE_IP=${HOST_TIFLASH1_PRIVATE_IP} >> ./hosts-env.sh
echo export HOST_TIFLASH1_PUBLIC_IP=${HOST_TIFLASH1_PUBLIC_IP} >> ./hosts-env.sh

source ./hosts-env.sh
echo ssh -i ~/.ssh/pe-class-key-${REGION_NAME}.pem ${HOST_CM_PRIVATE_IP} > ./ssh-to-cm.sh
echo ssh -i ~/.ssh/pe-class-key-${REGION_NAME}.pem ${HOST_PD1_PRIVATE_IP} > ./ssh-to-pd1.sh
echo ssh -i ~/.ssh/pe-class-key-${REGION_NAME}.pem ${HOST_PD2_PRIVATE_IP} > ./ssh-to-pd2.sh
echo ssh -i ~/.ssh/pe-class-key-${REGION_NAME}.pem ${HOST_PD3_PRIVATE_IP} > ./ssh-to-pd3.sh
echo ssh -i ~/.ssh/pe-class-key-${REGION_NAME}.pem ${HOST_DB1_PRIVATE_IP} > ./ssh-to-db1.sh
echo ssh -i ~/.ssh/pe-class-key-${REGION_NAME}.pem ${HOST_DB2_PRIVATE_IP} > ./ssh-to-db2.sh
echo ssh -i ~/.ssh/pe-class-key-${REGION_NAME}.pem ${HOST_MONITOR1_PRIVATE_IP} > ./ssh-to-monitor1.sh
echo ssh -i ~/.ssh/pe-class-key-${REGION_NAME}.pem ${HOST_KV1_PRIVATE_IP} > ./ssh-to-kv1.sh
echo ssh -i ~/.ssh/pe-class-key-${REGION_NAME}.pem ${HOST_KV2_PRIVATE_IP} > ./ssh-to-kv2.sh
echo ssh -i ~/.ssh/pe-class-key-${REGION_NAME}.pem ${HOST_KV3_PRIVATE_IP} > ./ssh-to-kv3.sh
echo ssh -i ~/.ssh/pe-class-key-${REGION_NAME}.pem ${HOST_TIFLASH1_PRIVATE_IP} > ./ssh-to-tiflash1.sh
chmod +x ./*.sh

# Setup Ten Nodes TiDB Cluster Topology
cp ./template-ten-nodes.yaml ./solution-topology-ten-nodes.yaml
sed -i '' \
  -e "s/<HOST_PD1_PUBLIC_IP>/${HOST_PD1_PUBLIC_IP}/g" \
  -e "s/<HOST_PD2_PUBLIC_IP>/${HOST_PD2_PUBLIC_IP}/g" \
  -e "s/<HOST_PD3_PUBLIC_IP>/${HOST_PD3_PUBLIC_IP}/g" \
  -e "s/<HOST_PD1_PRIVATE_IP>/${HOST_PD1_PRIVATE_IP}/g" \
  -e "s/<HOST_PD2_PRIVATE_IP>/${HOST_PD2_PRIVATE_IP}/g" \
  -e "s/<HOST_PD3_PRIVATE_IP>/${HOST_PD3_PRIVATE_IP}/g" \
  -e "s/<HOST_KV1_PRIVATE_IP>/${HOST_KV1_PRIVATE_IP}/g" \
  -e "s/<HOST_KV2_PRIVATE_IP>/${HOST_KV2_PRIVATE_IP}/g" \
  -e "s/<HOST_KV3_PRIVATE_IP>/${HOST_KV3_PRIVATE_IP}/g" \
  -e "s/<HOST_DB1_PRIVATE_IP>/${HOST_DB1_PRIVATE_IP}/g" \
  -e "s/<HOST_DB2_PRIVATE_IP>/${HOST_DB2_PRIVATE_IP}/g" \
  -e "s/<HOST_MONITOR1_PRIVATE_IP>/${HOST_MONITOR1_PRIVATE_IP}/g" \
  -e "s/<HOST_TIFLASH1_PRIVATE_IP>/${HOST_TIFLASH1_PRIVATE_IP}/g" \
  ./solution-topology-ten-nodes.yaml 2>/dev/null

# Setup Ten Nodes TiDB Cluster Topology for fff3
cp ./template-ten-nodes-fff3.yaml ./solution-topology-ten-nodes-fff3.yaml
sed -i '' \
  -e "s/<HOST_PD1_PUBLIC_IP>/${HOST_PD1_PUBLIC_IP}/g" \
  -e "s/<HOST_PD2_PUBLIC_IP>/${HOST_PD2_PUBLIC_IP}/g" \
  -e "s/<HOST_PD3_PUBLIC_IP>/${HOST_PD3_PUBLIC_IP}/g" \
  -e "s/<HOST_PD1_PRIVATE_IP>/${HOST_PD1_PRIVATE_IP}/g" \
  -e "s/<HOST_PD2_PRIVATE_IP>/${HOST_PD2_PRIVATE_IP}/g" \
  -e "s/<HOST_PD3_PRIVATE_IP>/${HOST_PD3_PRIVATE_IP}/g" \
  -e "s/<HOST_KV1_PRIVATE_IP>/${HOST_KV1_PRIVATE_IP}/g" \
  -e "s/<HOST_KV2_PRIVATE_IP>/${HOST_KV2_PRIVATE_IP}/g" \
  -e "s/<HOST_KV3_PRIVATE_IP>/${HOST_KV3_PRIVATE_IP}/g" \
  -e "s/<HOST_DB1_PRIVATE_IP>/${HOST_DB1_PRIVATE_IP}/g" \
  -e "s/<HOST_DB2_PRIVATE_IP>/${HOST_DB2_PRIVATE_IP}/g" \
  -e "s/<HOST_MONITOR1_PRIVATE_IP>/${HOST_MONITOR1_PRIVATE_IP}/g" \
  -e "s/<HOST_TIFLASH1_PRIVATE_IP>/${HOST_TIFLASH1_PRIVATE_IP}/g" \
  ./solution-topology-ten-nodes-fff3.yaml 2>/dev/null

# Setup Placement Rule Topology
cp ./template-topology-placement-rule.yaml ./solution-topology-placement-rule.yaml
sed -i '' \
  -e "s/<HOST_KV1_PRIVATE_IP>/${HOST_KV1_PRIVATE_IP}/g" \
  -e "s/<HOST_KV2_PRIVATE_IP>/${HOST_KV2_PRIVATE_IP}/g" \
  -e "s/<HOST_KV3_PRIVATE_IP>/${HOST_KV3_PRIVATE_IP}/g" \
  ./solution-topology-placement-rule.yaml 2>/dev/null

# Setup Six Nodes DM Cluster Topology
cp ./template-dm-six-nodes.yaml ./solution-dm-topology-six-nodes.yaml
sed -i '' \
  -e "s/<HOST_PD1_PRIVATE_IP>/${HOST_PD1_PRIVATE_IP}/g" \
  -e "s/<HOST_PD2_PRIVATE_IP>/${HOST_PD2_PRIVATE_IP}/g" \
  -e "s/<HOST_PD3_PRIVATE_IP>/${HOST_PD3_PRIVATE_IP}/g" \
  -e "s/<HOST_KV1_PRIVATE_IP>/${HOST_KV1_PRIVATE_IP}/g" \
  -e "s/<HOST_KV2_PRIVATE_IP>/${HOST_KV2_PRIVATE_IP}/g" \
  -e "s/<HOST_KV3_PRIVATE_IP>/${HOST_KV3_PRIVATE_IP}/g" \
  -e "s/<HOST_MONITOR1_PRIVATE_IP>/${HOST_MONITOR1_PRIVATE_IP}/g" \
  ./solution-dm-topology-six-nodes.yaml 2>/dev/null

# Setup sync-diff task configuration
cp ./template-sync-diff-config.toml ./solution-sync-diff-config.toml
sed -i '' \
  -e "s/<HOST_PD3_PRIVATE_IP>/${HOST_PD3_PRIVATE_IP}/g" \
  -e "s/<HOST_DB1_PRIVATE_IP>/${HOST_DB1_PRIVATE_IP}/g" \
  ./solution-sync-diff-config.toml 2>/dev/null

# Setup three-nodes-scale-out-ticdc.yaml
cp ./template-three-nodes-scale-out-ticdc.yaml ./solution-three-nodes-scale-out-ticdc.yaml
sed -i '' \
  -e "s/<HOST_PD1_PRIVATE_IP>/${HOST_PD1_PRIVATE_IP}/g" \
  -e "s/<HOST_PD2_PRIVATE_IP>/${HOST_PD2_PRIVATE_IP}/g" \
  -e "s/<HOST_PD3_PRIVATE_IP>/${HOST_PD3_PRIVATE_IP}/g" \
  ./solution-three-nodes-scale-out-ticdc.yaml 2>/dev/null

# Setup lightning-csv.toml
cp ./template-lightning-csv.toml ./solution-lightning-csv.toml
sed -i '' \
  -e "s/<HOST_PD1_PRIVATE_IP>/${HOST_PD1_PRIVATE_IP}/g" \
  -e "s/<HOST_DB1_PRIVATE_IP>/${HOST_DB1_PRIVATE_IP}/g" \
  ./solution-lightning-csv.toml 2>/dev/null

# Setup lightning-p1.toml
cp ./template-lightning-p1.toml ./solution-lightning-p1.toml
sed -i '' \
  -e "s/<HOST_PD1_PRIVATE_IP>/${HOST_PD1_PRIVATE_IP}/g" \
  -e "s/<HOST_DB1_PRIVATE_IP>/${HOST_DB1_PRIVATE_IP}/g" \
  ./solution-lightning-p1.toml 2>/dev/null

# Setup lightning-p2.toml
cp ./template-lightning-p2.toml ./solution-lightning-p2.toml
sed -i '' \
  -e "s/<HOST_PD1_PRIVATE_IP>/${HOST_PD1_PRIVATE_IP}/g" \
  -e "s/<HOST_DB2_PRIVATE_IP>/${HOST_DB2_PRIVATE_IP}/g" \
  ./solution-lightning-p2.toml 2>/dev/null

# Setup lightning-sql.toml
cp ./template-lightning-sql.toml ./solution-lightning-sql.toml
sed -i '' \
  -e "s/<HOST_PD1_PRIVATE_IP>/${HOST_PD1_PRIVATE_IP}/g" \
  -e "s/<HOST_DB1_PRIVATE_IP>/${HOST_DB1_PRIVATE_IP}/g" \
  ./solution-lightning-sql.toml 2>/dev/null

# Setup lightning-init.toml
cp ./template-lightning-init.toml ./solution-lightning-init.toml
sed -i '' \
  -e "s/<HOST_PD1_PRIVATE_IP>/${HOST_PD1_PRIVATE_IP}/g" \
  -e "s/<HOST_DB1_PRIVATE_IP>/${HOST_DB1_PRIVATE_IP}/g" \
  ./solution-lightning-init.toml 2>/dev/null

# Setup TiUP meta.yaml
cp ./template-tiup-meta.yaml ./solution-tiup-meta.yaml
sed -i '' \
  -e "s/<HOST_PD1_PUBLIC_IP>/${HOST_PD1_PUBLIC_IP}/g" \
  -e "s/<HOST_PD2_PUBLIC_IP>/${HOST_PD2_PUBLIC_IP}/g" \
  -e "s/<HOST_PD2_PUBLIC_IP>/${HOST_PD3_PUBLIC_IP}/g" \
  -e "s/<HOST_PD1_PRIVATE_IP>/${HOST_PD1_PRIVATE_IP}/g" \
  -e "s/<HOST_PD2_PRIVATE_IP>/${HOST_PD2_PRIVATE_IP}/g" \
  -e "s/<HOST_PD3_PRIVATE_IP>/${HOST_PD3_PRIVATE_IP}/g" \
  -e "s/<HOST_TIFLASH1_PRIVATE_IP>/${HOST_TIFLASH1_PRIVATE_IP}/g" \
  -e "s/<HOST_KV1_PRIVATE_IP>/${HOST_KV1_PRIVATE_IP}/g" \
  -e "s/<HOST_KV2_PRIVATE_IP>/${HOST_KV2_PRIVATE_IP}/g" \
  -e "s/<HOST_KV3_PRIVATE_IP>/${HOST_KV3_PRIVATE_IP}/g" \
  -e "s/<HOST_DB1_PRIVATE_IP>/${HOST_DB1_PRIVATE_IP}/g" \
  -e "s/<HOST_DB2_PRIVATE_IP>/${HOST_DB2_PRIVATE_IP}/g" \
  -e "s/<HOST_MONITOR1_PRIVATE_IP>/${HOST_MONITOR1_PRIVATE_IP}/g" \
  ./solution-tiup-meta.yaml 2>/dev/null

# Setup scale-out-tikv.yaml
cp ./template-scale-out-tikv.yaml ./solution-scale-out-tikv.yaml
sed -i '' \
  -e "s/<HOST_MONITOR1_PRIVATE_IP>/${HOST_MONITOR1_PRIVATE_IP}/g" \
  ./solution-scale-out-tikv.yaml 2>/dev/null

# Setup clean-bucket.sh script
cp ./template-clean-bucket.sh ./clean-bucket.sh
sed -i '' \
  -e "s/<TRAINER>/${TRAINER}/g" \
  -e "s/<USER>/${USER}/g" \
  ./clean-bucket.sh 2>/dev/null


# Copy hosts-env.sh to user home. It's also a safe operation if the PWD is user home. 
cp ./hosts-env.sh ~/hosts-env.sh 2>>/dev/null

echo
echo "10 nodes are prepared for user ${USER} and trainer ${TRAINER}."
