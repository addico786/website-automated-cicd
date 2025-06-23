resource "aws_s3_bucket" "my_bucket" {
    bucket = "${var.env}-static-bucket-18-jun-2025" 
}

resource "aws_s3_object" "html_file" {
    bucket = aws_s3_bucket.my_bucket.id
    key = "index.html"
    source = "../website/index.html"
    content_type = "text/html"
}