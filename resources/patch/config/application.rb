diff --git a/config/application.rb b/config/application.rb
index 6361fad..6853e60 100644
--- a/config/application.rb
+++ b/config/application.rb
@@ -19,5 +19,14 @@ module Shiny
     # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
     # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
     # config.i18n.default_locale = :de
+
+    config.i18n.enforce_available_locales = true
+
+    config.action_view.field_error_proc = Proc.new { |html_tag, instance| "<div class=\"field_with_errors has-error\">#{html_tag}</div>".html_safe }
+
+    config.app_name = Module.nesting.last.name
+    config.domain_name = "#{config.app_name.downcase}.com"
+    config.email_sender = "noreply@#{config.domain_name}"
+    config.canonical_hostname = "www.#{config.domain_name}"
   end
 end
