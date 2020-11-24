class Product < ApplicationRecord
	validates :name, :presence => true
	validates :product_category_code, :presence => true
	 validates :material_code, uniqueness: true

	

	before_save :generate_timestamp

	require 'csv'

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|			
            product_hash = Product.new
            product_hash.name = row[0]
            product_hash.material_code = row[1]
            product_hash.product_category_code = row[2]
            product_hash.status = (row[3] == true || row[3] == 'true') ? 1 : 0            
            product_hash.save!
        end
	end

  def generate_timestamp
    self.created_at = DateTime.now
    self.updated_at = DateTime.now
  end
end
