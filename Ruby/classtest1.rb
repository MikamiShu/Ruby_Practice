#クラスの継承の話
#親クラス
class Animal
    def initialize name, weight
        @name = name
        @weight = weight
    end

    def eat food
        p "eat#{food}"
    end
end

