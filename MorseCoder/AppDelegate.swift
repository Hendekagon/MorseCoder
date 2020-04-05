//
//  AppDelegate.swift
//  MorseCoder
//
//  Created by MJC on 20/10/2015.
//  Copyright © 2015 Matthew Chadwick. All rights reserved.
//

import Foundation
import Cocoa
import CoreGraphics
import CoreGraphics
import GLKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

@IBOutlet weak var window: NSPanel!

let morsecode: [String: String] =
    [" ": "_", "@": "·––·–·", "a": ".-", "b": "-...", "#": "-..-..-..-..", "c": "-.-.", "d": "-..", "%": ".-----.", "e": ".", "f": "..-.", "g": "--.", "h": "...", "i": "..", "*": ".-.-.-", "j": ".---", "+": "·–·–·", "k": "-.-", "l": ".-..", "-": "–····–", "m": "--", ".": "_", "n": "-.", "o": "---", "0": "-----", "p": ".--.", "1": ".---", "q": "--.-", "2": "..---", "r": ".-.", "3": "...--", "s": "...", "4": "....-", "t": "-", "5": ".....", "u": "..-", "6": "-....", "v": "...-", "7": "--...", "w": ".--", "8": "---..", "x": "-..-", "9": "----.", "y": "-.--", "z": "--..", "\\": ".-.-.-.-", "=": "–···–", "?": "··––··", "_": "··––·–"]

