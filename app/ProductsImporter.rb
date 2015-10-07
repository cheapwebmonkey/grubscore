class ProductsImporter

  def self.run
    ...
    # read the CSV files and assigns rows to variable rows

    ActiveRecord::Base.transaction do
      rows.each do |row|
        p = Product.find_or_initialize_by_product_id(row[:product_id])
        p.assign_attributes(row)
        p.save!
      end
    end
  end
end