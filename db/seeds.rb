include FactoryBot::Syntax::Methods


category_1 = create(:category)
category_2 = create(:category)
category_3 = create(:category)
category_4 = create(:category)

product_1 = create(:product)
product_2 = create(:product)
product_3 = create(:product)
product_4 = create(:product)
product_5 = create(:product)
product_6 = create(:product)
product_7 = create(:product)
product_8 = create(:product)
product_9 = create(:product)
product_10 = create(:product)


ProductCategory.create!(product: product_1, category: category_1)
ProductCategory.create!(product: product_2, category: category_1)
ProductCategory.create!(product: product_3, category: category_1)
ProductCategory.create!(product: product_4, category: category_1)
ProductCategory.create!(product: product_5, category: category_1)

ProductCategory.create!(product: product_1, category: category_2)
ProductCategory.create!(product: product_2, category: category_2)
ProductCategory.create!(product: product_3, category: category_3)
ProductCategory.create!(product: product_4, category: category_3)
ProductCategory.create!(product: product_5, category: category_4)

ProductCategory.create!(product: product_6, category: category_2)
ProductCategory.create!(product: product_7, category: category_2)
ProductCategory.create!(product: product_8, category: category_2)
ProductCategory.create!(product: product_9, category: category_2)
ProductCategory.create!(product: product_10, category: category_2)

ProductCategory.create!(product: product_6, category: category_4)
ProductCategory.create!(product: product_7, category: category_4)
ProductCategory.create!(product: product_8, category: category_1)
ProductCategory.create!(product: product_9, category: category_1)
ProductCategory.create!(product: product_10, category: category_3)

create(:purchase, date: Time.zone.now,
        purchase_items_attributes: [ 
                                { product: product_1, quantity: 2},
                                { product: product_2, quantity: 1}
                                ]
)
create(:purchase, date: Time.zone.now,
    purchase_items_attributes: [ 
                            { product: product_3, quantity: 5},
                            { product: product_4, quantity: 12}
                            ]
)
create(:purchase, date: Time.zone.now,
    purchase_items_attributes: [ 
                            { product: product_3, quantity: 2},
                            { product: product_4, quantity: 2}
                            ]
)
create(:purchase, date: Time.zone.now,
    purchase_items_attributes: [ 
                            { product: product_1, quantity: 5},
                            { product: product_5, quantity: 10},
                            { product: product_10, quantity: 1}
                            ]
)
create(:purchase, date: Time.zone.now,
    purchase_items_attributes: [ 
                            { product: product_2, quantity: 4},
                            { product: product_6, quantity: 2},
                            { product: product_7, quantity: 6},
                            { product: product_10, quantity: 7}
                            ]
)
create(:purchase, date: Time.zone.now,
    purchase_items_attributes: [ 
                            { product: product_2, quantity: 9},
                            { product: product_5, quantity: 1},
                            { product: product_7, quantity: 1},
                            { product: product_9, quantity: 3},
                            { product: product_6, quantity: 4}
                            ]
)
create(:purchase, date: Time.zone.now,
    purchase_items_attributes: [ 
                            { product: product_1, quantity: 3},
                            { product: product_5, quantity: 1},
                            { product: product_7, quantity: 5},
                            { product: product_2, quantity: 5},
                            { product: product_4, quantity: 2}
                            ]
)
create(:purchase, date: Time.zone.now,
    purchase_items_attributes: [ 
                            { product: product_1, quantity: 4}
                            ]
)
create(:purchase, date: Time.zone.now,
    purchase_items_attributes: [ 
                            { product: product_1, quantity: 7}
                            ]
)
create(:purchase, date: Time.zone.now,
    purchase_items_attributes: [ 
                            { product: product_1, quantity: 6}
                            ]
)
create(:purchase, date: Time.zone.now,
    purchase_items_attributes: [ 
                            { product: product_1, quantity: 2}
                            ]
)
create(:purchase, date: Time.zone.now,
    purchase_items_attributes: [ 
                            { product: product_1, quantity: 8}
                            ]
)