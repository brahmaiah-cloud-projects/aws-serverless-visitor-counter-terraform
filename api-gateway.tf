resource "aws_api_gateway_rest_api" "visitor_api" {

  name = "VisitorCounterAPI"

  description = "API for Visitor Counter"

  }




resource "aws_api_gateway_resource" "visitor_resource" {

  rest_api_id = aws_api_gateway_rest_api.visitor_api.id

  parent_id = aws_api_gateway_rest_api.visitor_api.root_resource_id 

  path_part  =  "visitor" 


  }


resource "aws_api_gateway_method" "get_visitor" {

  rest_api_id = aws_api_gateway_rest_api.visitor_api.id

  resource_id = aws_api_gateway_resource.visitor_resource.id

  http_method = "GET"

  authorization = "NONE"

     }


resource "aws_api_gateway_integration" "lambda_integration" {

  rest_api_id = aws_api_gateway_rest_api.visitor_api.id

  resource_id =  aws_api_gateway_resource.visitor_resource.id

  http_method =  aws_api_gateway_method.get_visitor.http_method

  integration_http_method = "POST"

  type = "AWS_PROXY"

  uri = aws_lambda_function.visitor_counter.invoke_arn

   }


resource "aws_lambda_permission" "api_gateway_permission" {

  statement_id = "AllowAPIGatewaytoInvoke"

  action = "lambda:InvokeFunction"

  function_name = aws_lambda_function.visitor_counter.function_name

  principal = "apigateway.amazonaws.com"

  }


resource "aws_api_gateway_deployment" "visitor_deployment"  {

  rest_api_id = aws_api_gateway_rest_api.visitor_api.id

  depends_on = [

   aws_api_gateway_integration.lambda_integration 

    ]

    }

resource "aws_api_gateway_stage" "prod" {

  deployment_id  = aws_api_gateway_deployment.visitor_deployment.id 

  rest_api_id  = aws_api_gateway_rest_api.visitor_api.id 

  stage_name =   "prod"

  }


  
