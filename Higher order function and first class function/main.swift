import Foundation

var num1 = 3

//CLOSURE OF HIGH ORDER

//CLOSURE STRUCTURE
//Closure long structure
/*
let longClosure: (Int, Int) -> Int = {
    (num1: Int, num2: Int) -> Int in
        return num1 + num2
    
}

var result = longClosure(1, 2)
print("Resultado del tipo de función Closure en sú estructura larga es: \(result). \n")


//Closure short structure
let shortClosure = { (number1: Int, number2: Int) in
    return number1 + number2
    
}

result = shortClosure(1, 2)
print("Resultado del tipo de función Closure en sú estructura corta es: \(result).\n")

//Very short closure structure inside a function
var numbers = [1, 2, 3, 4, 5]

var results = numbers.map { $0 * 2 }
print("Resultado del tipo de función Closure en sú estructura muy corta es: \(results).")
*/

/*
func sum (closure: (Int, Int) -> Int) {
    let result = closure(5, 3)
    print("El resultado es \(result)")
    
}

sum { (a, b) in
    return a + b

}
 */

//FUNTIONAL PARADIGM: FIRST CLASS FUNCTION
/*
//The functions can be assigned to variables
var greeting = { (name: String) in
    return print("Hola \(name), ¿Cómo estas?")
    
}

greeting("Natalia")
*/

//FUNTIONAL PARADIGM: HIGHER ORDER FUNCTION
/*
//The functions can be used as argument of the another function
let customers = [
    [ "name": "David", "lastname": "Guerrero", "status": "Activo" ],
    [ "name": "Alejandro", "lastname": "Guerrero", "status": "Pasivo" ],
    [ "name": "Guerrero", "lastname": "Guerrero", "status": "Activo" ]
    
]

//This ↓ is a first class function because it can be passed as an argument to another function
func activeUser ( customers: [String: String] ) -> Bool {
    return customers["status"] == "Activo"
}

let activeCustomers = customers.filter { customer in
    return activeUser(customers: customer)
}

print(activeCustomers)


//Functions can return another functions
func name<genericType> (firstName: genericType) -> (genericType) -> Void {
    return { lastName in
        print("Su nombre completo es: \(firstName) \(lastName)")
    }
}

let firstNamePerson = name(firstName: "David")
let fullName = firstNamePerson("Guerrero")
*/

//EXERCISE
//1. Definir una función de orden superior llamada operar. Llegan como parámetro dos enteros y una función. En el bloque de la función llamar a la función que llega como parámetro y enviar los dos primeros parámetros. La función retorna un entero.
/*
func operar ( _ entero1: Int, _ entero2: Int, salida: (Int, Int) -> Int ) -> Int {
    return salida(entero1, entero2)
    
}

var sumanum = operar(2, 4) { numero1, numero2 in
    return numero1 + numero2
    
}

print("Los la suma de los números enteros son: \(sumanum)")
*/


//2. Declarar una clase que almacene el nombre y la edad de una persona. Definir un método que retorne True o False según si la persona es mayor de edad o no. Este método debe recibir como parámetro una función que al llamarla pasando la edad de la persona retornará si es mayor o no de edad. Tener en cuenta que una persona es mayor de edad en Estados Unidos si tiene 21 o más años y en Argentina si tiene 18 o más años.
/*
class Persona {
    var nombre: String
    var edad: Int
    
    init (nombre: String, edad: Int) {
        self.nombre = nombre
        self.edad = edad
        
    }
    
    func mayorEdad (_ regionRecidencia: Int, determinarEdad: (Int, Int) -> Bool? ) -> Bool? {
        return determinarEdad( edad, regionRecidencia )
        
    }
    
}

//Declaración del objeto Juanito
let juanito = Persona( nombre: "Juanito", edad: 19 )
var region = 0

print("\nMENU: \n\nDigite el número con respecto a su lugar de recidencia: \n\n1. Estados Unidos. \n2. Japón. \n3. Canada. \n4. El resto de paises del mundo.")

if let lugarRecidencia = Int(readLine()!) {
    region = lugarRecidencia
    
} else {
    print("\n‼️ Solo se pueden escribir números. ‼️")
    
}

//Determinar estado de juanito
let estadoEdad = juanito.mayorEdad(region) { edad, regionRecidencia in
    switch regionRecidencia {
        case 1:
            if edad >= 21 {
                return true
                
            } else {
                return false
                
            }
        break;
        
        case 2:
            if edad >= 20 {
                return true
                
            } else {
                return false
                
            }
        break;
        
        case 3:
            if edad >= 19 {
                return true
                
            } else {
                return false
                
            }
        break;
        
        case 4:
            if edad >= 18 {
                return true
                
            } else {
                return false
                
            }
        break;
        
        default:
            print("‼️ Opción no válida. ‼️")
    }
    return nil
    
}
            
if estadoEdad == true {
    print("\nEres mayor de edad.")
    
} else if estadoEdad == false {
    print("\nEres menor de edad.")
    
}
*/


//3. Escribir una función que aplique un descuento a un precio y otra que aplique el IVA a un precio. Escribir una tercera función que reciba un diccionario con los precios y porcentajes de una cesta de la compra, y una de las funciones anteriores, y utilice la función pasada para aplicar los descuentos o el IVA a los productos de la cesta y devolver el precio final de la cesta.
/*
//Lista de productos comprados
var listaCompra: [(String, Float, Float)] = [
    //Estructura de la TUPLA: Producto, precio unitario, cantidad de productos comprados, costo total
    ("Panela", 15000.0, 10.0),
    ("Limon", 1000.0, 2.0),
    ("Chocolates", 6000.0, 5.0),
    ("Arroz", 9000.0, 3.0),
    ("Lentejas", 4500.0, 14.0)
]

//Calcula el costo total (IVA + descuento) de cada producto
func costoProducto ( _ productos: [(String, Float, Float)], descuento: (Float, Float) -> (Float), iva: (Float, Float) -> (Float) ) -> Float {
    var precioFinal: [Float] = []
    for producto in productos {
        precioFinal.append( Float( iva(15.0, producto.1) - descuento(10.0, producto.1) + producto.1 ) )
        
    }
    return Float( precioFinal.reduce(0) { acumulador, precioFinalUnitario -> Float in
        return acumulador + precioFinalUnitario
        
    } )
    
}

//Guardar el costo individal de cada producto
var precioFinal = costoProducto ( listaCompra, descuento: { descuentoProducto, precio in
    return ((precio / 100) * descuentoProducto)
    
}, iva: { ivaProducto, precio in
    return ((precio / 100) * ivaProducto)
    
} )


print("El costo total de tú compra es: \(precioFinal)")
*/
