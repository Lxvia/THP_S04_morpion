class BoardCase
    
    attr_accessor :value, :case_id # la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
  
    
    def initialize(value, case_id) # régle sa valeur, ainsi que son numéro de case
        @value = value
        @case_id = case_id
      
    end
    
  end