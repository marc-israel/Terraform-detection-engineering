terraform {
  required_providers {
    sumologic = {
      source  = "SumoLogic/sumologic"
      version = "~> 2.0"
    }
  }
  
  backend "s3" {
    # Configure your backend as needed (or comment this out for local state)
    # bucket         = "your-terraform-state-bucket"
    # key            = "detection-engineering/sumo-logic/terraform.tfstate"
    # region         = "us-east-1"
    # dynamodb_table = "terraform-state-lock"
  }
}

provider "sumologic" {
  access_id   = var.sumo_access_id
  access_key  = var.sumo_access_key
  environment = var.sumo_environment
  base_url    = var.sumo_endpoint
}

# Find the folder ID for the monitors folder
data "sumologic_folder" "monitors_folder" {
  path = var.monitors_folder_path
}

# Import all detection rules from the detections directory
module "detections" {
  source = "./modules/detections"
  
  # Pass the parent folder ID for all monitors
  monitors_folder_id = data.sumologic_folder.monitors_folder.id
} 