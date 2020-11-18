class Factura
    def initialize(entries)
        if(entries.length < 3)
            puts "Favor de proporcionar todos los parámetros para la facturación. \nParámetros: Cantidad, Precio Unitario y Estado."
            exit
        end
        @impuestos = {"CA" => 8.25}
        
        @cantidad = entries[0]
        @precio = entries[1]
        @estado = entries[2]
    end

    //
    def inputValidation()
        @cantidad = validateCantidad()
        @precio = validatePrecio()
        @estado = validateEstado()
        puts "Cantidad: #{@cantidad}, Precio: #{@precio}, Estado: #{@estado}"
    end

    def doProcess()
        'Calcular subtotal (Cantidad * Precio Unitario)'
        subtotal = @cantidad * @precio

        'Elegir el porcentaje de descuento'
        case 
        when (subtotal > 1000) && (subtotal <= 5000)
            descuento = 3.0
        when (subtotal > 5000) && (subtotal <= 7000)
            descuento = 5.0
        when (subtotal > 7000) && (subtotal <= 10000)
            descuento = 7.0
        when (subtotal > 10000) && (subtotal <= 50000)
            descuento = 10
        when subtotal > 50000
            descuento = 15
        else
            descuento = 0.0
        end
        
        'Calcular el monto de descuento'
        montodescuento = (descuento * subtotal)/100

        'Elegir porcentaje de impuesto'
        impuesto = @impuestos.fetch(@estado.upcase, 0.0)

        'Calcular monto de impuesto'
        montoimpuesto = (impuesto * subtotal)/100

        

        
        
        puts "Subtotal: #{subtotal}"
        puts "%Descuento: #{descuento}%"
        puts "Descuento a aplicar: #{montodescuento}"
        puts "%Impuesto: #{impuesto}%"
        puts "Impuesto a aplicar: #{montoimpuesto}"
        
        
    end
    
    def validateCantidad()
        if (!isNumeric?(@cantidad) | !isInteger?(@cantidad))
            puts "Favor de proporcionar el parámetro Cantidad en formato numérico entero."
            exit
        end
        if (Integer(@cantidad) <= 0)
            puts "Favor de proporcionar el parámetro Cantidad con valor mayor a cero."
            exit
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
            exit
        end
        return Float(@precio)
    end

    def validateEstado()
        if (isNumeric?(@estado))
            puts "Favor de proporcionar el parámetro Estado en formato string."
            exit
        end
        if (@estado.length != 2 )
            puts "Favor de proporcionaro el parametro Estado con valor de dos caracteres."
            exit
        end
        return String(@estado)
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
facturacion.doProcess()
