output "lambda_function_name" {

  value = aws_lambda_function.visitor_counter.function_name

}

output "dynamodb_table_name" {

  value = aws_dynamodb_table.visitor_counter.name

}