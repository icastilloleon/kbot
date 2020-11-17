class Factura
    def initialize(entries)
        if(entries.length < 3)
            puts "Favor de proporcionar todos los parámetros para la facturación. \nUsage: Cantidad, Precio Unitario y Estado."
            exit
        end
        @cantidad = entries[0]
    end

    //
    def inputValidation()
        @cantidad = validateCantidad()
    end
    
    def validateCantidad()
        if (!isNumeric?(@cantidad) | !isInteger?(@cantidad))
            puts "Favor de proporcionar el parámetro Cantidad en formato numérico entero."
            exit
        end
        return Integer(@cantidad)
    end

    def isNumeric?(value)
        Float(value) != nil rescue false
    end
    def isInteger?(value)
        Integer(value) != nil rescue false       
    end
    

end

facturacion = Factura.new(ARGV)
facturacion.inputValidation()