//
//  ViewController.swift
//  ChartsDemo18
//
//  Created by 南鑫林 on 2018/9/13.
//  Copyright © 2018年 南鑫林. All rights reserved.
//

import UIKit
import Charts
// 第三方图表库Charts使用详解19（烛形图）
class ViewController: UIViewController {
    
    //烛形图
    var chartView: CandleStickChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        烛形图又称为 K 线图，下面是一个简单的使用样例。默认情况下：
//        当开盘价高于收盘价时，使用实心矩形。
//        当开盘价低于收盘价时，使用空心矩形。
        
        //烛形图
        var chartView: CandleStickChartView!
        //创建烛形图组件对象
        chartView = CandleStickChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,
                                 height: 260)
        self.view.addSubview(chartView)
        
        let dataEntries1 = (0..<10).map { (i) -> CandleChartDataEntry in
            let val = Double(arc4random_uniform(40) + 10)
            let high = Double(arc4random_uniform(9) + 8)
            let low = Double(arc4random_uniform(9) + 8)
            let open = Double(arc4random_uniform(6) + 1)
            let close = Double(arc4random_uniform(6) + 1)
            let even = arc4random_uniform(2) % 2 == 0 //true表示开盘价高于收盘价
//            return CandleChartDataEntry(x: Double(i),
//                                        shadowH: val + high,
//                                        shadowL: val - low,
//                                        open: even ? val + open : val - open,
//                                        close: even ? val - close : val + close)
            //当天涨幅超过9的显示一个星星图标
            if(!even && (open + close) > 9 ){
                return CandleChartDataEntry(x: Double(i),
                                            shadowH: val + high,
                                            shadowL: val - low,
                                            open: even ? val + open : val - open,
                                            close: even ? val - close : val + close,
                                            icon: UIImage(named: "icon")!)
            }else{
                return CandleChartDataEntry(x: Double(i),
                                            shadowH: val + high,
                                            shadowL: val - low,
                                            open: even ? val + open : val - open,
                                            close: even ? val - close : val + close)
            }
        }
        
        let chartDataSet1 = CandleChartDataSet(values: dataEntries1, label: "图例1")
        chartDataSet1.decreasingFilled = false //开盘高于收盘则使用空心矩形
        chartDataSet1.increasingFilled = true //开盘低于收盘则使用实心矩形
        chartDataSet1.shadowWidth = 4 //修改线条宽度
        chartDataSet1.setColor(.orange)
        chartDataSet1.increasingColor = .red
        chartDataSet1.decreasingColor = .green
        chartDataSet1.shadowColor = .darkGray //下面将上升方块（开盘低于收盘）显示成红色，下降方块（开盘高于收盘）显示为绿色，竖线统一设置为灰色。
        chartDataSet1.shadowColorSameAsCandle = true
//        chartDataSet1.showCandleBar = false //不显示方块
        //目前烛形图包括1组数据
        let chartData = CandleChartData(dataSets: [chartDataSet1])
        
        //设置烛形图数据
        chartView.data = chartData
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

