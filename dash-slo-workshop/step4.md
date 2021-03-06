# Create a SLO

Navigate to create a new SLO to track the error rate of the requests for managing our cart. You can get there by clicking through to the sub-nav item under Monitors, **Monitors -> New SLO** or going directly to https://app.datadoghq.com/slo

![SLO navigation](../assets/slo-nav.png)

## Identify the SLI 

There are two SLO types to pick from: `Metric Based` or `Monitor Based`.

Metric Based SLOs take a count-based approach to defining the SLI. The SLO will track a success ratio of a metric(s) that corresponds to good events (the numerator) over a metric(s) that correspond to total events (the denominator).

Monitor Based SLOs take a time-based approach to defining the SLI. The SLO will track how much time an existing Datadog monitor(s) spends in the ALERT state (bad) vs a non-ALERT state (good).

In this case, we care about availability and error rate so we'll select `Metric Based` under `Define The Source` for our SLI creation. Using this SLO type, we can set a target percentage of requests that should be successful. 

**First step:** We need to define what our good events are. In the previous step, we mentioned that we have two trace metrics we can use for these requests: `trace.rack.request.hits` and `trace.rack.request.errors`. However, the metrics correspond to total events and bad events, respectively. So how are we supposed to define good events?

Simple! Good events are just the total events minus the bad events and we can configure the numerator query with this arithmetic!

1. In the numerator field select `trace.rack.request.hits` 
2. Click on **Advanced...** 
![Advanced Query](../assets/advanced.png)
1. Press the **Add Query** button, a second metric query row will appear labelled *b*
2. For metric b, select `trace.rack.request.errors`. Since there haven’t been any errors, you’ll probably need to edit the query directly by clicking `</>` and entering `sum:trace.rack.request.errors{service:store-frontend,resource_name:spree::orderscontroller_edit,env:ruby-shop}.as_count()` manually. 
![Error Metric Query](../assets/error-metric.png)
1. Change the expression `a + b` to `a - b`
2. For both metrics make sure to scope them down to the resource we are tracking by selecting `service:store-frontend`, `resource_name:spree::ordercontroller_edit` and `env:ruby-shop` in the **from** clause of both metrics. 

This subtraction query now repesents all “good” (successful) requests to manage our carts.

**Second step:** We now need to define our total events. The metric `trace.rack.request.hits` already represents total events, so select it and make sure to also scope it down to `service:store-frontend`, `resource_name:spree::ordercontroller_edit` and `env:ruby-shop` in the **from** clause.

![SLI Edit](../assets/sli-edit.png)

## Set the SLO 

Next we set the SLO target percentage and time window we are measuring against. Select 99% over a 7 day time window. You can also set an optional warning target (like 99.1% for example).

![Time Window](../assets/time-window.png)

This means that we are setting an SLO to say that 99% of the requests customers make for managing their cart must be successful over the past 7 days. You can even use this as your title! 

*Optionally, you can add a description and tag your SLO.* 

Click save! 

## View your data

Check out your data on the SLO detail page! 

Go back to the web app and view/update your cart to generate more requests!

When you first check it out, it’ll likely say 100%. With the nature of the workshop, there aren’t any errors yet (and also a lower number of requests). But in our next step we will purposely introduce errors into our application.

![SLO Details](../assets/slo-details.png)
