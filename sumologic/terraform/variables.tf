variable "sumo_access_id" {
  description = "Sumo Logic Access ID"
  type        = string
  sensitive   = true
}

variable "sumo_access_key" {
  description = "Sumo Logic Access Key"
  type        = string
  sensitive   = true
}

variable "sumo_environment" {
  description = "Sumo Logic environment (us1, us2, etc.)"
  type        = string
  default     = "us2"
}

variable "sumo_endpoint" {
  description = "Sumo Logic API endpoint"
  type        = string
  default     = "https://api.sumologic.com/api/"
}

variable "monitors_folder_path" {
  description = "Path to the Sumo Logic folder where monitors will be created"
  type        = string
  default     = "/Library/Security/Detection Rules"
} 