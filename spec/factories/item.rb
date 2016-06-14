FactoryGirl.define do
  factory :item do
    sequence :name do |n|
      "name #{n}"
    end
    sequence :description do |n|
      "description #{n}"
    end
    sequence :image_url do |n|
      "www.example.com/#{n}"
    end
  end
end
