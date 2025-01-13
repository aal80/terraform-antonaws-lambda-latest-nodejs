data "archive_file" "function_zip" {
    type = "zip"
    source_dir = "${var.src_dir}"
    output_path = "./out/${var.function_name}.zip"
}

resource "aws_lambda_function" "function" {
    function_name = "${var.function_name}"
    role = aws_iam_role.execution_role.arn
    handler = "index.handler"
    filename = data.archive_file.function_zip.output_path
    source_code_hash = data.archive_file.function_zip.output_base64sha256
    runtime = "nodejs18.x"
}