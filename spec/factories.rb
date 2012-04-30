FactoryGirl.define do
  
  
  factory :professor do
    first_name              Forgery(:name).first_name
    last_name               Forgery(:name).last_name
    password                "123456"
    password_confirmation   "123456"
    email                   Forgery(:internet).email_address
  end

  factory :student do    
    first_name { Forgery(:name).first_name }
    last_name  { Forgery(:name).last_name }
    email_1     Forgery(:internet).email_address
    degree      "PhD"
    
    trait :ms do
      degree   "Masters"
    end
    
    trait :current do
      status   "Current student"
    end
    
    trait :graduated do
      status   "Graduated"
    end
    
    trait :left_early do
      status   "Left program early"
    end
    
    factory :student_with_committee do
      
    end
  end
  
end