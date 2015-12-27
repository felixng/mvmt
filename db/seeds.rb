# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'
include Sprig::Helpers

categories = Category.create([{ name: 'Circus' },
                              { name: 'Dance' },
                              { name: 'Crossfit' },
                              { name: 'Parkour' },
                              { name: 'Gymnastics' }
                             ])


=begin
user1 = User.find_or_initialize_by(email: 'nfelix@gmail.com', first_name: 'Felix', last_name: 'Ng', is_admin: true, encrypted_password: 'Idontknow')

auth = Authentication.find_or_initialize_by(user: user1,
                                            provider: 'Facebook',
                                            proid: '10156275788830526',
                                            token: 'CAAWhOUEm27EBAKtcU47e9ZBwpZC5zvcKyv67DPmHuxgfPMyJuW2BAnyoWD6q0YC4klTWEfhdM2eES3kTm5sZAPyqtIUWfZBueNLOn29X5lgG1CdNngLqgXVV8agKldewsFisESLOS21sF3yAUOaenYfU4vXVyzZA65Se9BMW3Bu5VryTZAoiJyf3uZCiv1qEnMZD')

user1.save!
=end

=begin
Google = {
    :class  => Resource,
    :source => open('https://spreadsheets.google.com/feeds/list/1p_57ky6F0791RZd0baSSBI9wuqs1hydLydEPs5ANlYE/1/public/values?alt=json'),
    :parser => Sprig::Parser::GoogleSpreadsheetJson,
    :option => find_existing_by['name']
}

sprig [
          Google
      ]
=end