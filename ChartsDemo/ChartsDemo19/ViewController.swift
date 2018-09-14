//
//  ViewController.swift
//  ChartsDemo19
//
//  Created by 南鑫林 on 2018/9/14.
//  Copyright © 2018年 南鑫林. All rights reserved.
//

import UIKit
import Charts

//第三方图表库Charts使用详解20（混合图表：折线图、柱状图等组合使用）
class ViewController: UIViewController {

    //使用 CombinedChartView 可以实现混合图表，即将折线图、柱状图、散点图、气泡图、烛形图中的一种或多种类型图表同时显示在一个坐标系中。
    
    /// 1，折线图、柱状图组合使用
    
    //组合图
    var chartView : CombinedChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //创建组合图组件对象
        chartView = CombinedChartView();
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width-40, height: 260)
        self.view.addSubview(chartView)
        
        //各类型图表的显示次序（后面的覆盖前面的）
        chartView.drawOrder = [DrawOrder.bar.rawValue,
                               DrawOrder.line.rawValue];
        
        //组合图数据
        let chartData = CombinedChartData()
        chartData.barData = generateBarData()
        chartData.lineData = generateLineData()
        
        //设置组合图数据
        chartView.data = chartData
        
    }
    
    //生成柱状图数据
    func generateBarData() -> BarChartData {
        //生成10条随机数据
        var dataEntries = [BarChartDataEntry]()
        for i in 0..<10 {
            let y = arc4random()%100
            let entry = BarChartDataEntry(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        //这10条数据作为柱状图的所有数据
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "柱状图")
        chartDataSet.colors = [.orange] //全部使用橙色
        //目前柱状图只包括1组立柱
        let chartData = BarChartData(dataSets: [chartDataSet])
        return chartData
    }
    
    //生成折线图数据
    func generateLineData() -> LineChartData {
        //生成10条随机数据
        var dataEntries = [ChartDataEntry]()
        for i in 0..<10 {
            let y = arc4random()%100
            let entry = ChartDataEntry(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        //这10条数据作为折线图的所有数据
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "折线图")
        chartDataSet.setColor(UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1))
        chartDataSet.lineWidth = 2.5
        chartDataSet.setCircleColor(UIColor(red: 240/255, green: 238/255, blue: 70/255,
                                            alpha: 1))
        chartDataSet.circleRadius = 5
        chartDataSet.circleHoleRadius = 2.5
        chartDataSet.fillColor = UIColor(red: 240/255, green: 238/255, blue: 70/255,
                                         alpha: 1)
        //目前柱状图只包括1组折线
        let chartData = LineChartData(dataSets: [chartDataSet])
        return chartData
    }

    @IBOutlet weak var pushAction: UIButton!
    @IBAction func pushupInside(_ sender: Any) {
        self.present(OneViewController(), animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

