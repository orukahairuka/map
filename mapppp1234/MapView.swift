//
//  MapView.swift
//  mapppp1234
//
//  Created by 櫻井絵理香 on 2024/02/11.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    //検索キーワード
    let searchKey: String
    //表示するViewを作成する時に実行
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    //表示したViewが更新されるたびに実行
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //入力された文字をでデバッグエリアに表示
        print("検索キーワード\(searchKey)")
        //インスタンス生成
        let geocoder = CLGeocoder()
        //入力された文字から位置情報を取得
        geocoder.geocodeAddressString(
            searchKey,//検索したいキーワード(geocodeAddressStringの引数１)
            completionHandler:{ (placemarks, error) in//completionHandlerは位置情報の取得が完了したときにする処理
                //リクエスト結果が存在し、一見目の情報から位置情報を取り出す
                if let placemarks,
                   let firstPlacemark = placemarks.first,
                   let location = firstPlacemark.location {

                    //位置情報から緯度軽度をtargetCoordinateに取り出す
                    let targetCoordinate = location.coordinate
                    //緯度軽度をデバッグエリアに表示
                    print("緯度軽度：\(targetCoordinate)")

                    //MKPointAnnotationインスタンスを生成し、ピンを作る
                    let pin = MKPointAnnotation()
                    //ピンを置く場所に緯度と経度を設定
                    pin.coordinate = targetCoordinate
                    //ピンのタイトルを設定
                    pin.title = searchKey
                    //ピンを地図に置く
                    uiView.addAnnotation(pin)
                    //緯度経度を中心に半径500mをの範囲を表示
                    uiView.region = MKCoordinateRegion(
                        center:targetCoordinate,
                        latitudinalMeters: 500.0,
                        longitudinalMeters: 500.0
                    )
                }
            }
        )
    }
}

#Preview {
    MapView(searchKey: "羽田空港")
        }




