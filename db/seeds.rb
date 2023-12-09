# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
User.create!(
  gym_id: "#{n + 1}",
  name: "テスト#{n + 1}",
  email: "test@email#{n + 1}",
  password: "test_pass#{n + 1}",
  description: "自己紹介#{n + 1}",
  is_active: true
  )
end

5.times do |n|
Gym.create!(
  gym_name: "エニタイム#{n + 1}",
  postcode: "100000#{n + 1}",
  address: "東京都千代田区#{n + 1}",
  fee: "#{n + 1}000",
  is_open: true
  )
end

5.times do |n|
TrainingRecord.create!(
  user_id: "#{n + 1}",
  content: "トレーニングの一言コメント#{n + 1}"
  )
end

Menu.create!(
    [
        {name: "ベンチプレス "},
        {name: "スミスマシン・ベンチプレス"},
        {name: "インクライン・ベンチプレス"},
        {name: "ダンベル・ベンチプレス "},
        {name: "ダンベル・フライ"},
        {name: "ケーブル・クロスオーバー"},
        {name: "懸垂(チンニング)"},
        {name: "ベントオーバーロウ"},
        {name: "ケーブル・プルオーバー"},
        {name: "デッドリフト"},
        {name: "トップサイド・デッドリフト"},
        {name: "ルーマニアン・デッドリフト"},
        {name: "スモウ・デッドリフト"},
        {name: "ペック・フライ"},
        {name: "ナロー・ベンチプレス"},
        {name: "インクライン・ダンベル・ベンチプレス"},
        {name: "インクライン・ダンベルフライ"},
        {name: "アイソラテラル・デクライン・プレス"},
        {name: "アイソラテラル・インクライン・プレス"},
        {name: "ワンハンド・ダンベル・ローイング"},
        {name: "ロー・プーリー・ロウ"},
        {name: "ラット・プルダウン"},
        {name: "アイソラテラル・ロウ"},
        {name: "アイソラテラル・プルダウン"},
        {name: "レッグ・エクステンション"},
        {name: "レッグ・カール"},
        {name: "レッグ・プレス"},
        {name: "バーベル・カール"},
        {name: "ダンベル・カール"},
        {name: "オルタネイト・ダンベル・カール"},
        {name: "インクライン・ダンベル・カール"},
        {name: "プリーチャー・カール"},
        {name: "スパイダー・カール"},
        {name: "ケーブル・カール"},
        {name: "トライセプス・プレスダウン"},
        {name: "トライセプス・プッシュダウン"},
        {name: "トライセプス・エクステンション"},
        {name: "ケーブル・オーバーヘッドエクステンション"},
        {name: "サイドレイズ"},
        {name: "ワンハンド・サイドレイズ"},
        {name: "インクライン・サイドレイズ"},
        {name: "ケーブル・サイドレイズ"},
        {name: "ダンベル・ショルダープレス"},
        {name: "バーベル・ショルダープレス"},
        {name: "スミスマシン・ショルダープレス"},
        {name: "バーベル・バックプレス"},
        {name: "フロントレイズ"},
        {name: "インクライン・フロントレイズ"},
        {name: "リアレイズ"},
        {name: "インクライン・リアレイズ"},
        {name: "リアデルトフライ"},
        {name: "クランチ"},
        {name: "シットアップ"},
        {name: "レッグレイズ"},
        {name: "アブローラー（腹筋ローラー）"},
        {name: "ハンギング・レッグレイズ"},
        {name: "スクワット"},
        {name: "ハックスクワット"},
        {name: "レッグ・プレス"},
        {name: "レッグ・エクステンション"},
        {name: "レッグ・カール"},
        {name: "カーフ・レイズ"}
    ]
)
  
5.times do |n|
Detail.create!(
  training_record_id: "#{n + 1}",
  menu_id: "#{n + 1}",
  weight: 92.5,
  rep: 10,
  set: 5
  )
end  

Admin.create!(
  email: "test_admin@email",
  password: "test_admin"
  )

# attributesがうまくいかない
# TrainingRecord.create!({
#   user_id: 1,
#   content: "やばい疲れたw かなり追い込めたから明日やばそう、早めに寝る",
#   details_attributes: [
#     {
#       weight: 92.5,
#       rep: 10,
#       set: 5
#     }]
# })