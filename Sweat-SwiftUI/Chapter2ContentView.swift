//
//  Chapter2ContentView.swift
//  Sweat-SwiftUI
//
//  Created by heetae.park on 2022/05/30.
//

import SwiftUI

struct Chapter2ContentView: View {
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
        .navigationTitle("Chapter 2")
        .navigationBarTitleDisplayMode(.inline)
        
        VStack {
            Text("도형 만들기")
                .font(.largeTitle)
                .fontWeight(.heavy)
            HStack {
                Text("둥근 모양").font(.title)
                Spacer()
            }
            ZStack {
                Rectangle().frame(height: 10)
                HStack {
                    Circle().fill(Color.yellow)
                    Ellipse().fill(Color.green)
                    Capsule().fill(Color.orange)
                    RoundedRectangle(cornerRadius: 30).fill(Color.gray)
                }
            }
            HStack {
                Text("각진 모양").font(.title)
                Spacer()
            }
            ZStack {
                Rectangle().frame(height: 10)
                HStack {
                    Color.red
                    Rectangle().fill(Color.blue)
                    RoundedRectangle(cornerRadius: 0).fill(Color.purple)
                }
            }
        }.padding()
    }
}

struct Chapter2ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Chapter2ContentView()
    }
}
