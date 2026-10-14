//
//  pantalla_ar.swift
//  altar_ar
//
//  Created by alumno on 10/12/26.
//

import SwiftUI
import RealityKit
import proyecto_ar

struct PantallaAr: View {
    
    @State var leyenda = "No has pulsado nada"
    
    @State var imagen_1: AnchorEntity? = nil
    @State var imagen_2: AnchorEntity? = nil
    
    var body: some View {
        RealityView { escenario in
            escenario.camera = .spatialTracking
            
            /*imagen_1 = AnchorEntity(.image(group: "ar", name: "perro"))
            
            imagen_2 = AnchorEntity(.image(group: "ra", name: "perro"))
            
            let caja_1 = ModelEntity(mesh: .generateSphere(radius: 0.1))
            
            let caja_2 = try? await Entity(named: "escena", in proyecto_arBundle) else fatalError("no hay ")
            
            imagen_1?.addChild(caja_1)
            imagen_2?.addChild(caja_2)
            
            escenario.add(imagen_1!)
            escenario.add(imagen_2!)
            
            escenario.subscribe(to:
                    let posicion_imagen_1 = imagen_1?.position(relativeTo: nil)
                    let posicion_imagen_2 = imagen_2?.position(relativeTo: nil)
                                
                    let distancia = sin_distancia(posicion_imagen_2!, posicion_imagen_1!)*/
                                
                                
            let ancla_ar_imagen = AnchorEntity(.image(group: "ar", name: "perro"))
            
            let caja = ModelEntity(mesh: .generateSphere(radius: 0.1))
            caja.model?.materials = [
                SimpleMaterial(color: .cyan, isMetallic: true)
            ]
            
            caja.generateCollisionShapes(recursive: true)
            
            caja.components.set(InputTargetComponent())
            
            caja.name = "caja que no es caja"
            
            ancla_ar_imagen.addChild(caja)
            
            escenario.add(ancla_ar_imagen)
        }.gesture(
            TapGesture().targetedToAnyEntity().onEnded{ evento_tap in
                leyenda = "has pulsado \(evento_tap.entity.name)"
            }
        )
        
        Text(leyenda)
    }
}
