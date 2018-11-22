resource "aws_api_gateway_resource" "bucketResource" {
  rest_api_id = "${aws_api_gateway_rest_api.apiGateway.id}"
  parent_id   = "${aws_api_gateway_rest_api.apiGateway.root_resource_id}"
  path_part   = "{bucket}"
}

resource "aws_api_gateway_resource" "folderResource" {
  rest_api_id = "${aws_api_gateway_rest_api.apiGateway.id}"
  parent_id   = "${aws_api_gateway_resource.bucketResource.id}"
  path_part   = "{folder}"
}

resource "aws_api_gateway_resource" "itemResource" {
  rest_api_id = "${aws_api_gateway_rest_api.apiGateway.id}"
  parent_id   = "${aws_api_gateway_resource.folderResource.id}"
  path_part   = "{item}"
}
