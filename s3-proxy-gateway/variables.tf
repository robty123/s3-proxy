//----------------------------------------------------------------------
// Shared Variables
//----------------------------------------------------------------------
variable "environment" {}

variable "region" {}

//----------------------------------------------------------------------
// API Gateway Variables
//----------------------------------------------------------------------

variable "supported_binary_media_types" {
  description = "Supported file types"
  type        = "list"

  # NOTE: application/octet-stream is the least specific MIME type. It basically just stores the bytes and assumes the consuming application will know what to do with them.
  # On testing it appears you dont need any of the content types below after application/octet-stream. After uploading a variety of different file types I was able to download them all and open 
  # them up successfully. The only issue was when issuing a GET request in postman for a jpeg file it would display the encoded bytes instead of the image. However, 
  # if you open the same jpeg file up on the desktop in an image-viewer there was no problem. The content types below after the application/octet-stream just assist some applications in opening
  # the files up. Also note there is a limit of 25 media types allowed in aws api gateway.
  default = [
    "application/octet-stream",
    "image/jpeg",
    "image/gif",
    "image/png",
    "image/bmp",
    "image/svg+xml",
    "application/pdf",
    "application/msword",                                                      #.doc, .dot
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document", #.docx 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.template", #.dotx
    "application/vnd.ms-word.document.macroEnabled.12",                        #.docm
    "application/vnd.ms-word.template.macroEnabled.12",                        #.dotm 
    "application/vnd.ms-excel",                                                #.xls, .xlt, .xla
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",       #.xlsx
    "application/vnd.openxmlformats-officedocument.spreadsheetml.template",    #.xltx
    "application/vnd.ms-excel.sheet.macroEnabled.12",                          #.xlsm
    "application/vnd.ms-excel.template.macroEnabled.12",                       #.xltm
    "application/vnd.ms-excel.addin.macroEnabled.12",                          #.xlam     
    "application/vnd.ms-excel.sheet.binary.macroEnabled.12",                   #.xlsb
    "application/vnd.ms-powerpoint",                                           #.ppt, .pot, .pps, .ppa 
    "application/zip",
    "application/x-7z-compressed",
    "text/plain",
    "image/tiff",
    "image/x-dcraw",                                                           # Digital raw image
  ]
}
