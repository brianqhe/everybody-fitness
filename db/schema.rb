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

ActiveRecord::Schema.define(version: 2021_03_14_094444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Initial image storage was using active storage but since changed to cloudinary to not congest storage, all table values are default values
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  # Initial image storage was using active storage but since changed to cloudinary to not congest storage, all table values are default values
  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  # Initial image storage was using active storage but since changed to cloudinary to not congest storage, all table values are default values  
  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  # Created a conversations model that would record the recipient user_id and the sender user_id. Model acts as a join table that will record whether or not users have a conversations with another user.
  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  # Created experiences model that records a description of what experience the user is trying to add to their profile. The model has a foreign key that will reference it to the relevant profile.
  create_table "experiences", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "profile_id", null: false
    t.index ["profile_id"], name: "index_experiences_on_profile_id"
  end

  # Created Messages model that will take text as its message. The Messages model will be referenced to the current user_id and also a conversation where the current user_id is the sender.
  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id", null: false
    t.bigint "user_id", null: false
    # There is also a boolean value for whether or not the message has been read so that users can see if they have any unread messages.
    t.boolean "read", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  # Profile model that will take the first and last name as a string input upon creation. Sex and cities are pre-populated values in the form that will be selected in a dropdown to prevent manipulation of data.
  create_table "profiles", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "sex", null: false
    t.string "city", null: false
    # Biography is taken as text input
    t.text "biography", null: false
    # Foreign key will link the profile to the current user_id in the Profiles controller
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  # Created Profiles_Specialties join table to check whether a certain profile has a certain specialty ticked. 
  create_table "profiles_specialties", force: :cascade do |t|
    # Profile_id is a foreign key that will reference the profile that is being created/editted with the relevant specialties
    t.bigint "profile_id", null: false
    # Specialty_id is a foreign key that will reference the specialty that is being called
    t.bigint "specialty_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_profiles_specialties_on_profile_id"
    t.index ["specialty_id"], name: "index_profiles_specialties_on_specialty_id"
  end

  # Searches model that will show the paramaters that were selected in the search. The only search parameters currently are first name, city and sex.
  create_table "searches", force: :cascade do |t|
    t.string "first_name"
    t.string "city"
    t.string "sex"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  # A Specialties model that has a pre-populated seed values. These will only have a description of what the specialty is. This will be referenced by the join table Profiles_Specialties
  create_table "specialties", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  # The users table created by Devise that will encrypt the password and other built in functions that come with the gem. Username was not deemed necessary.
  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  # All foreign keys that were referenced during migrations
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "experiences", "profiles"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "profiles_specialties", "profiles"
  add_foreign_key "profiles_specialties", "specialties"
end
