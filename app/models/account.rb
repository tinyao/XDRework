class Account < ActiveRecord::Base
  belongs_to :user

  BASE_FIELDS = [:personal_website, :location, :signature, :introduction, :weibo_link, :twitter_uid, :github_uid, :dribbble_uid]
  attr_accessible *BASE_FIELDS
  attr_accessible *BASE_FIELDS, :as => :admin

  validates :signature, :length => {:maximum => 20}

  before_create :set_default_value

  private
    def set_default_value
      self.personal_website ||= ''
      self.location ||= ''
      self.signature ||= ''
      self.introduction ||= ''
      self.twitter_uid ||= ''
      self.github_uid ||= ''
      self.dribbble_uid ||= ''
    end

end
