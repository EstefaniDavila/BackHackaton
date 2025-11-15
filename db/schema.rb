# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_251_115_022_548) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'admins', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'first_name', default: '', null: false
    t.string 'last_name', default: '', null: false
    t.string 'full_name', default: '', null: false
    t.string 'email', default: '', null: false
    t.string 'document_number', default: '', null: false
    t.string 'document_type', default: '', null: false
    t.integer 'gender'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['document_number'], name: 'index_admins_on_document_number', unique: true
  end

  create_table 'blacklisted_tokens', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'token'
    t.uuid 'user_id', null: false
    t.datetime 'expire_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_blacklisted_tokens_on_user_id'
  end

  create_table 'members', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'first_name', default: '', null: false
    t.string 'last_name', default: '', null: false
    t.string 'full_name', default: '', null: false
    t.string 'email', default: '', null: false
    t.string 'document_number', default: '', null: false
    t.string 'document_type', default: '', null: false
    t.integer 'gender'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'role_member'
    t.uuid 'political_party_id'
    t.index ['document_number'], name: 'index_members_on_document_number', unique: true
    t.index ['political_party_id'], name: 'index_members_on_political_party_id'
  end

  create_table 'political_parties', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.string 'logo'
    t.string 'website'
    t.string 'plan_pdf'
    t.string 'acronym'
    t.string 'hq_address'
    t.string 'facebook_url'
    t.string 'twitter_url'
    t.string 'instagram_url'
    t.string 'youtube_url'
    t.string 'tiktok_url'
    t.text 'description'
    t.integer 'status'
    t.integer 'members_count', default: 0
    t.date 'founded_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['acronym'], name: 'index_political_parties_on_acronym', unique: true
  end

  create_table 'refresh_tokens', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'token'
    t.uuid 'user_id', null: false
    t.datetime 'expire_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['token'], name: 'index_refresh_tokens_on_token', unique: true
    t.index ['user_id'], name: 'index_refresh_tokens_on_user_id'
  end

  create_table 'user_tracks', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'os_data'
    t.string 'remote_ip'
    t.string 'browser_data'
    t.string 'aud'
    t.uuid 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_user_tracks_on_user_id'
  end

  create_table 'users', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'document_number', default: '', null: false
    t.string 'password_digest', default: '', null: false
    t.string 'avatar'
    t.string 'phone'
    t.integer 'status'
    t.string 'roleable_type', null: false
    t.uuid 'roleable_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['document_number'], name: 'index_users_on_document_number', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['phone'], name: 'index_users_on_phone', unique: true
    t.index %w[roleable_type roleable_id], name: 'index_users_on_roleable'
  end

  add_foreign_key 'blacklisted_tokens', 'users'
  add_foreign_key 'members', 'political_parties'
  add_foreign_key 'refresh_tokens', 'users'
  add_foreign_key 'user_tracks', 'users'
end
