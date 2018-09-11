//
//  OneViewController.swift
//  ChartsDemo11
//
//  Created by 南鑫林 on 2018/9/5.
//  Copyright © 2018年 南鑫林. All rights reserved.
//

import UIKit
import Charts

/// （折线图11：获取、保存图片，极简样式）
class OneViewController: UIViewController {

    //折线图
    var chartView: LineChartView!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建折线图组件对象
        chartView = LineChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,
                                 height: 150)
        chartView.legend.enabled = false
        chartView.leftAxis.enabled = false
        chartView.leftAxis.spaceTop = 0.4
        chartView.leftAxis.spaceBottom = 0.4
        chartView.rightAxis.enabled = false
        chartView.xAxis.enabled = false
        self.view.addSubview(chartView)
        
        //折线图背景色
        chartView.backgroundColor = UIColor(red: 89/255, green: 199/255, blue: 250/255,
                                            alpha: 1)
        
        //生成8条随机数据
        var dataEntries = [ChartDataEntry]()
        for i in 0..<8 {
            let y = arc4random()%100
            let entry = ChartDataEntry.init(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        //这50条数据作为1根折线里的所有数据
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "李子明")
        chartDataSet.lineWidth = 1.75
        chartDataSet.circleRadius = 5.0
        chartDataSet.circleHoleRadius = 2.5
        chartDataSet.setColor(.white)
        chartDataSet.setCircleColor(.white)
        chartDataSet.highlightColor = .white
        chartDataSet.drawValuesEnabled = false
        //目前折线图只包括1根折线
        let chartData = LineChartData(dataSets: [chartDataSet])
        
        //设置折现图数据
        chartView.data = chartData
    }
    @IBAction func saveAction(_ sender: UIButton) {
        //获取图片
        let image = chartView.getChartImage(transparent: true)
        //将其显示在imageView中
        imageView.image = image
        //将其保存到系统相册中
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
    
}
