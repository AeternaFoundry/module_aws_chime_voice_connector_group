variable "chime_voice_connector_groups" {
  description = <<EOT
Map of chime_voice_connector_groups, attributes below
Required:
    - name
Optional:
    - region
    - connector (block):
        - priority (required)
        - voice_connector_id (required)
EOT

  type = map(object({
    name   = string
    region = optional(string)
    connector = optional(list(object({
      priority           = number
      voice_connector_id = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.chime_voice_connector_groups : (
        v.connector == null || (length(v.connector) <= 3)
      )
    ])
    error_message = "Each connector list must contain at most 3 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.chime_voice_connector_groups : (
        v.connector == null || alltrue([for item in v.connector : (length(item.voice_connector_id) >= 1 && length(item.voice_connector_id) <= 256)])
      )
    ])
    error_message = "must be between 1 and 256 characters"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

