# Starting our microservices with Docker Compose

This SLO workshop uses two docker images in order to build a microservices environment for a small scale e-commerce web app called `storedog`. The first image is a fully functioning version of the application, the second image purposely introduces issues that will cause errors and poor latency in the application. Both images are already instrumented to work with Datadog APM.

You can inspect the `docker-compose-fixed-instrumented.yml` in the `/docker-compose-files` directory to see the exact services you'll be running.

To get started you'll need to run the following command in the terminal to your right:

<pre data-target="clipboard">
docker-compose -f ./docker-compose-files/docker-compose-fixed-instrumented.yml up
</pre>

You can check that storedog is running by clicking on the `storedog` tab next to the `Terminal` tab to your right. **Note:** It takes several minutes for the docker-compose command to fully ramp up, so if you see a page like this one just wait a little bit longer before refreshing the page:

![Port Error](../assets/katacoda-error.png)

In order to start populating Datadog with some interesting data in a short period of time, you can run a command to simulate traffic to the app. Click on the following command to run it in a second terminal window:

`cd /ecommerce-workshop/ && ./gor --input-file-loop --input-file requests_0.gor --output-http "http://localhost:3000"`{{execute T2}}

In the next step we'll explore the running application and start thinking about where it would be most valuable to set SLOs.
