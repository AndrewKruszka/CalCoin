//
//  NavBar.swift
//  CalCoin
//
//  Created by Jules Maslak on 4/7/24.
//

import SwiftUI
private let buttonSize: CGFloat = 40
struct NavBar: View {
    @Binding private var selectedViewType: ViewType
    
    var body: some View {
        ZStack()
        {
            VStack()
            {
                Divider().frame(height:5)
                         .overlay(.gray)
                         .offset(y: -20)
                HStack()
                {
                    Button
                    {
                        selectedViewType = ViewType.MarketPlace
                    }
                    label:
                    {
                        if(selectedViewType == ViewType.MarketPlace)
                        {
                            Image(systemName: "map.fill")
                                .resizable()
                                .frame(width: buttonSize, height: buttonSize)
                        }
                        else
                        {
                            Image(systemName: "map")
                                .resizable()
                                .frame(width: buttonSize, height: buttonSize)
                        }
                    }.padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                    Button
                    {
                        selectedViewType = ViewType.Goals
                    }
                    label:
                    {
                        if(selectedViewType == ViewType.Goals)
                        {
                            Image(systemName: "safari.fill")
                                .resizable()
                                .frame(width: buttonSize, height: buttonSize)
                        }
                        else
                        {
                            Image(systemName: "safari")
                                .resizable()
                                .frame(width: buttonSize, height: buttonSize)
                        }
                    }.padding(.init(top: 0, leading: 50, bottom: 0, trailing: 50))
                    Button
                    {
                        selectedViewType = ViewType.Dashboard
                    }
                    label:
                    {
                        if(selectedViewType == ViewType.Dashboard)
                        {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: buttonSize, height: buttonSize)
                        }
                        else
                        {
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: buttonSize, height: buttonSize)
                        }
                    }.padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                    Button
                    {
                        selectedViewType = ViewType.Favorites
                    }
                    label:
                    {
                        if(selectedViewType == ViewType.Favorites)
                        {
                            Image(systemName: "map.fill")
                                .resizable()
                                .frame(width: buttonSize, height: buttonSize)
                        }
                        else
                        {
                            Image(systemName: "map")
                                .resizable()
                                .frame(width: buttonSize, height: buttonSize)
                        }
                    }.padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                    Button
                    {
                        selectedViewType = ViewType.Community
                    }
                    label:
                    {
                        if(selectedViewType == ViewType.Community)
                        {
                            Image(systemName: "map.fill")
                                .resizable()
                                .frame(width: buttonSize, height: buttonSize)
                        }
                        else
                        {
                            Image(systemName: "map")
                                .resizable()
                                .frame(width: buttonSize, height: buttonSize)
                        }
                    }.padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                }.offset(y:-15)
            }
        }.frame(height: 70)    }
}

