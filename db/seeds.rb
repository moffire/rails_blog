LOREM_IPSUM = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
USERS = ['Alex', 'Bob', 'John']

def get_random_image
  File.open("/Users/a1/Downloads/ruby/blog/app/assets/images/image#{rand(1..6)}.jpg")
end


Category.create(name: 'uncategorized', id: 1)

#create random Users for db
3.times do |t|
  User.create(name: USERS[t - 1], email: "user#{t}@mail.ru", password: 'password', password_confirmation: 'password')
end

#create random Posts for db
10.times do |i|
  Post.create(title: "Пост номер #{i + 1}", summary: "Краткое описание для поста #{i + 1}", body: LOREM_IPSUM, user_id: rand(1..3), views: rand(6), category_id: 1, image: get_random_image)
end