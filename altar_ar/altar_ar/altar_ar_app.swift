//
//  altar_arApp.swift
//  altar_ar
//
//  Created by alumno on 10/12/26.
//

import SwiftUI

@main
struct altar_arApp: App {
    @State var controlador = Controlador()
    
    var body: some Scene {
        WindowGroup {
            PantallaAR()
                .environment(controlador)
        }
    }
}
