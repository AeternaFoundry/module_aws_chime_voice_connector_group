output "chime_voice_connector_groups_id" {
  description = "Map of id values across all chime_voice_connector_groups, keyed the same as var.chime_voice_connector_groups"
  value       = { for k, v in aws_chime_voice_connector_group.chime_voice_connector_groups : k => v.id if v.id != null && length(v.id) > 0 }
}
output "chime_voice_connector_groups_connector" {
  description = "Map of connector values across all chime_voice_connector_groups, keyed the same as var.chime_voice_connector_groups"
  value       = { for k, v in aws_chime_voice_connector_group.chime_voice_connector_groups : k => v.connector if v.connector != null && length(v.connector) > 0 }
}
output "chime_voice_connector_groups_name" {
  description = "Map of name values across all chime_voice_connector_groups, keyed the same as var.chime_voice_connector_groups"
  value       = { for k, v in aws_chime_voice_connector_group.chime_voice_connector_groups : k => v.name if v.name != null && length(v.name) > 0 }
}
output "chime_voice_connector_groups_region" {
  description = "Map of region values across all chime_voice_connector_groups, keyed the same as var.chime_voice_connector_groups"
  value       = { for k, v in aws_chime_voice_connector_group.chime_voice_connector_groups : k => v.region if v.region != null && length(v.region) > 0 }
}

