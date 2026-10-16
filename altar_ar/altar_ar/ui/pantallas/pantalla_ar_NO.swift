//
//  pantalla_ar.swift
//  altar_ar
//
//  Created by alumno on 10/12/26.
//

import SwiftUI
import RealityKit
import catrina_ar_modelos


struct ContentView: View {
    @State var imagen_1: AnchorEntity? = nil
    @State var imagen_2: AnchorEntity? = nil
    
    @State var leyenda = "No hay distancia"
    
    var body: some View {
        RealityView{ escenario in
            escenario.camera = .spatialTracking
            
            imagen_1 = AnchorEntity(.image(group: "ar", name: "perrito"))
            
            imagen_2 = AnchorEntity(.image(group: "ar", name: "perritos"))
            
            let caja_1 = ModelEntity(mesh: .generateSphere(radius: 0.1))
            
            guard let caja_2 = try? await Entity(named: "escena", in: catrina_ar_modelosBundle) else {
                fatalError("Hey, el nombre de la escena no es correcto")
            }
            
            
            imagen_1?.addChild(caja_1)
            imagen_2?.addChild(caja_2)
            
            escenario.add(imagen_1!)
            escenario.add(imagen_2!)
            
            escenario.subscribe(to: SceneEvents.Update.self, { _ in
                let posision_imagen_1 = imagen_1?.position(relativeTo: nil)
                let posicion_imagen_2 = imagen_2?.position(relativeTo: nil)
                
                let distancia = simd_distance(posicion_imagen_2!, posision_imagen_1!)
                
                leyenda = "La distancia es \(distancia)"
            })
            
        }
        
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(leyenda)
        }
        .padding()
    }
}
