//
//  ViewController.swift
//  ChartsDemo17
//
//  Created by 南鑫林 on 2018/9/12.
//  Copyright © 2018年 南鑫林. All rights reserved.
//

import UIKit
import Charts
class ViewController: UIViewController {

    // 气泡图
    var chartView : BubbleChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //创建气泡图组件对象
        chartView = BubbleChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40, height: 260)
        self.view.addSubview(chartView)
        
        //第一组气泡图的10条随机数据
        let dataEntries1 = (0..<10).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(100) + 3)
            let size = CGFloat(arc4random_uniform(10))
            //只要size超过7的气泡都会带有一个小图标
            if size > 7 {
                return BubbleChartDataEntry(x: Double(i), y: val, size: size,
                                            icon: UIImage(named: "icon"))
            } else {
                return BubbleChartDataEntry(x: Double(i), y: val, size: size)
            }
        }
        let chartDataSet1 = BubbleChartDataSet(values: dataEntries1, label: "图例1")
        //选中气泡的边框大小
        chartDataSet1.highlightCircleWidth = 6
        //第二组气泡图的10条随机数据
        let dataEntries2 = (0..<10).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(100) + 3)
            let size = CGFloat(arc4random_uniform(10))
            return BubbleChartDataEntry(x: Double(i), y: val, size: size)
        }
        let chartDataSet2 = BubbleChartDataSet(values: dataEntries2, label: "图例2")
        chartDataSet2.setColor(.orange) //第二组气泡使用橙色
        
        //目前气泡图包括2组数据
        let chartData = BubbleChartData(dataSets: [chartDataSet1, chartDataSet2])
        
        //气泡文字样式
        chartData.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 7)!)
        chartData.setValueTextColor(.red)
        //不显示气泡文字
        chartData.setDrawValues(false)
        
        //设置气泡图数据
        chartView.data = chartData
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

