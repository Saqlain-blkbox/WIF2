terraform {
  backend "gcs" {
    bucket  = "wif-tfstate"
    prefix  = "terraform/state"
  }
}

provider "google" {
  project = "blkbox-practice"
  region  = "us-central1"
}

resource "google_pubsub_topic" "pubsub_topic" {
  name = "wif-topic-${random_id.unique_id.hex}"
}
  
resource "random_id" "unique_id" {
  byte_length = 8
}
