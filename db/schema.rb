# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200821020631) do

  create_table "action_mailbox_inbound_emails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "status", default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_user_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "admin_user_id"
    t.string "function"
    t.string "function_role"
    t.time "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_admin_user_roles_on_admin_user_id"
  end

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.string "email"
    t.string "token", collation: "utf8_bin"
    t.time "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
  end

  create_table "bank_accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "user_id", null: false
    t.string "encrypted_bank_code", null: false
    t.string "encrypted_bank_code_iv", null: false
    t.string "encrypted_bank_branch_id"
    t.string "encrypted_bank_branch_id_iv"
    t.string "encrypted_account_type", null: false
    t.string "encrypted_account_type_iv", null: false
    t.string "encrypted_account_number", null: false
    t.string "encrypted_account_number_iv", null: false
    t.string "encrypted_account_holder_name", null: false
    t.string "encrypted_account_holder_name_iv", null: false
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bank_accounts_on_user_id", unique: true
  end

  create_table "bank_branches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "bank_id"
    t.string "bank_code"
    t.string "code"
    t.string "name"
    t.string "name_kana"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "banks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.string "code"
    t.string "name"
    t.string "name_kana"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "prefecture_id"
    t.integer "major_city_id"
    t.string "slug"
    t.string "name"
    t.string "ruby"
    t.string "kana"
    t.decimal "lat", precision: 17, scale: 14
    t.decimal "lon", precision: 17, scale: 14
    t.index ["lat", "lon"], name: "index_cities_on_lat_and_lon"
    t.index ["lat"], name: "index_cities_on_lat"
    t.index ["lon"], name: "index_cities_on_lon"
    t.index ["major_city_id"], name: "index_cities_on_major_city_id"
    t.index ["name"], name: "index_cities_on_name"
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
    t.index ["slug"], name: "index_cities_on_slug"
  end

  create_table "coupon_distributions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "coupon_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_coupon_distributions_on_coupon_id"
    t.index ["user_id"], name: "index_coupon_distributions_on_user_id"
  end

  create_table "coupon_limitations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "coupon_id"
    t.integer "total_discount"
    t.integer "total_distribution"
    t.integer "total_uses"
    t.integer "maximum_discount_per_use"
    t.integer "maximum_discount_per_night_per_person"
    t.integer "maximum_uses_per_user"
    t.integer "minimum_stays"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_coupon_limitations_on_coupon_id"
  end

  create_table "coupon_uses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "coupon_id"
    t.bigint "reservation_id"
    t.integer "discount_amount", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_coupon_uses_on_coupon_id"
    t.index ["reservation_id"], name: "index_coupon_uses_on_reservation_id"
  end

  create_table "coupons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.string "type"
    t.string "status", default: "enabled", null: false
    t.string "title", null: false
    t.string "code"
    t.datetime "distribution_since"
    t.datetime "distribution_until"
    t.datetime "available_since", null: false
    t.datetime "available_until", null: false
    t.date "stays_since"
    t.date "stays_until"
    t.string "discount_type", null: false
    t.integer "discount_amount", null: false
    t.boolean "auto_apply", default: false
    t.boolean "allow_combined_use", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["available_since"], name: "index_coupons_on_available_since"
    t.index ["available_until"], name: "index_coupons_on_available_until"
    t.index ["code"], name: "index_coupons_on_code", unique: true
    t.index ["distribution_since"], name: "index_coupons_on_distribution_since"
    t.index ["distribution_until"], name: "index_coupons_on_distribution_until"
  end

  create_table "currency_exchange_rates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.date "date", null: false
    t.string "base", limit: 3, null: false
    t.string "target", limit: 3, null: false
    t.decimal "rate", precision: 16, scale: 6, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date", "base", "target"], name: "index_currency_exchange_rates_on_date_and_base_and_target", unique: true
  end

  create_table "external_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.string "name"
    t.string "role"
    t.string "token", collation: "utf8_bin"
    t.string "site_code"
    t.datetime "deleted_at"
  end

  create_table "fax_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "reservation_id"
    t.string "sid"
    t.string "to"
    t.string "fax_status"
    t.string "error_code"
    t.string "error_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_fax_jobs_on_reservation_id"
  end

  create_table "line_groups", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.string "name"
    t.integer "ranking"
    t.index ["name"], name: "index_line_groups_on_name"
    t.index ["ranking"], name: "index_line_groups_on_ranking"
  end

  create_table "line_stations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "line_id"
    t.integer "station_id"
    t.integer "ranking"
    t.decimal "lat", precision: 17, scale: 14
    t.decimal "lon", precision: 17, scale: 14
    t.index ["lat", "lon"], name: "index_line_stations_on_lat_and_lon"
    t.index ["lat"], name: "index_line_stations_on_lat"
    t.index ["line_id", "station_id"], name: "index_line_stations_on_line_id_and_station_id", unique: true
    t.index ["line_id"], name: "index_line_stations_on_line_id"
    t.index ["lon"], name: "index_line_stations_on_lon"
    t.index ["ranking"], name: "index_line_stations_on_ranking"
    t.index ["station_id"], name: "index_line_stations_on_station_id"
  end

  create_table "lines", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "line_group_id"
    t.string "slug"
    t.string "name"
    t.string "short_name"
    t.string "ruby"
    t.integer "line_type"
    t.integer "ranking"
    t.index ["line_group_id"], name: "index_lines_on_line_group_id"
    t.index ["line_type"], name: "index_lines_on_line_type"
    t.index ["name"], name: "index_lines_on_name"
    t.index ["ranking"], name: "index_lines_on_ranking"
    t.index ["slug"], name: "index_lines_on_slug"
  end

  create_table "major_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "prefecture_id"
    t.string "slug"
    t.string "name"
    t.string "ruby"
    t.string "kana"
    t.index ["name"], name: "index_major_cities_on_name"
    t.index ["prefecture_id"], name: "index_major_cities_on_prefecture_id"
    t.index ["slug"], name: "index_major_cities_on_slug"
  end

  create_table "message_thread_messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "message_thread_id"
    t.bigint "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["message_thread_id"], name: "index_message_thread_messages_on_message_thread_id"
    t.index ["user_id"], name: "index_message_thread_messages_on_user_id"
  end

  create_table "message_thread_user_threads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "user_id"
    t.bigint "message_thread_id"
    t.boolean "is_star", default: false, null: false
    t.boolean "is_read", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["message_thread_id"], name: "index_message_thread_user_threads_on_message_thread_id"
    t.index ["user_id"], name: "index_message_thread_user_threads_on_user_id"
  end

  create_table "message_threads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "guest_id"
    t.integer "host_id"
    t.integer "reservation_id"
    t.integer "room_group_id"
    t.string "message_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "monthly_sales", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "user_id", null: false
    t.date "month", null: false
    t.string "paid_status", null: false
    t.integer "sales", default: 0, null: false
    t.integer "sales_fee", default: 0, null: false
    t.integer "service_fee", default: 0, null: false
    t.integer "fee_sum", default: 0, null: false
    t.integer "local_tax", default: 0, null: false
    t.integer "net_sales", default: 0, null: false
    t.integer "balance", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "month"], name: "index_monthly_sales_on_user_id_and_month", unique: true
    t.index ["user_id"], name: "index_monthly_sales_on_user_id"
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "user_id"
    t.string "model"
    t.bigint "model_id"
    t.string "notification_type"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "reservation_id"
    t.bigint "original_payment_id"
    t.string "reference_code"
    t.string "payment_method"
    t.string "service_id"
    t.integer "amount"
    t.string "status"
    t.text "full_response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reference_code"], name: "index_payments_on_reference_code"
    t.index ["reservation_id"], name: "index_payments_on_reservation_id"
  end

  create_table "payout_settings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "user_id"
    t.string "status"
    t.boolean "default", default: false
    t.string "payout_type"
    t.string "country_code", limit: 2
    t.string "zip_code"
    t.string "prefecture"
    t.string "city"
    t.string "addr1"
    t.string "addr2"
    t.string "apt_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["user_id"], name: "index_payout_settings_on_user_id"
  end

  create_table "pms_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "user_id", null: false
    t.bigint "property_id"
    t.string "login_id", null: false
    t.string "site_code", null: false
    t.string "encrypted_password", null: false
    t.string "token", collation: "utf8_bin"
    t.datetime "keep_same_token_by"
    t.time "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_pms_users_on_property_id"
    t.index ["user_id"], name: "index_pms_users_on_user_id"
  end

  create_table "prefectures", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.string "slug"
    t.string "name"
    t.string "short_name"
    t.string "ruby"
    t.string "kana"
    t.decimal "lat", precision: 17, scale: 14
    t.decimal "lon", precision: 17, scale: 14
    t.index ["lat", "lon"], name: "index_prefectures_on_lat_and_lon"
    t.index ["lat"], name: "index_prefectures_on_lat"
    t.index ["lon"], name: "index_prefectures_on_lon"
    t.index ["name"], name: "index_prefectures_on_name"
    t.index ["slug"], name: "index_prefectures_on_slug"
  end

  create_table "properties", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "user_id"
    t.integer "order"
    t.text "title"
    t.string "country_code", limit: 2
    t.string "zip_code"
    t.string "prefecture"
    t.string "city"
    t.text "hash_city"
    t.string "street_address"
    t.text "hash_street_address"
    t.string "apt_name"
    t.text "hash_apt_name"
    t.text "description"
    t.decimal "lat", precision: 16, scale: 14
    t.decimal "lon", precision: 17, scale: 14
    t.string "timezone", default: "Asia/Tokyo"
    t.string "property_type"
    t.text "route"
    t.text "hash_route"
    t.boolean "is_hotel_business_law", default: false
    t.boolean "is_open", default: false
    t.boolean "agreed_to_tax_payment", default: false, null: false
    t.string "code"
    t.date "notification_date"
    t.datetime "opened_at"
    t.datetime "created_by"
    t.datetime "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "property_disinfection_measures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "property_id"
    t.string "code"
    t.boolean "flg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id", "code"], name: "index_property_disinfection_measures_unique_key", unique: true
  end

  create_table "property_external_partner_disconnect_settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "property_id"
    t.string "site_code"
    t.boolean "disconnect_flg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_on_property_id"
  end

  create_table "property_external_partner_neppan_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "external_partner_id"
    t.string "neppan_user_code"
    t.string "neppan_user_id"
    t.string "encrypted_user_password"
    t.string "encrypted_user_password_iv"
    t.string "encrypted_password"
    t.string "encrypted_password_iv"
    t.integer "neppan_host_number"
    t.boolean "disconnect_price_flg", default: false
    t.boolean "save_fixed_reservation_price", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["external_partner_id"], name: "index_on_property_external_partners_id"
  end

  create_table "property_external_partners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "property_id"
    t.integer "area_id"
    t.string "site_code"
    t.string "external_property_id"
    t.string "status"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_external_partners_on_property_id"
  end

  create_table "property_photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "property_id"
    t.text "photo_data"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_photos_on_property_id"
  end

  create_table "property_reviews", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "property_id"
    t.integer "rating"
    t.integer "reviews"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_reviews_on_property_id"
  end

  create_table "property_verifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "property_id"
    t.string "url"
    t.string "status"
    t.text "reject_reason_detail"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_verifications_on_property_id"
  end

  create_table "reservation_affiliates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "reservation_id"
    t.string "affiliate_code", null: false
    t.string "tracking_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["affiliate_code"], name: "index_reservation_affiliates_on_affiliate_code"
    t.index ["reservation_id"], name: "index_reservation_affiliates_on_reservation_id"
  end

  create_table "reservation_assignments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "reservation_id"
    t.integer "room_id"
    t.date "date"
    t.string "status", null: false
    t.integer "adults", default: 0
    t.integer "children", default: 0
    t.integer "infants", default: 0
    t.integer "room_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_reservation_assignments_on_date"
    t.index ["reservation_id"], name: "index_reservation_assignments_on_reservation_id"
    t.index ["room_id"], name: "index_reservation_assignments_on_room_id"
  end

  create_table "reservation_external_receive_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "reservation_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_reservation_external_receive_details_on_reservation_id"
  end

  create_table "reservation_suppliers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "reservation_id"
    t.string "site_code"
    t.string "pincode"
    t.string "supplier_reservation_id"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_reservation_suppliers_on_reservation_id"
  end

  create_table "reservations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "room_group_id"
    t.string "reference_code"
    t.string "status"
    t.date "checkin"
    t.date "checkout"
    t.integer "checkin_time", limit: 2
    t.string "site_code"
    t.string "sales_code"
    t.string "external_reservation_id"
    t.bigint "user_id"
    t.string "user_name"
    t.string "user_phone_number"
    t.string "user_email"
    t.string "user_prefecture"
    t.integer "accommodation_fee"
    t.integer "service_fee"
    t.integer "service_fee_for_cancellation"
    t.decimal "service_fee_rate", precision: 5, scale: 4
    t.integer "sales_fee"
    t.integer "cleaning_fee"
    t.integer "discount_by_coupon", default: 0, null: false
    t.integer "consumption_tax"
    t.integer "local_tax"
    t.integer "total_price"
    t.integer "cancel_fee"
    t.text "remarks"
    t.string "payment_type"
    t.string "currency"
    t.integer "local_total_price"
    t.integer "total_stay_adults"
    t.integer "total_stay_children"
    t.integer "total_stay_infants"
    t.datetime "host_actioned_at"
    t.datetime "expired_at"
    t.string "cancelled_by"
    t.datetime "cancelled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "settled_at"
    t.index ["external_reservation_id"], name: "index_reservations_on_external_reservation_id"
    t.index ["reference_code"], name: "index_reservations_on_reference_code", unique: true
    t.index ["room_group_id"], name: "index_reservations_on_room_group_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "reservation_id"
    t.integer "overall", limit: 1
    t.integer "cleanliness", limit: 1
    t.integer "facilities", limit: 1
    t.integer "location", limit: 1
    t.integer "safety", limit: 1
    t.text "comment"
    t.string "language"
    t.datetime "completed_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id"
  end

  create_table "room_calendar_sources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "room_id"
    t.string "name", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id", "url"], name: "index_room_calendar_sources_on_room_id_and_url", unique: true
    t.index ["room_id"], name: "index_room_calendar_sources_on_room_id"
  end

  create_table "room_calendars", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "room_id"
    t.date "date"
    t.boolean "is_open", default: false
    t.string "status"
    t.bigint "calendar_source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["calendar_source_id"], name: "fk_rails_0faeb84f18"
    t.index ["date"], name: "index_room_calendars_on_date"
    t.index ["room_id", "date"], name: "index_room_calendars_on_room_id_and_date"
    t.index ["room_id"], name: "index_room_calendars_on_room_id"
  end

  create_table "room_external_partners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "room_id"
    t.string "site_code"
    t.string "external_property_id"
    t.string "external_room_id"
    t.string "external_rate_id"
    t.string "status"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_external_partners_on_room_id"
  end

  create_table "room_group_amenities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "room_group_id"
    t.string "amenity_type"
    t.boolean "flg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_group_id"], name: "index_room_group_amenities_on_room_group_id"
  end

  create_table "room_group_basic_price_settings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "room_group_id"
    t.integer "base_price"
    t.integer "minimum_price", default: 1000
    t.integer "weekly_discount"
    t.integer "cleaning_fee"
    t.integer "daily_cleaning_fee"
    t.integer "price_for_extra_person"
    t.integer "persons_for_extra_fee"
    t.integer "weekend_price"
    t.boolean "is_friday_weekend", default: false, null: false
    t.boolean "is_saturday_weekend", default: false, null: false
    t.boolean "is_sunday_weekend", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_group_id"], name: "index_room_group_basic_price_settings_on_room_group_id"
  end

  create_table "room_group_bed_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "room_group_id"
    t.string "bed_type"
    t.integer "num"
    t.boolean "flg", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_group_id"], name: "index_room_group_bed_types_on_room_group_id"
  end

  create_table "room_group_calendar_sources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "room_group_id"
    t.string "name", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_group_id", "url"], name: "index_room_group_calendar_sources_on_room_group_id_and_url", unique: true
    t.index ["room_group_id"], name: "index_room_group_calendar_sources_on_room_group_id"
  end

  create_table "room_group_calendars", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "room_group_id"
    t.date "date"
    t.boolean "is_open", default: false
    t.integer "price", default: 0
    t.integer "inventories", default: 0
    t.integer "reservations", default: 0
    t.integer "intervals", default: 0
    t.bigint "calendar_source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["calendar_source_id"], name: "fk_rails_13bb332b70"
    t.index ["date"], name: "index_room_group_calendars_on_date"
    t.index ["room_group_id", "date"], name: "index_room_group_calendars_on_room_group_id_and_date", unique: true
    t.index ["room_group_id"], name: "index_room_group_calendars_on_room_group_id"
  end

  create_table "room_group_cancel_policies", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "room_group_id"
    t.string "cancel_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_group_id"], name: "index_room_group_cancel_policies_on_room_group_id"
  end

  create_table "room_group_external_partners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "room_group_id"
    t.string "site_code"
    t.string "external_property_id"
    t.string "external_room_id"
    t.string "external_rate_id"
    t.string "status"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_group_id"], name: "index_room_group_external_partners_on_room_group_id"
  end

  create_table "room_group_home_safeties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "room_group_id"
    t.text "check_list"
    t.text "fire_extinguisher"
    t.text "gas_isolation_valve"
    t.text "fire_alarm"
    t.text "exit_guidance"
    t.string "emergency_phone_number"
    t.string "police_phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_group_id"], name: "index_room_group_home_safeties_on_room_group_id"
  end

  create_table "room_group_house_rules", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "room_group_id"
    t.string "house_rule_type"
    t.boolean "flg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_group_id"], name: "index_room_group_house_rules_on_room_group_id"
  end

  create_table "room_group_icalendar_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "room_group_id"
    t.string "token", collation: "utf8_bin"
    t.time "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_group_id"], name: "index_room_group_icalendar_tokens_on_room_group_id"
  end

  create_table "room_group_photos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "room_group_id"
    t.boolean "is_open", default: false, null: false
    t.text "caption"
    t.text "hash_caption"
    t.text "photo_data"
    t.integer "order", default: 0, null: false
    t.string "photo_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_group_id"], name: "index_room_group_photos_on_room_group_id"
  end

  create_table "room_group_reservation_requirements", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "room_group_id"
    t.integer "accept_days", default: 0
    t.integer "accept_days_hour", default: 0
    t.integer "interval_days"
    t.integer "auto_extended_month_span"
    t.boolean "is_auto_extended", default: true
    t.integer "minimum_stays"
    t.integer "maximum_stays"
    t.integer "checkin_from", limit: 2
    t.integer "checkin_to", limit: 2
    t.integer "checkout_to", limit: 2
    t.boolean "is_instant_booking", default: true, null: false
    t.boolean "is_able_onsite_payment", default: false
    t.text "before_checkin_message"
    t.text "checkin_instruction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_group_id"], name: "index_room_group_reservation_requirements_on_room_group_id"
  end

  create_table "room_group_reviews", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "room_group_id"
    t.integer "rating"
    t.integer "reviews"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_group_id"], name: "index_room_group_reviews_on_room_group_id"
  end

  create_table "room_groups", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "property_id"
    t.integer "origin_id"
    t.integer "order"
    t.text "room_title"
    t.text "house_rule", limit: 16777215
    t.text "house_manual"
    t.text "description"
    t.float "size", limit: 24
    t.string "room_type"
    t.integer "maximum_guests"
    t.integer "beds"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "bathtubs"
    t.integer "base_inventories"
    t.boolean "is_shared_bath", default: false
    t.string "law_type"
    t.boolean "is_open", default: false
    t.boolean "is_edit_complete", default: false, null: false
    t.datetime "opened_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["origin_id"], name: "index_room_groups_on_origin_id"
    t.index ["property_id"], name: "index_room_groups_on_property_id"
  end

  create_table "room_icalendar_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "room_id"
    t.string "token", collation: "utf8_bin"
    t.time "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_icalendar_tokens_on_room_id"
  end

  create_table "room_verifications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "room_id"
    t.string "law_type"
    t.string "url"
    t.string "status"
    t.text "reject_reason_detail"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_verifications_on_room_id"
  end

  create_table "rooms", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "room_group_id"
    t.string "code"
    t.date "notification_date"
    t.string "name"
    t.text "hash_name"
    t.string "lodging_operator_name"
    t.boolean "is_open", default: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_group_id"], name: "index_rooms_on_room_group_id"
  end

  create_table "spots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "prefecture_id"
    t.integer "city_id"
    t.string "name"
    t.text "categories"
    t.string "street_address"
    t.decimal "lat", precision: 17, scale: 14
    t.decimal "lon", precision: 17, scale: 14
    t.index ["city_id"], name: "index_spots_on_city_id"
    t.index ["lat"], name: "index_spots_on_lat"
    t.index ["lon"], name: "index_spots_on_lon"
    t.index ["name"], name: "index_spots_on_name", unique: true
    t.index ["prefecture_id"], name: "index_spots_on_prefecture_id"
  end

  create_table "stations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.integer "prefecture_id"
    t.integer "city_id"
    t.string "slug"
    t.string "name"
    t.string "ruby"
    t.decimal "lat", precision: 17, scale: 14
    t.decimal "lon", precision: 17, scale: 14
    t.index ["city_id"], name: "index_stations_on_city_id"
    t.index ["lat", "lon"], name: "index_stations_on_lat_and_lon"
    t.index ["lat"], name: "index_stations_on_lat"
    t.index ["lon"], name: "index_stations_on_lon"
    t.index ["name"], name: "index_stations_on_name"
    t.index ["prefecture_id"], name: "index_stations_on_prefecture_id"
    t.index ["slug"], name: "index_stations_on_slug"
  end

  create_table "user_attributes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "user_id"
    t.string "gender"
    t.date "birthday"
    t.string "school", limit: 500
    t.string "area", limit: 500
    t.string "emergency_number"
    t.string "company_name"
    t.string "contact_person"
    t.text "campsite_name"
    t.text "supported_languages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_attributes_on_user_id"
  end

  create_table "user_identities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "user_id"
    t.string "address"
    t.string "email_endorsement_key"
    t.string "unconfirmed_email_endorsement_key"
    t.string "phone_number_endorsement_key"
    t.string "unconfirmed_phone_number_endorsement_key"
    t.index ["user_id"], name: "index_user_identities_on_user_id"
  end

  create_table "user_notification_settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "user_id"
    t.boolean "newsletter_flg", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_notification_settings_on_user_id", unique: true
  end

  create_table "user_photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "user_id"
    t.text "photo_url"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_photos_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC" do |t|
    t.string "uid"
    t.string "provider"
    t.string "openid_id"
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "country_code", limit: 2
    t.string "prefecture"
    t.binary "email", limit: 255
    t.string "unconfirmed_email"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "after_sign_up_path", limit: 512
    t.text "introduction"
    t.string "phone_number"
    t.string "unconfirmed_phone_number"
    t.string "phone_number_verification_code"
    t.datetime "phone_number_verification_code_sent_at"
    t.datetime "phone_number_confirmed_at"
    t.datetime "phone_number_connected_at"
    t.string "phone_number_sid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "token", collation: "utf8_bin"
    t.datetime "token_expired_at"
    t.datetime "remember_created_at"
    t.string "stripe_id"
    t.integer "sign_in_fail_count", default: 0, null: false
    t.datetime "sign_in_failed_at"
    t.datetime "deleted_at"
    t.string "language"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cities", "major_cities", on_update: :cascade, on_delete: :cascade
  add_foreign_key "cities", "prefectures", on_update: :cascade, on_delete: :cascade
  add_foreign_key "coupon_distributions", "coupons", on_update: :cascade, on_delete: :cascade
  add_foreign_key "coupon_distributions", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "coupon_limitations", "coupons", on_update: :cascade, on_delete: :cascade
  add_foreign_key "coupon_uses", "coupons", on_update: :cascade, on_delete: :cascade
  add_foreign_key "coupon_uses", "reservations", on_update: :cascade, on_delete: :cascade
  add_foreign_key "line_stations", "lines", on_update: :cascade, on_delete: :cascade
  add_foreign_key "line_stations", "stations", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lines", "line_groups", on_update: :cascade, on_delete: :cascade
  add_foreign_key "major_cities", "prefectures", on_update: :cascade, on_delete: :cascade
  add_foreign_key "property_disinfection_measures", "properties", on_update: :cascade, on_delete: :cascade
  add_foreign_key "reservation_affiliates", "reservations", on_update: :cascade, on_delete: :cascade
  add_foreign_key "reservation_assignments", "reservations", on_update: :cascade, on_delete: :cascade
  add_foreign_key "reservation_assignments", "rooms", on_update: :cascade, on_delete: :nullify
  add_foreign_key "reviews", "reservations", on_update: :cascade, on_delete: :cascade
  add_foreign_key "room_calendars", "room_calendar_sources", column: "calendar_source_id", on_delete: :nullify
  add_foreign_key "room_group_calendars", "room_group_calendar_sources", column: "calendar_source_id", on_delete: :nullify
  add_foreign_key "room_groups", "room_groups", column: "origin_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "spots", "cities", on_update: :cascade, on_delete: :cascade
  add_foreign_key "spots", "prefectures", on_update: :cascade, on_delete: :cascade
  add_foreign_key "stations", "cities", on_update: :cascade, on_delete: :cascade
  add_foreign_key "stations", "prefectures", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_notification_settings", "users"
end
