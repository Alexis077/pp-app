module Utils
  class PurchaseMatrix
    def initialize(purcases)
      @purcases = purcases
    end

    def print_matrix
      rows = Hash.new(0)
      @purcases.each do |v|
        rows[v.date.strftime("%d-%m-%Y %H:%M")] += 1
      end
      rows.map do |k, v|
        [k, v]
      end
    end
  end
end
