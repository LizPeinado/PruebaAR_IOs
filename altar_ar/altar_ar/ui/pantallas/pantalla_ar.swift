//
//  pantalla_ar.swift
//  altar_ar
//
//  Created by alumno on 10/12/26.
//

import SwiftUI
import RealityKit

struct PantallaAr: View {
    
    @State var leyenda = "No has pulsado nada"
    
    var body: some View {
        RealityView { escenario in
            escenario.camera = .spatialTracking
                
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
