//
//  controlador.swift
//  altar_ar
//
//  Created by alumno on 10/16/26.
//

import RealityKit
import SwiftUI
import catrina_ar_modelos

@Observable
class Controlador{
    private(set) var estado: EstadosControlador = .cargando
    private(set) var escena: Entity = Entity()
    
    init(){
        //escena.name = "raiz"
        Task.detached(priority: .high) {
            //todo lo de aqui dentro debe ser de tipo asincrino
            await self.carga_asincrona()
        }
    }
    
    func carga_asincrona() async {
        defer {
            //Defer significa que lo que este dentro sera lo ultimo en hacerse
            estado = .en_inicio
        }
        
        let imagen = AnchorEntity(.image(group: "ar", name: "perro"))
        
        //let caja = ModelEntity(mesh: .generateCylinder(height: 0.1 , radius: 0.1))
        
        guard let caja = try? await Entity(named: "catrina_ar_modelos", in: catrina_ar_modelosBundle) else {
            fatalError("Modelo no encontrado")
        }
        
        
        imagen.addChild(caja)
        
        escena.addChild(imagen)
    }
}

enum EstadosControlador{
    case cargando
    case en_inicio
}