let morseTiming: [String: [[Double]]] =
[" ": [[2 , 0],[1 , 0]], "@": [[1 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0]], "a": [[1 , 1],[1 , 0],[3 , 1],[1 , 0]], "b": [[3 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0]], "#": [[3 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0]], "c": [[3 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0]], "d": [[3 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0]], "%": [[1 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0]], "e": [[1 , 1],[1 , 0]], "f": [[1 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0]], "g": [[3 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0]], "h": [[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0]], "i": [[1 , 1],[1 , 0],[1 , 1],[1 , 0]], "*": [[1 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0]], "j": [[1 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0]], "+": [[1 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0]], "k": [[3 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0]], "l": [[1 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0]], "-": [[3 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0]], "m": [[3 , 1],[1 , 0],[3 , 1],[1 , 0]], ".": [[2 , 0],[1 , 0]], "n": [[3 , 1],[1 , 0],[1 , 1],[1 , 0]], "o": [[3 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0]], "0": [[3 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0]], "p": [[1 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0]], "1": [[1 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0]], "q": [[3 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0]], "2": [[1 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0]], "r": [[1 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0]], "3": [[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0]], "s": [[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0]], "4": [[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0]], "t": [[3 , 1],[1 , 0]], "5": [[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0]], "u": [[1 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0]], "6": [[3 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0]], "v": [[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0]], "7": [[3 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0]], "w": [[1 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0]], "8": [[3 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0]], "x": [[3 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0]], "9": [[3 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0]], "y": [[3 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0]], "z": [[3 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0]], "\\": [[1 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0]], "=": [[3 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0]], "?": [[1 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[1 , 1],[1 , 0]], "_": [[1 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0],[3 , 1],[1 , 0],[1 , 1],[1 , 0],[3 , 1],[1 , 0]]]

var morse: [[Double]] = [[1,1],[2,0], [3,0],[5,1], [1,0], [2,1], [3,0]]
var intervals: [[Double]] = []
var di = 0.0
var j = 0
var x = CGFloat.init()
var y = CGFloat.init()
var px = CGFloat.init()
var py = CGFloat.init()
var stop = false


    
func stringToMorse(_ aString: String) -> [[Double]]
{
    let cs = aString.lowercased().map {String($0)}
    let ts: [[Double]] = cs.flatMap { (c) -> [[Double]] in
        return self.morseTiming[c]!
    }
    return ts
}

func toIntervals(_ anArray: [[Double]]) -> [[Double]]
{
    let t = anArray.map({(x) -> Double in return x[0]})
    let r = t.reduce(0.0, +)
    let q = anArray.map({(x) -> [Double] in
        return [(x[0] / r), x[1]]
    })
    return q.reduce([[0.0, q[0][1]]],
        { (r: [[Double]], x: [Double]) -> [[Double]] in
            return r + [[(r.last![0]+x[0]), x[1]]]
    })
}

func findInterval(_ anArray:[[Double]], i: Int, v: Double) -> (Double, Int)
{
    var j = i
    while !(
        (anArray[j][0] <= abs(v.truncatingRemainder(dividingBy: 1.0))) &&
            (anArray[(j + 1) % (anArray.count)][0] > abs(v.truncatingRemainder(dividingBy: 1.0))))
    {
        j = (j + 1) % (anArray.count - 1)
    }
    return (anArray[j][1], j)
}

func maybeFeelPixels(x:Int, y:Int, mx: CGFloat, my: CGFloat)
{
    let display:CGDirectDisplayID = CGMainDisplayID()
    let rect:CGRect = CGRect.init(x: x, y: y, width: 16, height: 16)
    let pixels:CGImage? = CGDisplayCreateImage(display, rect: rect)
    if(pixels == nil){return}
    let pi:CIImage = CIImage(cgImage: pixels!)
    //let bf = CIFilter(name: "CIGaussianBlur")
    //bf?.setValue(pi, forKey: kCIInputImageKey)
    //bf?.setValue(2.0, forKey: kCIInputRadiusKey)
    //let gf = CIFilter(name: "CIColorControls")
    //gf?.setValue(bf?.outputImage, forKey: kCIInputImageKey)
    //gf?.setValue(0.0, forKey: kCIInputSaturationKey)
    //gf?.setValue(1.0, forKey: kCIInputContrastKey)
    let ef = CIFilter(name: "CIEdgeWork")
    //ef?.setValue(gf?.outputImage, forKey: kCIInputImageKey)
    ef?.setValue(pi, forKey: kCIInputImageKey)
    //ef?.setValue(0.1, forKey: kCIInputIntensityKey)
    let po = (ef?.outputImage)!
    let ii = NSBitmapImageRep(ciImage: po)
    let ci = ii.colorAt(x: 32, y: 32)
    let iii = NSBitmapImageRep(ciImage: pi)
    let cii = iii.colorAt(x: 16, y: 16)
    //print(">>", ci, cii)
    let z = CGFloat(0.0)
    let mv: GLKVector2 = GLKVector2Make(Float(mx), Float(my))
    let mm:Float = GLKVector2Length(mv)
    //print(">>", mv, mm)
      let ce = ((ci?.redComponent ?? z > CGFloat(0.1)) || (ci?.greenComponent ?? z > CGFloat(0.1)) || (ci?.blueComponent ?? z > CGFloat(0.1)))
    if ce
    {
      NSHapticFeedbackManager.defaultPerformer.perform(
          NSHapticFeedbackManager.FeedbackPattern.alignment,
          performanceTime: NSHapticFeedbackManager.PerformanceTime.now)
    }

}

func feelText(event:NSEvent)
{
   let mx = 0.01 * event.deltaX
   let my = 0.01 * event.deltaY
   let ns = ((mx < 0 || my < 0) ? -1.0 : 1.0)
   // need to use direction or rotation somehow for scanning
   let lm = sqrt(Double(mx * mx + my * my)) * 0.001
   self.di = (self.di + lm).truncatingRemainder(dividingBy: 1.0)
   let sx = (event.locationInWindow.x / self.window.frame.maxX).truncatingRemainder(dividingBy: 1.0)
   let sy = (event.locationInWindow.y / self.window.frame.maxY).truncatingRemainder(dividingBy: 1.0)
   let v: (Double, Int) = self.findInterval(self.intervals, i: self.j, v: Double(sx))
   self.j = v.1
   //print(self.di, lm, self.j, v.0, "-", v, " - ", sx)
   //print(self.di)
   //print(mx)
   self.x = self.window.frame.midX - event.locationInWindow.x
   self.y = self.window.frame.midY - event.locationInWindow.y
   //_ = x * x + y * y
   //print(event.pressure, event.locationInWindow, x, y, p)
   //if (p > 12000 && p < 24000)
   //if (v.0 > 0.0)
    let dx = abs(200 * mx)
    let dy = abs(200 * my)
   
   if ((abs(x.truncatingRemainder(dividingBy: 64) - dx) < dx) ||
       (abs(y.truncatingRemainder(dividingBy: 32) - dy) < dy))
   {
       NSHapticFeedbackManager.defaultPerformer.perform(
           NSHapticFeedbackManager.FeedbackPattern.levelChange,
           performanceTime: NSHapticFeedbackManager.PerformanceTime.now)
   }
}

func trackMouse()
{
    self.window.trackEvents(
    matching: [NSEvent.EventTypeMask.pressure, NSEvent.EventTypeMask.tabletPoint, NSEvent.EventTypeMask.mouseMoved],
    timeout: TimeInterval.init(1),
    mode: RunLoop.Mode.default,
    handler: {(event, stop) -> Void in
        if (event == nil) {return}
        let m = NSEvent.mouseLocation
        let y = (NSScreen.main?.frame.size.height)! - m.y
        //self.window.setFrame(NSRect(x: m.x, y: m.y, width: 16, height: 16), display: true)
        maybeFeelPixels(x: Int(m.x - 8), y: Int(y - 8), mx: event!.deltaX, my: event!.deltaY)
    })
}

func setupWindow()
{
  self.window.setIsVisible(false)
  //self.window.styleMask.remove(.fullScreen)
  //self.window.styleMask.formUnion(.nonactivatingPanel)
  //self.window.isFloatingPanel = true
  //self.window.becomesKeyOnlyIfNeeded = true
  //self.window.isOpaque = false
  //self.window.hasShadow = false
  //self.window.alphaValue = CGFloat(0.5)
  //self.window.level = NSWindow.Level.floating
}

func setupMonitor()
{
  NSEvent.addGlobalMonitorForEvents(matching: NSEvent.EventTypeMask.mouseMoved, handler: {(event: NSEvent?) in
    let m = NSEvent.mouseLocation
    let y = (NSScreen.main?.frame.size.height)! - m.y
    self.maybeFeelPixels(x: Int(m.x - 8), y: Int(y - 8), mx: event!.deltaX, my: event!.deltaY)
  })
}

func applicationDidFinishLaunching(_ aNotification: Notification)
{
    //self.intervals = toIntervals(self.stringToMorse("    a b c d e f g h i j k l m n o p q r s t u v w x y z"))
    // a function x[0-1] -> y[0,1]
    setupWindow()
  
    self.intervals = toIntervals(self.stringToMorse("a b c d e f g h i j k l m n o p q r s t u v w x y z"))
    let pressure = NSPressureConfiguration.init(pressureBehavior: NSEvent.PressureBehavior.unknown)
    self.window.contentView?.pressureConfiguration = pressure
    setupMonitor()
    //trackMouse()
}

func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
}


}

