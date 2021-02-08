require "cron_scheduler"

module EyeCare
	extend self

	VERSION = "1.0.0"

	def notify
		begin
			Process.exec(`
				terminal-notifier 
				-title "Eye care" 
				-message "Close your eyes for 10 seconds"
				-appIcon "https://i.imgur.com/dr1LzFE.png" 
				-sound "Hero" 
				-group "995" 
				-ignoreDnD
			`)
		rescue exception
		end
	end
end

CronScheduler.define do 
	at("*/20 * * * *") { EyeCare.notify }
end

sleep