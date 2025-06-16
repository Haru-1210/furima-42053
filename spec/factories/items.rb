FactoryBot.define do
  factory :item do
    item_name          { 'テスト商品' }
    description        { 'テスト商品の説明です。' }
    category_id        { 2 }  # 1 は {---} にしているので 2 以上にする
    condition_id       { 2 }
    shipping_charge_id { 2 }
    prefecture_id      { 2 }
    shipping_day_id    { 2 }
    price              { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec/fixtures/test_image.png')), filename: 'test_image.png')
    end
  end
end
