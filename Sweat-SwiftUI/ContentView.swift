//
//  ContentView.swift
//  Sweat-SwiftUI
//
//  Created by heetae.park on 2022/03/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("폰트와 굵기 설정")
                .font(.title)
                .fontWeight(.black)
            Text("글자색은 foreground, 배경색은 background")
                .foregroundColor(.white)
                .padding()
                .background(.blue)
            Text("커스텀 폰트, 볼드체, 이탤릭체, 밑줄, 취소선")
                .font(.custom("Menlo", size: 16))
                .bold()
                .italic()
                .underline()
                .strikethrough()
            Text("라인 수 제한과 \n 텍스트 정렬 기능입니다. \n 이건 안 보입니다.")
                .lineLimit(2)
                .multilineTextAlignment(.trailing)
                .fixedSize()
            (Text("자간과 기준선").kerning(8)
             + Text(" 조정도 쉽게 가능합니다.").baselineOffset(8))
                .font(.system(size: 16))
            Text("수식어 순서 테스트")
                .font(.largeTitle)
                .background(.yellow)
                .padding()
            Text("수식어 순서 테스트")
                .font(.largeTitle)
                .padding()
                .background(.yellow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
