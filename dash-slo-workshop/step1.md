# Starting our microservices with Docker Compose

This SLO workshop uses two docker images in order to build a microservices environment for local development. The first image is fully functioning version of the application, the second image purposely introduces issues that will cause errors and poor latency in the application. Both images are already instrumented to work with Datadog APM.

You can inspect the `docker-compose-fixed-instrumented.yml` in the `/docker-compose-files` directory, and see the exact services you'll be running.

To get started you'll need to sign into [Datadog](https://app.datadoghq.com/) with your creditentials. Once you've signed in, copy your Datadog API Key by going to **Integrations -> APIs**.

## Placeholder for gif of accessing API Key

Now that you have your API Key, replace the `<api key>` portion of the following command and enter it into the the terminal on the right to run the broken image: 

`DD_API_KEY=<api key> docker-compose -f docker-compose-fixed-instrumented.yml up`

In order to start populating Datadog with some interesting data in a short period of time, you can run a script to simulate traffic to the app. Open a new terminal tab by pressing the **+** button and run the following command:

`./gor --input-file-loop --input-file requests_0.gor --output-http "http://localhost:3000"`

It may take several minutes for the services to begin appearing in Datadog, so take the opportunity to explore the web app by clicking on the `storedog` tab in the Katacoda terminal to open it in your browser.  

After a few minutes, hop back into Datadog, and check to see if the services have appeared. The page should eventually look something like this: 

## Replace ../assets/services-nav.png

Eventually, when you switch to using the broken image you'll see the list of services like this:

## Replace ../assets/services-list.png

Remember, you can press CTRL + C and to stop the `docker-compose` command.
