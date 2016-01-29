//
//  AppDelegate.swift
//  MorseCoder
//
//  Created by MJC on 20/10/2015.
//  Copyright © 2015 onto. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    var px=CGFloat.init(),py=CGFloat.init()
    
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
    
    func stringToMorse(aString: String) -> [[Double]]
    {
        let cs = aString.lowercaseString.characters.map {String($0)}
        let ts: [[Double]] = cs.flatMap { (c) -> [[Double]] in
            return self.morseTiming[c]!
        }
        return ts
    }
    
    func toIntervals(anArray: [[Double]]) -> [[Double]]
    {
        let t = anArray.map({(x) -> Double in return x[0]})
        let r = t.reduce(0.0, combine: +)
        let q = anArray.map({(x) -> [Double] in
            return [(x[0] / r), x[1]]
        })
        return q.reduce([[0.0, q[0][1]]],
            combine: { (r: [[Double]], x: [Double]) -> [[Double]] in
                return r + [[(r.last![0]+x[0]), x[1]]]
        })
    }
    
    func findInterval(anArray:[[Double]], i: Int, v: Double) -> (Double, Int)
    {
        var j = i
        while !(
            (anArray[j][0] <= abs(v % 1.0)) &&
                (anArray[(j + 1) % (anArray.count)][0] > abs(v % 1.0)))
        {
            j = (j + 1) % (anArray.count - 1)
        }
        return (anArray[j][1], j)
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        self.intervals = toIntervals(self.stringToMorse("    a b c d e f g h i j k l m n o p q r s t u v w x y z"))
        let pressure = NSPressureConfiguration.init(pressureBehavior: NSPressureBehavior.Unknown)
        window.contentView?.pressureConfiguration = pressure
        //window.toggleFullScreen(self);
        window.trackEventsMatchingMask(
            [NSEventMask.EventMaskPressure, NSEventMask.TabletPointMask,
            NSEventMask.MouseMovedMask],
            timeout: NSTimeInterval.init(1), mode: NSDefaultRunLoopMode,
            handler: {(event: NSEvent, stop) -> Void in
                let mx = event.locationInWindow.x - self.px
                let my = event.locationInWindow.y - self.py
                self.px = event.locationInWindow.x
                self.py = event.locationInWindow.y
                let ns = ((mx < 0 || my < 0) ? -1.0 : 1.0)
                // need to use direction or rotation somehow for scanning
                let lm = sqrt(Double(mx * mx + my * my)) * 0.0001
                self.di = (self.di + lm) % 1.0
                let v: (Double, Int) = self.findInterval(self.intervals, i: self.j, v: self.di)
                self.j = v.1
                print(self.di, lm, self.j, v.0)
                //print(self.di)
                self.x = self.window.frame.midX - event.locationInWindow.x
                self.y = self.window.frame.midY - event.locationInWindow.y
                //_ = x * x + y * y
                //print(event.pressure, event.locationInWindow, x, y, p)
                //if (p > 12000 && p < 24000)
                if (v.0 > 0.0)
                {
                    NSHapticFeedbackManager.defaultPerformer().performFeedbackPattern(
                        NSHapticFeedbackPattern.LevelChange,
                        performanceTime: NSHapticFeedbackPerformanceTime.Now)
                }
                
            })
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

