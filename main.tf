resource "google_privateca_certificate_template" "privateca_certificate_templates" {
  for_each = var.privateca_certificate_templates

  location         = each.value.location
  name             = each.value.name
  deletion_policy  = each.value.deletion_policy
  description      = each.value.description
  labels           = each.value.labels
  maximum_lifetime = each.value.maximum_lifetime
  project          = each.value.project

  dynamic "identity_constraints" {
    for_each = each.value.identity_constraints != null ? [each.value.identity_constraints] : []
    content {
      allow_subject_alt_names_passthrough = identity_constraints.value.allow_subject_alt_names_passthrough
      allow_subject_passthrough           = identity_constraints.value.allow_subject_passthrough
      dynamic "cel_expression" {
        for_each = identity_constraints.value.cel_expression != null ? [identity_constraints.value.cel_expression] : []
        content {
          description = cel_expression.value.description
          expression  = cel_expression.value.expression
          location    = cel_expression.value.location
          title       = cel_expression.value.title
        }
      }
    }
  }

  dynamic "passthrough_extensions" {
    for_each = each.value.passthrough_extensions != null ? [each.value.passthrough_extensions] : []
    content {
      dynamic "additional_extensions" {
        for_each = passthrough_extensions.value.additional_extensions != null ? passthrough_extensions.value.additional_extensions : []
        content {
          object_id_path = additional_extensions.value.object_id_path
        }
      }
      known_extensions = passthrough_extensions.value.known_extensions
    }
  }

  dynamic "predefined_values" {
    for_each = each.value.predefined_values != null ? [each.value.predefined_values] : []
    content {
      dynamic "additional_extensions" {
        for_each = predefined_values.value.additional_extensions != null ? predefined_values.value.additional_extensions : []
        content {
          critical = additional_extensions.value.critical
          object_id {
            object_id_path = additional_extensions.value.object_id.object_id_path
          }
          value = additional_extensions.value.value
        }
      }
      aia_ocsp_servers = predefined_values.value.aia_ocsp_servers
      dynamic "ca_options" {
        for_each = predefined_values.value.ca_options != null ? [predefined_values.value.ca_options] : []
        content {
          is_ca                       = ca_options.value.is_ca
          max_issuer_path_length      = ca_options.value.max_issuer_path_length
          null_ca                     = ca_options.value.null_ca
          zero_max_issuer_path_length = ca_options.value.zero_max_issuer_path_length
        }
      }
      dynamic "key_usage" {
        for_each = predefined_values.value.key_usage != null ? [predefined_values.value.key_usage] : []
        content {
          dynamic "base_key_usage" {
            for_each = key_usage.value.base_key_usage != null ? [key_usage.value.base_key_usage] : []
            content {
              cert_sign          = base_key_usage.value.cert_sign
              content_commitment = base_key_usage.value.content_commitment
              crl_sign           = base_key_usage.value.crl_sign
              data_encipherment  = base_key_usage.value.data_encipherment
              decipher_only      = base_key_usage.value.decipher_only
              digital_signature  = base_key_usage.value.digital_signature
              encipher_only      = base_key_usage.value.encipher_only
              key_agreement      = base_key_usage.value.key_agreement
              key_encipherment   = base_key_usage.value.key_encipherment
            }
          }
          dynamic "extended_key_usage" {
            for_each = key_usage.value.extended_key_usage != null ? [key_usage.value.extended_key_usage] : []
            content {
              client_auth      = extended_key_usage.value.client_auth
              code_signing     = extended_key_usage.value.code_signing
              email_protection = extended_key_usage.value.email_protection
              ocsp_signing     = extended_key_usage.value.ocsp_signing
              server_auth      = extended_key_usage.value.server_auth
              time_stamping    = extended_key_usage.value.time_stamping
            }
          }
          dynamic "unknown_extended_key_usages" {
            for_each = key_usage.value.unknown_extended_key_usages != null ? key_usage.value.unknown_extended_key_usages : []
            content {
              object_id_path = unknown_extended_key_usages.value.object_id_path
            }
          }
        }
      }
      dynamic "name_constraints" {
        for_each = predefined_values.value.name_constraints != null ? [predefined_values.value.name_constraints] : []
        content {
          critical                  = name_constraints.value.critical
          excluded_dns_names        = name_constraints.value.excluded_dns_names
          excluded_email_addresses  = name_constraints.value.excluded_email_addresses
          excluded_ip_ranges        = name_constraints.value.excluded_ip_ranges
          excluded_uris             = name_constraints.value.excluded_uris
          permitted_dns_names       = name_constraints.value.permitted_dns_names
          permitted_email_addresses = name_constraints.value.permitted_email_addresses
          permitted_ip_ranges       = name_constraints.value.permitted_ip_ranges
          permitted_uris            = name_constraints.value.permitted_uris
        }
      }
      dynamic "policy_ids" {
        for_each = predefined_values.value.policy_ids != null ? predefined_values.value.policy_ids : []
        content {
          object_id_path = policy_ids.value.object_id_path
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

