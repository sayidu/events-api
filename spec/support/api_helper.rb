module ApiHelper
  def json
    JSON.parse(response.body)
  end

  def random_bearer_token(user = nil)
    user = user.present? ? user : FactoryBot.create(:user)
    ::Auth::Jwt.encode_token({ email: user.email })
  end
end
