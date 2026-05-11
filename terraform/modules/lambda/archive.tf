data "archive_file" "lambda_zip_archive" {
  type        = "zip"
  source_dir  = var.lambda_source_path
  output_path = "${path.module}/${var.function_name}.zip"
}