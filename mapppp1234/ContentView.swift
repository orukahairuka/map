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
            MapView(searchKey: displaySearchKey)
        }
    }
}

#Preview {
    ContentView()
}
