//
//  MapView.swift
//  mapppp1234
//
//  Created by 櫻井絵理香 on 2024/02/11.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    //表示するViewを作成する時に実行
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    //表示したViewが更新されるたびに実行
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print("再描画")
    }
}

#Preview {
    MapView()
}
