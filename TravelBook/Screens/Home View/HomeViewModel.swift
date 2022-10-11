//
//  HomeViewModel.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import Foundation

class HomeViewModel {
    var placeList = [Places]()
    
  
    let p1 = Places(place_id: 1, place_image_name: "akaretler", place_lbl: "Akaretler", place_desc_lbl: "Türkiye’nin ilk toplu konut projesidir. Ancak bu konutların asıl yapılma amacı şudur: Sultan Abdülaziz: yörede 10-15 yılda bir çıkan yangınlardan korunmak için, Dolmabahçe sarayının çevresini yüksek duvarlarla çevirttirir. Hatta: Sarı evlerin de, yine yangınlara set çekmek için yaptırıldığı söylenir. Sultan: Aziziye caminin yapımına katkıda bulunması için, lojmanlardan arta kalan kısmı da kiraya verdirir. Zaten yörenin ismi yani “Akaretler”: kira getiren anlamında kullanılmaktadır")
    let p2 = Places(place_id: 2, place_image_name: "cengelkoy", place_lbl: "Çengelköy", place_desc_lbl: "Çengelköy, Boğaziçi Anadolu kıyısında, Üsküdar'dan Karadeniz istikametine doğru sırasıyla Kuzguncuk ve Beylerbeyi semtlerinden sonra gelen ve eskinin geleneksel boğaz yaşamını hissedeceğiniz, çevresi asırlık çınar ağaçları ve birbirinden etkileyici ve alımlı yalılarla çevrili bir boğaz semti.")
    let p3 = Places(place_id: 2, place_image_name: "kuzguncuk", place_lbl: "Kuzguncuk", place_desc_lbl: "Kuzguncuk İstanbul Boğazı’nın Anadolu yakasında Üsküdar tepelerinden sahile doğru süzülerek inen, doğal güzelliklerini hâlâ koruyabilen; özellikle o korkunç gökdelenlere ve AVM’lere inatla direnen şirin mi şirin, minicik bir semt. Yeşille mavinin kucaklaştığı en güzel noktada bir cennet köşesi Kuzguncuk.")
    let p4 = Places(place_id: 2, place_image_name: "pierreLoti", place_lbl: "Pierre Loti", place_desc_lbl: "Tesis içerisinde; Tarihi Kahve, A ziyade Restaurant, Yeşil Cafe, Nargilevi, 7 ayrı konaktan oluşan 67 oda ve 115 yataklı Turquhouse Hotel bulunmaktadır. Ayrıca Haliç manzaralı, aynı anda 1400 kişinin yararlanabileceği açık bahçe alanı ile konuklarını ağırlamaktadır.")
    let p5 = Places(place_id: 2, place_image_name: "polonezkoy", place_lbl: "Polonezköy", place_desc_lbl: "1830 yılındaki Polonya ayaklanması sonrasında sürgünde yaşayan Prens Adam Czartoryski tarafından 1842 yılında Adampol adıyla olarak kurulmuş olan Polonezköy, kültürü ile günümüzde halen bir Polonya köyü karakterini taşıyor ve yansıtıyor.")
    let p6 = Places(place_id: 2, place_image_name: "galata", place_lbl: "Galata Kulesi", place_desc_lbl: "Dünyanın en eski kuleleri arasında sayılan ve İstanbul’un sembollerinden biri olan Galata Kulesi, 2013 yılında UNESCO Dünya Mirası Geçici Listesi’ne dahil edilmiştir. İstanbul’un siluetini oluşturan en önemli yapılardan biri olan Galata Kulesi, uzun dönem yangın gözetleme kulesi olarak kullanıldı ve Galata Yangın Kulesi olarak adlandırıldı.")
    
    func place() {
        placeList.append(p1)
        placeList.append(p2)
        placeList.append(p3)
        placeList.append(p4)
        placeList.append(p5)
        placeList.append(p6)
        
    }
    

}
