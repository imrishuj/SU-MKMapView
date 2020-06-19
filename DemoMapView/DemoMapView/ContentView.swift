//
//  ContentView.swift
//  DemoMapView
//
//  Created by Rishabh on 18/06/20.
//  Copyright © 2020 Rishabh. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            MapView().navigationBarTitle("MKMapView in SwiftUI", displayMode: .inline)
        }
    }
}

struct MapView: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        let location = CLLocationCoordinate2D(latitude: 28.6156,
                                              longitude: 77.3745)
        
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.75, longitudeDelta: 0.75)
        let coordinateRegion = MKCoordinateRegion(center: location, span: coordinateSpan)
        uiView.setRegion(coordinateRegion, animated: true)
        
        let annotationView = MKPointAnnotation()
        annotationView.coordinate = location
        annotationView.title = "Noida Sector 63"
        annotationView.subtitle = "Noida"
        uiView.addAnnotation(annotationView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
