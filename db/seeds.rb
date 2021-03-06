require 'faker'

for i in 1..50
  name = Faker::Name.first_name
  email = Faker::Internet.safe_email(name)

  user = User.new
  user.email = email
  user.name = name

  if user.save
    p "Saved user ##{i}: #{name} (#{email})"
    for ii in 1..50
      article = Article.new
      article.user = user
      article.title = Faker::Lorem.word
      article.content = Faker::Lorem.paragraph
      if article.save
        p "Articles ##{ii} saved for #{name}"
        for iii in 1..10
          comments = Comment.new
          comments.user = user
          comments.message = Faker::Lorem.paragraph
            if comments.save
              p "Comments ##{iii} save for #{name}"
            end
        end
      else
        p comment.errors
        p article.errors
      end
    end
  else
    p user.errors
  end
end