badges = [
    ['Backend success',
     'https://d6dyoorq84mou.cloudfront.net/uploads/employer/logo/85059/profile_BountyBoard_Graphics_badge.png',
     'Category', 'Backend'],

    ['Level completed',
     'https://www.laurentide.com/wp-content/uploads/2017/04/af2e834c1e23ab30f1d672579d61c25a_15.png',
     'Level', '2'],

    ['Successful First Attempt',
     'https://d2rkc2nazts3p9.cloudfront.net/combined/846/graphics/badges/goodrow_5.png',
     'Attempt', '1']

]

badges.each do |name, url_file, rule_name, rule_value|
  Badge.create!(  name: name,
                  url_file: url_file,
                  rule_name: rule_name,
                  rule_value: rule_value )
end