resource "aws_iam_role" "lambda_role" {

  name  = "LambdaExecutionRole"

  assume_role_policy  = jsonencode ({

    Version  = "2012-10-17"

    Statement  = [

      {

        Effect = "Allow"

        Principal  = {

          Service  =  "lambda.amazonaws.com"

          }

        Action  = "sts:AssumeRole"


           }

           ]

            })

           }





resource "aws_iam_role_policy" "lambda_policy" {


  name = "LambdaPolicy"
 
  role = aws_iam_role.lambda_role.id

  policy = jsonencode ({

    Version = "2012-10-17"

    Statement = [
   
      {

      Effect = "Allow"

      Action = [

        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:UpdateItem"

       ]

      Resource = aws_dynamodb_table.visitor_counter.arn


       },

     {

      Effect = "Allow"

      Action = [

        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"

       ]

      Resource = "*"

       }

      ]

      })

   }

      

  




        

  