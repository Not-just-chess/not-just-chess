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

ActiveRecord::Schema.define(version: 20_191_207_012_424) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bishops', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'chess_pieces', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'type'
    t.integer 'game_id'
    t.boolean 'color'
    t.boolean 'captured'
    t.integer 'x_position'
    t.integer 'y_position'
    t.string 'htmlcode'
    t.boolean 'has_moved', default: false
    t.index ['game_id'], name: 'index_chess_pieces_on_game_id'
  end

  create_table 'games', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.integer 'white_player_id'
    t.integer 'black_player_id'
    t.integer 'winner'
    t.boolean 'checkmate', default: false
    t.boolean 'forfeited', default: false
    t.integer 'turn_player_id'
    t.integer 'loser'
    t.boolean 'draw', default: false
    t.index ['black_player_id'], name: 'index_games_on_black_player_id'
    t.index ['draw'], name: 'index_games_on_draw'
    t.index ['loser'], name: 'index_games_on_loser'
    t.index ['turn_player_id'], name: 'index_games_on_turn_player_id'
    t.index ['user_id'], name: 'index_games_on_user_id'
    t.index ['white_player_id'], name: 'index_games_on_white_player_id'
    t.index ['winner'], name: 'index_games_on_winner'
  end

  create_table 'kings', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'knights', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'pawns', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'queens', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'rooks', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'provider'
    t.string 'uid'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
