//
//  ActivityHUD.swift
//  CombineNetworkingDemo
//
//  Created by Perry Hoekstra on 2/12/21.
//

import Foundation
import SwiftUI
import UIKit

public struct ActivityHUD: UIViewRepresentable {

    public typealias UIViewType = UIActivityIndicatorView

    let style: UIActivityIndicatorView.Style

    public func makeUIView(context: UIViewRepresentableContext<ActivityHUD>) -> ActivityHUD.UIViewType {
        return UIActivityIndicatorView(style: style)
    }

    public func updateUIView(_ uiView: ActivityHUD.UIViewType, context: UIViewRepresentableContext<ActivityHUD>) {
        uiView.startAnimating()
    }
}

public struct ActivityHudView<Content>: View where Content: View {
    private var isShowing: Binding<Bool>
    private var content: () -> Content

    public init(isShowing: Binding<Bool>, content: @escaping () -> Content) {
        self.isShowing = isShowing
        self.content = content
    }

    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                if (!self.isShowing.wrappedValue) {
                    self.content()
                } else {
                    self.content()
                        .disabled(true)
                        .blur(radius: 3)

                    VStack {
                        Text("Loading ...")
                        ActivityHUD(style: .large)
                    }
                    .frame(width: geometry.size.width / 2.0, height: 200.0)
                    .background(Color.secondary.colorInvert())
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                }
            }
        }
    }
}
