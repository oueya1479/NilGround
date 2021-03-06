//
//  ThemeView.swift
//  NilGround
//
//  Created by κΉλν on 2022/07/06.
//

import SwiftUI
import SDWebImageSwiftUI

struct ThemeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var spotSheetActive = false
    //    @State var theme: Theme
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            GeometryReader { proxy in
                let size = proxy.size
                
                ZStack(alignment: .topTrailing) {
                    //                            WebImage(url: URL(string: theme.image))
                    Image("cafe")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: UIScreen.main.bounds.height)
                        .cornerRadius(15)
                    
                    LinearGradient(colors: [
                        .black.opacity(0.7),
                        .black.opacity(0.6),
                        .black.opacity(0.3),
                        .clear,
                        .black.opacity(0.4),
                        .black.opacity(0.5),
                        .black.opacity(0.7),
                    ], startPoint: .top, endPoint: .bottom)
                    .cornerRadius(15)
                    
                    HStack(spacing: 20) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .font(.title)
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .font(.title)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .font(.title)
                        }
                    }
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .padding(.top, getSafeAreaTop())
                    .padding()
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 15) {
                            Spacer()
                            
                            Text("μ λͺ¨μ₯μ΄ κΉλλ€. κΈΈλ©΄ μ΄λ»κ² λλ κ±΄κ°μ?")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            VStack(alignment: .leading, spacing: 10) {
                    
                                Text("\(Date.now.formatted())")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                Text("μ€λͺλ λ§μ½μ κΈΈλ€κ³  νλ©΄ μ΄λ»κ² λλ κ±ΈκΉμ? μμλ§μΆμ΄ λ³΄μΈμ λ©λλλ!")
                                    .font(.callout)
                                    .foregroundColor(.primary)
                                
                            }
                            
                            Button {
                                spotSheetActive = true
                            } label: {
                                Text("18κ°μ μ€ν κ΅¬κ²½νκΈ°")
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(
                                        .ultraThinMaterial,
                                        in: RoundedRectangle(cornerRadius: 10)
                                    )
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.bottom, 40)
                        
                        Spacer()
                    }
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .preferredColorScheme(.dark)
        .fullScreenCover(isPresented: $spotSheetActive) {
            SpotListView()
        }
        //        .onAppear {
        //            let themeListVM = ThemeListViewModel()
        //            themeListVM.getTheme(id: id) { theme in
        //                self.theme = theme
        //            }
        //        }
    }
    
    func getSafeAreaTop() -> CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        return (keyWindow?.safeAreaInsets.top)!
    }
}

struct TitleOffsetKey: PreferenceKey {
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
    }
}
