resource "aws_api_gateway_integration_response" "itemPutMethod-IntegrationResponse" {
  rest_api_id = "${aws_api_gateway_rest_api.apiGateway.id}"
  resource_id = "${aws_api_gateway_resource.itemResource.id}"
  http_method = "${aws_api_gateway_method.itemPutMethod.http_method}"

  status_code = "${aws_api_gateway_method_response.itemPutMethod200Response.status_code}"

  response_templates {
    "application/json" = ""
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
}

resource "aws_api_gateway_integration_response" "itemGetMethod-IntegrationResponse" {
  rest_api_id = "${aws_api_gateway_rest_api.apiGateway.id}"
  resource_id = "${aws_api_gateway_resource.itemResource.id}"
  http_method = "${aws_api_gateway_method.itemGetMethod.http_method}"

  status_code = "${aws_api_gateway_method_response.itemGetMethod200Response.status_code}"

  response_templates {
    "application/json" = ""
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
}

resource "aws_api_gateway_integration_response" "itemOptionsMethod-IntegrationResponse" {
  rest_api_id = "${aws_api_gateway_rest_api.apiGateway.id}"
  resource_id = "${aws_api_gateway_resource.itemResource.id}"
  http_method = "${aws_api_gateway_method.itemOptionsMethod.http_method}"
  status_code = "${aws_api_gateway_method_response.itemOptionsMethod200Response.status_code}"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,x-amz-meta-fileinfo'"
    "method.response.header.Access-Control-Allow-Methods" = "'GET,PUT,OPTIONS'"
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }

  response_templates {
    "application/json" = ""
  }

  depends_on = ["aws_api_gateway_method_response.itemOptionsMethod200Response", "aws_api_gateway_integration.itemOptionsMethod-ApiProxyIntegration"]
}
