diff --git a/config/routes.rb b/config/routes.rb
index c06383a..a4996d2 100644
--- a/config/routes.rb
+++ b/config/routes.rb
@@ -1,3 +1,19 @@
 Rails.application.routes.draw do
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
+
+  resource :account, only: %i[edit update]
+
+  namespace :admin do
+    resources :users do
+      member do
+        post :masquerade
+      end
+    end
+  end
+
+  resources :dashboard, only: [:index]
+
+  get 'avatar/name/:full_name', to: 'avatar#name', as: :avatar_name
+
+  root to: 'dashboard#welcome'
 end
