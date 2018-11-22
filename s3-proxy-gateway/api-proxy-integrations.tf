resource "aws_api_gateway_integration" "itemPutMethod-ApiProxyIntegration" {
  rest_api_id = "${aws_api_gateway_rest_api.apiGateway.id}"
  resource_id = "${aws_api_gateway_resource.itemResource.id}"
  http_method = "${aws_api_gateway_method.itemPutMethod.http_method}"

  type                    = "AWS"
  integration_http_method = "PUT"
  credentials             = "${aws_iam_role.s3_proxy_role.arn}"
  uri                     = "arn:aws:apigateway:${var.region}:s3:path/{bucket}/{folder}/{item}"

  request_parameters {
    "integration.request.header.x-amz-meta-fileinfo" = "method.request.header.x-amz-meta-fileinfo"
    "integration.request.header.Accept"              = "method.request.header.Accept"
    "integration.request.header.Content-Type"        = "method.request.header.Content-Type"

    "integration.request.path.item"   = "method.request.path.item"
    "integration.request.path.folder" = "method.request.path.folder"
    "integration.request.path.bucket" = "method.request.path.bucket"
  }
}

resource "aws_api_gateway_integration" "itemGetMethod-ApiProxyIntegration" {
  rest_api_id = "${aws_api_gateway_rest_api.apiGateway.id}"
  resource_id = "${aws_api_gateway_resource.itemResource.id}"
  http_method = "${aws_api_gateway_method.itemGetMethod.http_method}"

  type                    = "AWS"
  integration_http_method = "GET"
  credentials             = "${aws_iam_role.s3_proxy_role.arn}"
  uri                     = "arn:aws:apigateway:${var.region}:s3:path/{bucket}/{folder}/{item}"

  request_parameters {
    "integration.request.path.item"   = "method.request.path.item"
    "integration.request.path.folder" = "method.request.path.folder"
    "integration.request.path.bucket" = "method.request.path.bucket"
  }
}

resource "aws_api_gateway_integration" "itemOptionsMethod-ApiProxyIntegration" {
  rest_api_id = "${aws_api_gateway_rest_api.apiGateway.id}"
  resource_id = "${aws_api_gateway_resource.itemResource.id}"
  http_method = "${aws_api_gateway_method.itemOptionsMethod.http_method}"
  type        = "MOCK"
  depends_on  = ["aws_api_gateway_method.itemOptionsMethod"]

  request_templates {
    "application/json" = <<EOF
        {
        "statusCode" : 200
        }
    EOF
  }
}
