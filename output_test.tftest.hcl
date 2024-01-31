variables {
  name-prefix = "test"
}

run "output_pattern_should_be_expected" {
  assert {
    condition     = startswith(output.ecs-service-location, "test-lb-tf-") && endswith(output.ecs-service-location, "ap-southeast-1.elb.amazonaws.com")
    error_message = "The output pattern doesn't match."
  }
}
