output "privateca_certificate_templates_id" {
  description = "Map of id values across all privateca_certificate_templates, keyed the same as var.privateca_certificate_templates except keys with no id are omitted"
  value       = { for k, v in google_privateca_certificate_template.privateca_certificate_templates : k => v.id if v.id != null && length(v.id) > 0 }
}
output "privateca_certificate_templates_create_time" {
  description = "Map of create_time values across all privateca_certificate_templates, keyed the same as var.privateca_certificate_templates except keys with no create_time are omitted"
  value       = { for k, v in google_privateca_certificate_template.privateca_certificate_templates : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "privateca_certificate_templates_deletion_policy" {
  description = "Map of deletion_policy values across all privateca_certificate_templates, keyed the same as var.privateca_certificate_templates except keys with no deletion_policy are omitted"
  value       = { for k, v in google_privateca_certificate_template.privateca_certificate_templates : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "privateca_certificate_templates_description" {
  description = "Map of description values across all privateca_certificate_templates, keyed the same as var.privateca_certificate_templates except keys with no description are omitted"
  value       = { for k, v in google_privateca_certificate_template.privateca_certificate_templates : k => v.description if v.description != null && length(v.description) > 0 }
}
output "privateca_certificate_templates_effective_labels" {
  description = "Map of effective_labels values across all privateca_certificate_templates, keyed the same as var.privateca_certificate_templates except keys with no effective_labels are omitted"
  value       = { for k, v in google_privateca_certificate_template.privateca_certificate_templates : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "privateca_certificate_templates_identity_constraints" {
  description = "Map of identity_constraints values across all privateca_certificate_templates, keyed the same as var.privateca_certificate_templates except keys with no identity_constraints are omitted"
  value       = { for k, v in google_privateca_certificate_template.privateca_certificate_templates : k => one(v.identity_constraints) if v.identity_constraints != null && length(v.identity_constraints) > 0 }
}
output "privateca_certificate_templates_labels" {
  description = "Map of labels values across all privateca_certificate_templates, keyed the same as var.privateca_certificate_templates except keys with no labels are omitted"
  value       = { for k, v in google_privateca_certificate_template.privateca_certificate_templates : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "privateca_certificate_templates_location" {
  description = "Map of location values across all privateca_certificate_templates, keyed the same as var.privateca_certificate_templates except keys with no location are omitted"
  value       = { for k, v in google_privateca_certificate_template.privateca_certificate_templates : k => v.location if v.location != null && length(v.location) > 0 }
}
output "privateca_certificate_templates_maximum_lifetime" {
  description = "Map of maximum_lifetime values across all privateca_certificate_templates, keyed the same as var.privateca_certificate_templates except keys with no maximum_lifetime are omitted"
  value       = { for k, v in google_privateca_certificate_template.privateca_certificate_templates : k => v.maximum_lifetime if v.maximum_lifetime != null && length(v.maximum_lifetime) > 0 }
}
output "privateca_certificate_templates_name" {
  description = "Map of name values across all privateca_certificate_templates, keyed the same as var.privateca_certificate_templates except keys with no name are omitted"
  value       = { for k, v in google_privateca_certificate_template.privateca_certificate_templates : k => v.name if v.name != null && length(v.name) > 0 }
}
output "privateca_certificate_templates_passthrough_extensions" {
  description = "Map of passthrough_extensions values across all privateca_certificate_templates, keyed the same as var.privateca_certificate_templates except keys with no passthrough_extensions are omitted"
  value       = { for k, v in google_privateca_certificate_template.privateca_certificate_templates : k => one(v.passthrough_extensions) if v.passthrough_extensions != null && length(v.passthrough_extensions) > 0 }
}
output "privateca_certificate_templates_predefined_values" {
  description = "Map of predefined_values values across all privateca_certificate_templates, keyed the same as var.privateca_certificate_templates except keys with no predefined_values are omitted"
  value       = { for k, v in google_privateca_certificate_template.privateca_certificate_templates : k => one(v.predefined_values) if v.predefined_values != null && length(v.predefined_values) > 0 }
}
output "privateca_certificate_templates_project" {
  description = "Map of project values across all privateca_certificate_templates, keyed the same as var.privateca_certificate_templates except keys with no project are omitted"
  value       = { for k, v in google_privateca_certificate_template.privateca_certificate_templates : k => v.project if v.project != null && length(v.project) > 0 }
}
output "privateca_certificate_templates_terraform_labels" {
  description = "Map of terraform_labels values across all privateca_certificate_templates, keyed the same as var.privateca_certificate_templates except keys with no terraform_labels are omitted"
  value       = { for k, v in google_privateca_certificate_template.privateca_certificate_templates : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}
output "privateca_certificate_templates_update_time" {
  description = "Map of update_time values across all privateca_certificate_templates, keyed the same as var.privateca_certificate_templates except keys with no update_time are omitted"
  value       = { for k, v in google_privateca_certificate_template.privateca_certificate_templates : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}

