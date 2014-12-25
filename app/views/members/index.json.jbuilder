json.array!(@members) do |member|
  json.extract! member, :id, :login_id, :name, :kana, :birthday, :password,:nickname, :mail_address, :address, :point, :quit, :remember_token
  json.url member_url(member, format: :json)
end
