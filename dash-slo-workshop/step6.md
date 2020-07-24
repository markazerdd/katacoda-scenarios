# Latency SLIs using bucketed counters (optional)

Note: There is no action in the Katacoda environment for this step. This is for discussion. 

As we also care about the latency experienced by our users, we’ll now add a Latency SLI for our User Journey.

There are several ways of implementing a Latency SLI. One way that we are going to discuss during this step is to increment a counter for each event (e.g a HTTP  request) that completes under a certain time (the good events) and compare this value to the total number of events. It’s also helpful to increment multiple counters that represent “buckets” of time, for example:
* All requests <= 250ms
* All requests <= 500ms
* All requests <= 1s

We call this technique “bucketed counters”. The algorithm can be summarized like this in pseudo-code:

`Buckets = [10, 50, 500] # in milliseconds`

`For each event (e.g request):`
	`startTime = Start a time timer`
	`do something with this event...`
	`endTime = Stop the timer`
	`timeTaken = endTime - startTime`

	`Foreach bucket in sort(buckets):`
		`If timeTaken <= bucket:`
`incrementCounter(“metric.latency.count.under_{bucket}”, 1)`
	`incrementCounter(“metrics.latency.count.total”, 1)`

To implement this you’ll need to emit custom metrics from the application using Dogstatd, https://docs.datadoghq.com/developers/dogstatsd/.

You can then create a new Metric Based SLO based on the two metrics.

Note: There is no action in the Katacoda environment for this step.