crumb :root do
  link "Home", root_path
end

crumb :iniciar_sesion do
  link "Iniciar Sesión", new_user_session_path
  parent :root
end

crumb :new_sesion do
  link "Registrase", new_user_registration_path
  parent :iniciar_sesion
end

crumb :search do
  link "Busqueda", home_search_path
  parent :root
end

crumb :car do
  link "Mi Carrito De Compras", home_car_path
  parent :root
end

crumb :products do
  link "Resumen De Productos", home_products_path
end

crumb :productos do
  link "Productos", products_path
end

crumb :new_product do |product|
  link "Nueva Categoria", new_product_path(product)
  parent :productos, product
end

crumb :show_product do |product|
  link "#{product.p_name}", product_path(product)
  parent :productos, product
end

crumb :edit_product do |product|
  link "Editar #{product.p_name}", edit_product_path(product)
  parent :productos, product
end

crumb :edit_product_imagen do |product|
  link "Editar Imagen", edit_product_imagen_path(product)
  parent :show_product, product
end

crumb :new_product_imagen do |product|
  link "Nueva Imagen", new_product_imagen_path(product)
  parent :show_product, product
end

# categorias
crumb :categories do
  link "Categorias", categories_path
end

crumb :new_category do |category|
  link "Nueva Categoria", new_category_path(category)
  parent :categories, category
end

crumb :show_category do |category|
  link "Categoria #{category.name}", category_path(category)
  parent :categories, category
end

crumb :edit_category do |category|
  link "Editar #{category.name}", edit_category_path(category)
  parent :categories, category
end

crumb :administrador do
  link "Administracion", home_administrador_path
end

crumb :reputacion do
  link "Reputación", home_reputation_path
end

crumb :purchases do
  link "Compras", home_purchases_path
end

crumb :sales do
  link "Ventas", home_sales_path
end

crumb :summary do
  link "Resumen", home_summary_path
end

crumb :history do
  link "Historial", home_history_path
end

crumb :favorites do
  link "Favoritos", home_favorites_path
end

crumb :users do
  link "Usuarios", users_path
end

crumb :user_show do |user|
  link user.name, user_path(user)
  parent :root
end

crumb :user_edit do |user|
  link user.name, edit_user_path(user)
  parent :summary
end

crumb :user_password_edit do |user|
  link user.name, cambiar_password_user_path(user)
  parent :root
end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
