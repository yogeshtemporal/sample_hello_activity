temporal schedule list --address yogesh.a2dd6.tmprl.cloud:7233 --namespace yogesh.a2dd6  --tls-cert-path  /Users/yogeshchouk/cert/yo.pem --tls-key-path  /Users/yogeshchouk/cert/yo.key | awk '{print $1}' | grep "asd*" | while IFS= read -r schedule_id; do

    temporal schedule delete -schedule-id "$schedule_id" --address yogesh.a2dd6.tmprl.cloud:7233 --namespace yogesh.a2dd6  --tls-cert-path  /Users/yogeshchouk/cert/yo.pem --tls-key-path  /Users/yogeshchouk/cert/yo.key
sleep 2
done
