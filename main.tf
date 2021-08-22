// Configure the Google Cloud provider
provider "google" {
  credentials = file("dbgcpfirst001-919cb366e18e.json")
  project     = "dbgcpfirst001"
  region      = "us-central1"
}
//Tester