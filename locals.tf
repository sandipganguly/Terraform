locals {
  tags = "${merge(var.Base_Tag,map("Name","MyVPC","Env","DEV"))}"
}
