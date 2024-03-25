# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

Rails.application.configure do
  config.content_security_policy do |policy|
    policy.default_src :self, :http, "http://127.0.0.1:3000"
    policy.font_src    :self, :http, :data
    policy.img_src     :self, :http, :data
    policy.object_src  :none
    policy.script_src  :self, :http
    policy.style_src   :self, :http
    policy.connect_src :self, :http, "http://127.0.0.1:3000"
    # policy.report_uri  "/csp-violation-report-endpoint" # Якщо потрібно
  end

  # Generate session nonces for permitted importmap, inline scripts, and inline styles.
  config.content_security_policy_nonce_generator = ->(request) { request.session.id.to_s }
  config.content_security_policy_nonce_directives = %w(script-src style-src)

  # Report violations without enforcing the policy.
  # config.content_security_policy_report_only = true
end