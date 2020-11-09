Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :hospitals, only: [:show]

  resources :doctors, only: [:show]

  delete '/doctor_patients/:doctor_id/:patient_id', to: 'doctor_patients#destroy'
end
