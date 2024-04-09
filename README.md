Here's a beginner-friendly guide to help you connect to Temporal Cloud and explore its features without overwhelming you with technical details. This can be particularly useful as you start your journey with Temporal.
After connecting to Temporal Cloud, you'll be able to see your workflows in the [TCloud UI](https://cloud.temporal.io/) using the Workflow ID 'HelloActivityWorkflow'. Additionally, you can access raw metrics from the Prometheus server at http://localhost:8078/metrics.

Prerequisites - 
  1. Have a TCloud account with the namespace & API key created.
  2. Docker installed on your machine.

Execute - 
  * Build & Run the docker image using below commands
  1. docker build --build-arg API_KEY='<api_key>' --build-arg NAMESPACE='<ns.acc_id>' -t simple_cloud_wf .
  2. docker run -p 8078:8078 simple_cloud_wf


