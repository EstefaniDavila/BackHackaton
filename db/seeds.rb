# # This file should ensure the existence of records required to run the application in every environment (production,
# # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Example:
# #
# #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
# #     MovieGenre.find_or_create_by!(name: genre_name)
# #   end

# irb(main):001* Admin.create(
# irb(main):002*   first_name: "tefa",
# irb(main):003*   last_name: "dav",
# irb(main):004*   full_name: "tef dav",
# irb(main):005*   email: "estefanidavila02@utp.edu.pe",
# irb(main):006*   document_number: "12312312",
# irb(main):007*   document_type: "DNI",
# irb(main):008*   gender: 1,
# irb(main):009> )
#   TRANSACTION (0.2ms)  BEGIN
#   Admin Create (0.8ms)  INSERT INTO "admins" ("first_name", "last_name", "full_name", "email", "document_number", "document_type", "gender", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING "id"  [["first_name", "tefa"], ["last_name", "dav"], ["full_name", "tef dav"], ["email", "estefanidavila02@utp.edu.pe"], ["document_number", "12312312"], ["document_type", "DNI"], ["gender", 1], ["created_at", "2025-11-11 09:35:34.286800"], ["updated_at", "2025-11-11 09:35:34.286800"]]
#   User Create (0.7ms)  INSERT INTO "users" ("email", "document_number", "password_digest", "avatar", "phone", "status", "roleable_type", "roleable_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING "id"  [["email", "estefanidavila02@utp.edu.pe"], ["document_number", "12312312"], ["password_digest", "[FILTERED]"], ["avatar", nil], ["phone", nil], ["status", 0], ["roleable_type", "Admin"], ["roleable_id", "101c734d-0110-460b-bd60-4877a7d0d854"], ["created_at", "2025-11-11 09:35:34.526207"], ["updated_at", "2025-11-11 09:35:34.526207"]]
#   TRANSACTION (1.0ms)  COMMIT
# => 
# #<Admin:0x000073098b5827a0
#  id: "101c734d-0110-460b-bd60-4877a7d0d854",
#  first_name: "tefa",
#  last_name: "dav",
#  full_name: "tef dav",
#  email: "estefanidavila02@utp.edu.pe",
#  document_number: "12312312",
#  document_type: "DNI",
#  gender: 1,
#  created_at: Tue, 11 Nov 2025 09:35:34.286800000 UTC +00:00,
#  updated_at: Tue, 11 Nov 2025 09:35:34.286800000 UTC +00:00>
# irb(main):010* Member.create(
# irb(main):011*   first_name: "abigail",
# irb(main):012*   last_name: "dav",
# irb(main):013*   full_name: "tef dav",
# irb(main):014*   email: "u24230547@utp.edu.pe",
# irb(main):015*   document_number: "12345678",
# irb(main):016*   document_type: "DNI",
# irb(main):017*   gender: 1,
# irb(main):018> )
#   TRANSACTION (0.1ms)  BEGIN
#   Member Create (0.7ms) 