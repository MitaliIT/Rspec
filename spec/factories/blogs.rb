FactoryBot.define do
  factory :blog do
    blog_name {"user blog"}
    blog_score { 80 }
    content {"hii user"}
    user_id {1}
  end
end
