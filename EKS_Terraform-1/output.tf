output "cluster_id" {
  value = aws_eks_cluster.princewill_proj.id
}

output "node_group_id" {
  value = aws_eks_node_group.princewill_proj.id
}

output "vpc_id" {
  value = aws_vpc.princewill_proj_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.princewill_proj_subnet[*].id
}
