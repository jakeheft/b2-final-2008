Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :hospitals, only: [:show]

  resources :doctors, only: [:show]

  delete '/doctors/:doctor_id/patients/:patient_id', to: 'doctor_patients#destroy'

  resources :patients, only: [:index]
end
