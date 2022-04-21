resource "google_compute_instance_iam_member" "member" {
  project = google_compute_instance.default.project
  zone = google_compute_instance.default.zone
  instance_name = google_compute_instance.default.name
  role = "roles/compute.osLogin"
  member = "user:examplemail@gmail.com"
}
