resource "datadog_monitor" "check" {
  name    = "Redmine status"
  type    = "service check"
  message = "[FIRING] {{host.name}} not respond!"
  query   = "\"http.can_connect\".over(\"instance:redmine_status\").by(\"host\",\"instance\",\"url\").last(5).count_by_status()"
}
