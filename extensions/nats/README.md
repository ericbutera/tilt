# NATS

## Example

### Publisher

```go
package main

import (
  "log"

  "github.com/nats-io/nats.go"
)

func main() {
  nc, _ := nats.Connect(nats.DefaultURL)
  js, _ := nc.JetStream()

  // Create a stream (equivalent to a topic in GCP Pub/Sub)
  _, err := js.AddStream(&nats.StreamConfig{
    Name:     "EVENTS",
    Subjects: []string{"events.*"},
  })
  if err != nil {
    log.Fatalf("Error creating stream: %v", err)
  }

  // Publish a message to the stream
  _, err = js.Publish("events.created", []byte("Hello, JetStream!!"))
  if err != nil {
    log.Fatalf("Error publishing message: %v", err)
  }
}
```

### Subscriber

```go
package main

import (
  "fmt"
  "log"

  "github.com/nats-io/nats.go"
)

func main() {
  nc, _ := nats.Connect(nats.DefaultURL)
  js, _ := nc.JetStream()

  // Create a durable consumer (subscription)
  _, err := js.Subscribe("events.*", func(msg *nats.Msg) {
    fmt.Printf("Received message: %s\n", string(msg.Data))
    if err := msg.Ack(); err != nil {
      log.Fatalf("Error acknowledging message: %v", err)
    }
  }, nats.Durable("EVENTS-DURABLE"), nats.ManualAck())
  if err != nil {
    log.Fatalf("Error subscribing to messages: %v", err)
  }

  // Keep the connection alive
  select {}
}
```
