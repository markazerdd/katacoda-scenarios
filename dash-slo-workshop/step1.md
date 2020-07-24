# Starting our microservices with Docker Compose

This SLO workshop uses two docker images in order to build a microservices environment for local development. The first image is a fully functioning version of the application, the second image purposely introduces issues that will cause errors and poor latency in the application. Both images are already instrumented to work with Datadog APM.

You can inspect the `docker-compose-fixed-instrumented.yml` in the `/docker-compose-files` directory to see the exact services you'll be running.

To get started you'll need to sign into [Datadog](https://app.datadoghq.com/) with your creditentials. Once you've signed in, copy your Datadog API key by going to **Integrations -> APIs**. Your API key will be covered by a purple box, just hover your mouse over the purple box to make it disappear and copy your API key.

Now that you have your API Key, replace the `<api key>` portion of the following command and enter it into the the terminal on the right to run the first image: 

`DD_API_KEY=<api key> docker-compose -f ./docker-compose-files/docker-compose-fixed-instrumented.yml up`

In order to start populating Datadog with some interesting data in a short period of time, you can run a command to simulate traffic to the app. Click on the following command to run it in a second terminal window:

`cd /ecommerce-workshop/ && ./gor --input-file-loop --input-file requests_0.gor --output-http "http://localhost:3000"`{{execute T2}}

In the next step we'll explore the running application and start thinking about where it would be most valuable to set SLOs.
