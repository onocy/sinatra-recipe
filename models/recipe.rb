class Recipe
    attr_reader :name, :url, :description, :author, :ingredients, :method

    attr_accessor :id

    def initialize(id, name, url, description, author, ingredients, method)
        @id = id
        @name = name
        @url = url 
        @description = description 
        @author = author
        @ingredients = ingredients
        @method = method
    end

    def ingredients_count
        @ingredients.length
    end

    def method_count
        @method.length
    end
end