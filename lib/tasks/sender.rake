require 'sms-uslugi-api'

namespace :sender do

	task sms: :environment do
		User.find_each do |user|
			unless user.phone.blank?
				sms = SmsUslugiApi.new 'Sergey-A', '2B%i74aL'
				sms.send "message to #{user.email}", user.phone
				puts "Send sms to user - #{user.email}"
			end	
		end	
	end	

	task mail: :environment do
		User.find_each do |user|
			UserMailer.welcome_email(user).deliver
			puts "send email to user - #{user.email}"
		end	
	end

end