locals {
  bucket_names = [
    "sales-data-bucket-1326-2024",
    "marketing-data-bucket-1226-2024",
    "engineering-data-bucket-1326-2024",
    "operations-data-bucket-1326-2024",
    "finance-data-bucket-1326-2024"
  ]

  user_names = [
    "alice",
    "bob",
    "charlie",
    "backup"
  ]
}

resource "wasabi_bucket" "buckets" {
    for_each = toset(local.bucket_names)
    bucket   = each.key
}

resource "wasabi_user" "users" {
    for_each = toset(local.user_names)
    name = each.key
}

module "set_engineering_policy" {
    source = "./modules/bucket_policy"
    bukcet_id = wasabi_bucket.buckets["engineering-data-bucket-1326-2024"].id
    bucket_arn = wasabi_bucket.buckets["engineering-data-bucket-1326-2024"].arn
    ro_users = [
                "${wasabi_user.users["alice"].arn}",
                "${wasabi_user.users["backup"].arn}",
                ]
    rw_users = [
                "${wasabi_user.users["bob"].arn}",
                ]
}

module "set_sales_policy" {
    source = "./modules/bucket_policy"
    bucket_arn = wasabi_bucket.buckets["sales-data-bucket-1326-2024"].arn
    bukcet_id = wasabi_bucket.buckets["sales-data-bucket-1326-2024"].id
    ro_users = [
                "${wasabi_user.users["backup"].arn}",
                ]
    rw_users = [
                "${wasabi_user.users["alice"].arn}",
                "${wasabi_user.users["bob"].arn}",
                ]
}

module "set_marketing_policy" {
    source = "./modules/bucket_policy"
    bucket_arn = wasabi_bucket.buckets["marketing-data-bucket-1226-2024"].arn
    bukcet_id = wasabi_bucket.buckets["marketing-data-bucket-1226-2024"].id
    ro_users = [
                "${wasabi_user.users["backup"].arn}",
                ]
    rw_users = [
                "${wasabi_user.users["alice"].arn}",
                "${wasabi_user.users["bob"].arn}",
                ]
}

module "set_operations_policy" {
    source = "./modules/bucket_policy"
    bucket_arn = wasabi_bucket.buckets["operations-data-bucket-1326-2024"].arn
    bukcet_id = wasabi_bucket.buckets["operations-data-bucket-1326-2024"].id
    ro_users = [
                "${wasabi_user.users["backup"].arn}",
                ]
    rw_users = [
                "${wasabi_user.users["charlie"].arn}",
                "${wasabi_user.users["bob"].arn}",
                ]
  
}

module "set_finance_policy" {
    source = "./modules/bucket_policy"
    bucket_arn = wasabi_bucket.buckets["finance-data-bucket-1326-2024"].arn
    bukcet_id = wasabi_bucket.buckets["finance-data-bucket-1326-2024"].id
    ro_users = [
                "${wasabi_user.users["charlie"].arn}",
                "${wasabi_user.users["backup"].arn}",
                ]
    rw_users = [
                "${wasabi_user.users["bob"].arn}",
                ]
}
