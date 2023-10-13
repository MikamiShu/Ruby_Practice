class Cat
    def initialize name, weight
        @name = name
        @weight = weight
    end

    def eat food
        @weight += 1
        p "#{@weight}kg"
    end

    def cry
        p "meaoooooow"
    end
end