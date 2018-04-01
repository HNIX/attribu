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

ActiveRecord::Schema.define(version: 20180401160228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_campaigns_on_tenant_id"
  end

  create_table "destination_linksets", force: :cascade do |t|
    t.bigint "linkset_id"
    t.bigint "destination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_destination_linksets_on_destination_id"
    t.index ["linkset_id"], name: "index_destination_linksets_on_linkset_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.index ["tenant_id"], name: "index_destinations_on_tenant_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "domain"
    t.string "source"
    t.string "campaign"
    t.string "medium"
    t.bigint "linkset_id"
    t.bigint "destination_linkset_id"
    t.bigint "source_linkset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.index ["destination_linkset_id"], name: "index_links_on_destination_linkset_id"
    t.index ["linkset_id"], name: "index_links_on_linkset_id"
    t.index ["source_linkset_id"], name: "index_links_on_source_linkset_id"
    t.index ["tenant_id"], name: "index_links_on_tenant_id"
  end

  create_table "linksets", force: :cascade do |t|
    t.string "name"
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.index ["campaign_id"], name: "index_linksets_on_campaign_id"
    t.index ["tenant_id"], name: "index_linksets_on_tenant_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_members_on_tenant_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "email"
    t.string "token"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_payments_on_tenant_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "shortened_urls", force: :cascade do |t|
    t.integer "owner_id"
    t.string "owner_type", limit: 20
    t.text "url", null: false
    t.string "unique_key", limit: 10, null: false
    t.integer "use_count", default: 0, null: false
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.index ["owner_id", "owner_type"], name: "index_shortened_urls_on_owner_id_and_owner_type"
    t.index ["tenant_id"], name: "index_shortened_urls_on_tenant_id"
    t.index ["unique_key"], name: "index_shortened_urls_on_unique_key", unique: true
    t.index ["url"], name: "index_shortened_urls_on_url"
  end

  create_table "source_linksets", force: :cascade do |t|
    t.bigint "linkset_id"
    t.bigint "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["linkset_id"], name: "index_source_linksets_on_linkset_id"
    t.index ["source_id"], name: "index_source_linksets_on_source_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.string "medium"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.index ["tenant_id"], name: "index_sources_on_tenant_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.bigint "tenant_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "plan"
    t.index ["name"], name: "index_tenants_on_name"
    t.index ["tenant_id"], name: "index_tenants_on_tenant_id"
  end

  create_table "tenants_users", id: false, force: :cascade do |t|
    t.bigint "tenant_id", null: false
    t.bigint "user_id", null: false
    t.index ["tenant_id", "user_id"], name: "index_tenants_users_on_tenant_id_and_user_id"
  end

  create_table "user_campaigns", force: :cascade do |t|
    t.bigint "campaign_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_user_campaigns_on_campaign_id"
    t.index ["user_id"], name: "index_user_campaigns_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "skip_confirm_change_password", default: false
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "is_admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tenant_id"], name: "index_users_on_tenant_id"
  end

  add_foreign_key "campaigns", "tenants"
  add_foreign_key "destination_linksets", "destinations"
  add_foreign_key "destination_linksets", "linksets"
  add_foreign_key "links", "destination_linksets"
  add_foreign_key "links", "linksets"
  add_foreign_key "links", "source_linksets"
  add_foreign_key "links", "tenants"
  add_foreign_key "linksets", "campaigns"
  add_foreign_key "members", "tenants"
  add_foreign_key "members", "users"
  add_foreign_key "payments", "tenants"
  add_foreign_key "shortened_urls", "tenants"
  add_foreign_key "source_linksets", "linksets"
  add_foreign_key "source_linksets", "sources"
  add_foreign_key "tenants", "tenants"
  add_foreign_key "user_campaigns", "campaigns"
  add_foreign_key "user_campaigns", "users"
end
