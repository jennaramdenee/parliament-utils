# Temporarily increasing to account for HybridBill document uploads
Rack::Timeout.timeout = 60 if defined?(Rack) && defined?(Rack::Timeout)
