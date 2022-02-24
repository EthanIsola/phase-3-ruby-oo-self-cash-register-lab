class CashRegister
    attr_reader :discount
    attr_accessor :total, :items, :transactions
    def initialize(employee_discount = 0)
        @total = 0
        @discount = employee_discount
        @items = []
        @transactions = []
    end

    def add_item(title, price, quantity = 1)
        self.total += (price * quantity)
        self.transactions << (price * quantity)
        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        if self.discount != 0
            self.total = self.total - self.discount*10
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        if self.transactions.length != 0
            self.total -= self.transactions[-1]
            self.transactions.pop
        else
            "No recent transactions"
        end
    end
    
end