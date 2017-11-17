require 'bcrypt'
class User < ActiveRecord::Base
	has_many :answers
	has_many :questions
	validates :email, presence: true
	validates :email, uniqueness: true
	validates :name, presence: true
	validates :name, uniqueness: true
	has_secure_password
end

=begin
user = User.new(name: 'david', password: '', password_confirmation: 'nomatch')
user.save                                                       # => false, password required
user.password = 'mUc3m00RsqyRe'
user.save                                                       # => false, confirmation doesn't match
user.password_confirmation = 'mUc3m00RsqyRe'
user.save                                                       # => true
user.authenticate('notright')                                   # => false
user.authenticate('mUc3m00RsqyRe')                              # => user
User.find_by(name: 'david').try(:authenticate, 'notright')      # => false
User.find_by(name: 'david').try(:authenticate, 'mUc3m00RsqyRe') # => user	

	
=end