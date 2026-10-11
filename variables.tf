variable "privateca_certificate_templates" {
  description = <<EOT
Map of privateca_certificate_templates, attributes below
Required:
    - location
    - name
Optional:
    - deletion_policy
    - description
    - labels
    - maximum_lifetime
    - project
    - identity_constraints (block):
        - allow_subject_alt_names_passthrough (required)
        - allow_subject_passthrough (required)
        - cel_expression (optional, block):
            - description (optional)
            - expression (optional)
            - location (optional)
            - title (optional)
    - passthrough_extensions (block):
        - additional_extensions (optional, block):
            - object_id_path (required)
        - known_extensions (optional)
    - predefined_values (block):
        - additional_extensions (optional, block):
            - critical (optional)
            - object_id (required, block):
                - object_id_path (required)
            - value (required)
        - aia_ocsp_servers (optional)
        - ca_options (optional, block):
            - is_ca (optional)
            - max_issuer_path_length (optional)
            - null_ca (optional)
            - zero_max_issuer_path_length (optional)
        - key_usage (optional, block):
            - base_key_usage (optional, block):
                - cert_sign (optional)
                - content_commitment (optional)
                - crl_sign (optional)
                - data_encipherment (optional)
                - decipher_only (optional)
                - digital_signature (optional)
                - encipher_only (optional)
                - key_agreement (optional)
                - key_encipherment (optional)
            - extended_key_usage (optional, block):
                - client_auth (optional)
                - code_signing (optional)
                - email_protection (optional)
                - ocsp_signing (optional)
                - server_auth (optional)
                - time_stamping (optional)
            - unknown_extended_key_usages (optional, block):
                - object_id_path (required)
        - name_constraints (optional, block):
            - critical (required)
            - excluded_dns_names (optional)
            - excluded_email_addresses (optional)
            - excluded_ip_ranges (optional)
            - excluded_uris (optional)
            - permitted_dns_names (optional)
            - permitted_email_addresses (optional)
            - permitted_ip_ranges (optional)
            - permitted_uris (optional)
        - policy_ids (optional, block):
            - object_id_path (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    location         = string
    name             = string
    deletion_policy  = optional(string)
    description      = optional(string)
    labels           = optional(map(string))
    maximum_lifetime = optional(string)
    project          = optional(string)
    identity_constraints = optional(object({
      allow_subject_alt_names_passthrough = bool
      allow_subject_passthrough           = bool
      cel_expression = optional(object({
        description = optional(string)
        expression  = optional(string)
        location    = optional(string)
        title       = optional(string)
      }))
    }))
    passthrough_extensions = optional(object({
      additional_extensions = optional(list(object({
        object_id_path = list(number)
      })))
      known_extensions = optional(list(string))
    }))
    predefined_values = optional(object({
      additional_extensions = optional(list(object({
        critical = optional(bool)
        object_id = object({
          object_id_path = list(number)
        })
        value = string
      })))
      aia_ocsp_servers = optional(list(string))
      ca_options = optional(object({
        is_ca                       = optional(bool)
        max_issuer_path_length      = optional(number)
        null_ca                     = optional(bool)
        zero_max_issuer_path_length = optional(bool)
      }))
      key_usage = optional(object({
        base_key_usage = optional(object({
          cert_sign          = optional(bool)
          content_commitment = optional(bool)
          crl_sign           = optional(bool)
          data_encipherment  = optional(bool)
          decipher_only      = optional(bool)
          digital_signature  = optional(bool)
          encipher_only      = optional(bool)
          key_agreement      = optional(bool)
          key_encipherment   = optional(bool)
        }))
        extended_key_usage = optional(object({
          client_auth      = optional(bool)
          code_signing     = optional(bool)
          email_protection = optional(bool)
          ocsp_signing     = optional(bool)
          server_auth      = optional(bool)
          time_stamping    = optional(bool)
        }))
        unknown_extended_key_usages = optional(list(object({
          object_id_path = list(number)
        })))
      }))
      name_constraints = optional(object({
        critical                  = bool
        excluded_dns_names        = optional(list(string))
        excluded_email_addresses  = optional(list(string))
        excluded_ip_ranges        = optional(list(string))
        excluded_uris             = optional(list(string))
        permitted_dns_names       = optional(list(string))
        permitted_email_addresses = optional(list(string))
        permitted_ip_ranges       = optional(list(string))
        permitted_uris            = optional(list(string))
      }))
      policy_ids = optional(list(object({
        object_id_path = list(number)
      })))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

