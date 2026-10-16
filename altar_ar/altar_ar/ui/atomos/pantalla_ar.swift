//
//  pantalla_ar.swift
//  altar_ar
//
//  Created by alumno on 10/16/26.
//

import SwiftUI
import RealityKit


struct PantallaAR: View {
    @Environment(Controlador.self) var control
    
    var body: some View {
        switch(control.estado){
        case .cargando:
            Text("Cargando")
        case .en_inicio:
            RealityView{ teatro in
                teatro.camera = .spatialTracking
                teatro.add(control.escena)
            }
        }
    }
}
