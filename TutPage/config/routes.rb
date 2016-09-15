TutPage::Application.routes.draw do
 resource :recipes
 root "recipes#index"
end
