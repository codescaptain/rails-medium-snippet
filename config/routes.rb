Rails.application.routes.draw do
  namespace 'api' do
    get "article" => "articles#generate", format: :svg
  end
end