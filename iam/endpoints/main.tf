data "google_iam_policy" "admin" {
  binding {
    role = "roles/viewer"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_endpoints_service_iam_policy" "policy" {
  service_name = google_endpoints_service.endpoints_service.service_name
  policy_data = data.google_iam_policy.admin.policy_data
}
