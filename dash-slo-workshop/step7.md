# Creating a monitor-based SLO (optional)

Another way to track latency as an SLI would be using a Datadog monitor in a Monitor Based SLO. We can define this SLI as: *“99% of time, the p99 latency of a cart request should be lower than 1s”*

Navigate to **Monitors -> New Monitors** and select type APM, or go directly to https://app.datadoghq.com/monitors#create/apm

1. The **Primary tag** should be `env:ruby-shop` by default
2. For **Service** select `store-frontend`
3. For **Resource** select `spree::ordercontroller_edit`
4. Under *Set alert conditions* set the monitor to alert when the `p99 latency` is above `1s` over the `last 5 minutes`. 
5. Save the monitor

Now let’s create our SLO. Go to https://app.datadoghq.com/slo/new. Select `Monitor Based` and select the monitor you just created from the dropdown by searching for its name. Then set a target of 99% over the past 7 day and save the new SLO.

This SLO's status should be less than 100% due to there being poor latency in the broken image, both when you were using the application in this state and due to the simulated traffic also experiencing poor latency.

Click on IoT Project in Katacoda to open the app.

Note: You may have noticed that we are using a gauge metric to represent the latency for this example: `trace.rack.request.duration.by.resource_service.99p` and we used a monitor to find out the percentage of the time that this gauge is under our threshold. While this works, it can be a bit hard to grasp. Whether you use monitors or latency as bucketed counters, you should select whatever works better for your requirements. 