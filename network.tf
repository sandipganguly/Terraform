resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  tags = merge(var.Base_Tag,map("Name","MyVPC","Env","DEV"))
  #tags = local.tags
}

resource "aws_subnet" "public_subnet" {
  #for_each=toset(var.public_subnet)
  for_each=var.public_subnet
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = cidrsubnet(aws_vpc.myvpc.cidr_block, 8, each.key)
  #tags = merge(var.Base_Tag,map("Name",join("Pub_Subnet",tostring(each.key))))
  tags = merge(var.Base_Tag,map("Name",format("Pub_Subnet_%s",each.key)))
}



#resource "aws_subnet" "private_subnet" {
#  for_each=toset(var.private_subnets_cnt)
#  vpc_id     = aws_vpc.myvpc.id
#  cidr_block = lookup(var.private_subnets[each.value],"cidr")
#  tags = {
#    Name = lookup(var.private_subnets[each.value],"Name")
#    ENV = lookup(var.private_subnets[each.value],"ENV")
#  }
#}

resource "aws_internet_gateway" "myig" {
  vpc_id = aws_vpc.myvpc.id
  tags = var.Base_Tag
}
