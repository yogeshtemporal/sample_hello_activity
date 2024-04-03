for ((i = 1; i <= 1000; i++)); do
    schedule_id="asdf$i"
    temporal schedule create --address yogesh.a2dd6.tmprl.cloud:7233 --namespace yogesh.a2dd6  --tls-cert-path  /Users/yogeshchouk/cert/yo.pem --tls-key-path  /Users/yogeshchouk/cert/yo.key \
        --schedule-id "$schedule_id" \
        --workflow-id 'your-workflow-id' \
        --task-queue 'your-task-queue' \
        --workflow-type 'YourWorkflowType'
done
