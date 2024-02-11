//
//  ContentView.swift
//  mapppp1234
//
//  Created by 櫻井絵理香 on 2024/02/10.
//

import SwiftUI

struct ContentView: View {
    //入力中の文字列を保持する状態
    @State var inputText: String = ""
    //検索キーワードを保持する状態
    @State var displaySearchKey = ""
    //マップの種類 最初は基準から
    @State var displayMapType: MapType = .standard
    var body: some View {
        VStack {
            //テキストフィールド(文字入力)
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
            //入力が完了されたとき
                .onSubmit {
                    //入力が完了したので検索キーワードに設定する
                    displaySearchKey = inputText
                }
                .padding()

            ZStack(alignment: .bottomTrailing) {
                MapView(searchKey: displaySearchKey, mapType: displayMapType)
                //マップ種類切り替えボタン
                Button {
                    //標準->衛生写真->衛生写真・交通機関ラベル
                    if displayMapType == .standard {
                        displayMapType = .satellite
                    } else if displayMapType == .satellite {
                        displayMapType = .hybrid
                    } else {
                        displayMapType = .standard
                    }
                } label: {
                    //マップアイコンの表示
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                }
                .padding(.trailing, 20.0)
                .padding(.bottom, 30.0)
            }
        }
    }
}

#Preview {
    ContentView()
}
