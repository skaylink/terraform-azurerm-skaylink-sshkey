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

variable "use_case" {
  type        = string
  description = "The use case for the keypair, for example aks or vms"
}

variable "environment_name" {
  type        = string
  description = "The environment the keypair will be used in, for example dev"
}

variable "key_vault_id" {
  description = "The ID of the key vault the keypair will be saved to"
}

variable "expiry_date" {
  type = number
  description = "The expiration time of the secret, in years, for example 1"
  default = 3
}