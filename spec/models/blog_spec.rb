require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe "validations" do
    it { should validate_presence_of(:blog_name) }
  end

  it "should belongs to user" do
    t = Blog.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end

  context "Callbacks test" do  
    it "create " do
      @blogs = FactoryBot.create(:blog)
      puts "successfully save"
      expect(@blogs.run_callbacks(:save)).to eq (true)
    end
  end 

  describe "scopes" do
    describe ".high_score" do
      let(:high_score_blog) { create(:blog, blog_score: 80) }
      it "returns blogs with high scores" do
        expect(Blog.high_score).to include(high_score_blog)
      end
    end
  end

   describe "instance methods" do
    describe "#summary" do
      it "returns a summarized content" do
        blog = create(:blog, blog_name: "user blog", content: "This is the content of the blog. It's quite lengthy and needs to be summarized.")
        summary = blog.summary
        expect(summary).to eq("user blog: This is the content of the blog. It's quite len...")
      end
    end
  end
end
