//
//  AnimalFactory.swift
//  ZooKeeper
//
//  Created by Nicholas Baud on 2/4/16.
//  Copyright © 2016 Nicholas Baud. All rights reserved.
//

import Foundation
import SwiftyJSON

public class AnimalFactory {
    
    public static func zooFromJSONFileNamed(name:String) -> [Animal]? {
        if let path = NSBundle.mainBundle().pathForResource(name, ofType: "json"),
            let contentData = NSFileManager.defaultManager().contentsAtPath(path) {
                
                let json = JSON(data: contentData)
                var zoo = [Animal]()
                
                if let animals = json["animals"].array {
                    for ii in animals {
                        if let object = AnimalFactory.animalFromJSON(ii){
                            zoo.append(object)
                        }
                    }
                }
                return zoo
        }
        return nil
    }
    
    public static func animalFromJSON(json:JSON) -> Animal? {
        
        let color:String = json["color"].stringValue
        let type:String = json["type"].stringValue
        let isMale:Bool = json["isMale"].boolValue
        
        if type == "Duck" {
            return Duck(color:color, isMale: isMale)
        } else if type == "Fish" {
            return Fish(color: color, isMale: isMale)
        }
        
        return nil
        
    }
}
