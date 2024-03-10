//
//  ContentView.swift
//  father_hit_task_3
//
//  Created by Антон Поникаровский on 10.03.2024.
//

import SwiftUI

struct pressableButtonUninterruptable: ButtonStyle {
    @State var isPressed: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .frame(width: 120, height: 120)
            .background(
                RoundedRectangle(cornerRadius: 60.0)
                    .opacity(isPressed ? 0.1 : 0)
                    .animation(.snappy(duration: 0.22), value: isPressed)
            )
            .scaleEffect(isPressed ? 0.86 : 1.0)
            .onChange(of: configuration.isPressed, {
                if configuration.isPressed {
                    withAnimation(.snappy(duration: 0.22)) {
                        isPressed.toggle()
                    } completion: {
                        withAnimation(.snappy(duration: 0.22)) {
                            isPressed.toggle()
                        }
                    }
                }
            })
    }
}

struct playNextButton: View {
    @State var isAnimated: Bool = false
    
    var body: some View {
        Button {
            withAnimation(.snappy(duration: 0.44, extraBounce: 0.3)) {
                isAnimated.toggle()
            } completion: {
                isAnimated.toggle()
            }
        } label: {
            HStack(alignment: .center, spacing: 0) {
                Image(systemName: "arrowtriangle.forward.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: isAnimated ? 40 : 0)
                    .opacity(isAnimated ? 1 : 0)
                Image(systemName: "arrowtriangle.forward.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                Image(systemName: "arrowtriangle.forward.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: isAnimated ? 0 : 40)
                    .opacity(isAnimated ? 0 : 1)
            }
        }
    }
}

struct ContentView: View {
    @State var isAnimated: Bool = false
    
    var body: some View {
        HStack (alignment: .center, spacing: 20) {
            playNextButton()
                .buttonStyle(pressableButtonUninterruptable())

        }
    }
}

#Preview {
    ContentView()
}
