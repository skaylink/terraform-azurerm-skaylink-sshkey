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
resource "azurerm_resource_group" "resourcegroup" {
  name     = var.name
  location = var.location
  tags = {
    customTag1 = var.customTag1
    customTag2 = var.customTag2
    customTag3 = var.customTag3
    customTag4 = var.customTag4
    customTag5 = var.customTag5
  }
}
