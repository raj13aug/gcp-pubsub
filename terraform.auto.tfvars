pub_sub = [
  {
    topic      = "test-topic-02"
    project_id = "poc-project-learning"
    custom_sa  = "poc-project-learning@poc-project-learning.iam.gserviceaccount.com"
    pull_subscriptions = [
      {
        name                         = "test-subscription-01"
        dead_letter_topic            = "projects/poc-project-learning/topics/test-topic-02"
        ack_deadline_seconds         = 600
        max_delivery_attempts        = 5
        enable_exactly_once_delivery = true
        message_retention_duration   = "604800s"
        service_account              = "poc-project-learning@poc-project-learning.iam.gserviceaccount.com"
        expiration_policy = [
          {
            ttl = ""
          }
        ]
      }
    ]
  }
]