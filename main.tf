# A Terraform module to create a subset of cloud components
# Copyright (C) 2022 Skaylink GmbH

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# For questions and contributions please contact info@iq3cloud.com

locals {
  years          = 365 * var.expiry_date
  hoursRaw       = local.years * 24
  hours_to_str   = tostring(local.hoursRaw)
  hours          = "${local.hours_to_str}h"
  current_time   = timestamp()
  expiry_time    = timeadd(local.current_time, local.hours)
  formatted_time = formatdate("YYYY-MM-DD", local.expiry_time)
  time_to_expiry = "${local.formatted_time}T00:00:00+00:00"
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_key_vault_secret" "private_key" {
  name            = "${var.use_case}-${var.environment_name}-ssh-private-key"
  value           = tls_private_key.ssh.private_key_pem
  key_vault_id    = var.key_vault_id
  content_type    = "SSH PRIVATE KEY"
  expiration_date = local.time_to_expiry
  tags = {
    environment = var.environment_name
  }

  lifecycle {
    ignore_changes = [
      expiration_date
    ]
  }
}

resource "azurerm_key_vault_secret" "public_key" {
  name            = "${var.use_case}-${var.environment_name}-ssh-public-key"
  value           = tls_private_key.ssh.public_key_openssh
  content_type    = "SSH PUBLIC KEY"
  expiration_date = local.time_to_expiry
  key_vault_id    = var.key_vault_id
  tags = {
    environment = var.environment_name
  }

  lifecycle {
    ignore_changes = [
      expiration_date
    ]
  }
}
