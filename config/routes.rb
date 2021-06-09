Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      scope :accounts do
        get 'account_summary/:user_id/:account_id' => 'accounts#account_summary'
        post 'transfer/:user_id/:account_id' => 'accounts#transfer'
      end
    end
  end
end
