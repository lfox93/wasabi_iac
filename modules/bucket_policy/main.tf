resource "wasabi_bucket_policy" "bucket" {
    bucket = var.bukcet_id
    policy = data.wasabi_policy_document.bucket.json
}

data "wasabi_policy_document" "bucket" {
    statement {
        principals {
            type = "AWS"
            identifiers = concat(var.ro_users, var.rw_users)
        }
        actions = [
            "s3:Get*",
            "s3:List*",
        ]
        resources = ["${var.bucket_arn}"]
    }

    statement {
        principals {
            type = "AWS"
            identifiers = var.rw_users
        }
        actions = [
            "s3:*Object"
        ]
        resources = ["${var.bucket_arn}"]
    }
}
