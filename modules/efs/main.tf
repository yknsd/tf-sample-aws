/*************************
 Elastic File System (EFS)
 - Amazon EC2 インスタンス用のシンプルでスケーラブルな共有ファイルストレージサービス
 - AWS 無料利用枠。リージョナルファイルシステムを含む 5 GB の EFS Standard ストレージが 12 か月間提供されます。AWS 無料利用枠は、One Zone ストレージファイルシステムタイプに保存されているファイルには適用されません。
 - 無料利用枠の使用量は、AWS GovCloud リージョンを除くすべての AWS リージョンで毎月計算され、自動的に請求額に適用されます。未使用分は持ち越されません。制限が適用されます。

 Document: https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html
 *************************/
resource "aws_efs_file_system" "example" {
  performance_mode  = var.performance_mode
  throughput_mode   = var.throughput_mode

  tags = {
    Name = "example-efs-file-system"
  }
}

resource "aws_efs_backup_policy" "example_policy" {
  file_system_id = aws_efs_file_system.example.id

  backup_policy {
    status = "DISABLED"
  }
}

resource "aws_efs_mount_target" "example_mt" {
  count             = length(var.subnets)
  file_system_id    = aws_efs_file_system.example.id
  subnet_id         = element(var.subnets, count.index)
  security_groups   = var.sg_ids
}
