class Factura
    def initialize(entries)
        if(entries.length < 3)
            puts "Favor de proporcionar todos los parámetros para la facturación. \nParámetros: Cantidad, Precio Unitario y Estado."
            exit
        end
        @cantidad = entries[0]
        @precio = entries[1]
    end

    //
    def inputValidation()
        @cantidad = validateCantidad()
        validatePrecio()
    end
    
    def validateCantidad()
        if (!isNumeric?(@cantidad) | !isInteger?(@cantidad))
            puts "Favor de proporcionar el parámetro Cantidad en formato numérico entero."
            exit
        end
        if (Integer(@cantidad) <= 0)
            puts "Favor de proporcionar el parámetro Cantidad con valor mayor a cero."
        end
        return Integer(@cantidad)
    end

    def validatePrecio()
        if (!isNumeric?(@precio))
            puts "Favor de proporcionar el parámetro Precio en formato numérico."
            exit
        end
        if (Float(@precio) <= 0)
            puts "Favor de proporcionar el parámetro Precio con valor mayor a cero."
        end
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