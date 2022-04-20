data "google_iam_policy" "admin" {
  binding {
    role = "roles/billing.viewer"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_billing_account_iam_policy" "editor" {
  billing_account_id = "00AA00-000AAA-00AA0A"
  policy_data        = data.google_iam_policy.admin.policy_data
}
