# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# u = User.last
# @categories = []
# 10.times do |t|
#   c = Category.create(name: "Categoria #{t}" , description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit")
#   15.times do |tt|
#     p = Product.new(
#     p_name: "Producto #{tt}",
#     p_description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
#     p_price: 1000.00,
#     p_quantify: 50,
#     p_send: 200.00,
#     p_avaliable: true,
#     user_id: u.id,
#     )
#     p.categories = [c.id]
#     p.save
#     HasCategory.create(product:p, category:c)
#     5.times do |ttt|
#       Imagen.create(
#         title: "Imagen",
#         description: "",
#         product: p
#       )
#     end
#   end
# end
