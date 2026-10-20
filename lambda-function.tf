resource "aws_lambda_function" "visitor_counter" {

  function_name = "LambdaVisitorCounterFunction"

  role = aws_iam_role.lambda_role.arn

  runtime  = "python3.12"

  handler  = "lambda_function.lambda_handler"

  filename =  "LambdaCode/lambda_function.zip"

  timeout =  10

  environment {

    variables  =  {

      TABLE_NAME = aws_dynamodb_table.visitor_counter.name



  }

  }

 }





  


