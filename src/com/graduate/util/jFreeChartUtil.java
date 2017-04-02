package com.graduate.util;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.ui.TextAnchor;

/**
 * jFreeChart的工具类
 * 
 * @author 李双 2016/12/9
 *
 */
public class jFreeChartUtil {
	/**
	 * 柱形图
	 * 
	 * @param title
	 *            标题名
	 * @param x
	 *            目录轴的显示标签
	 * @param y
	 *            数值轴的显示标签
	 * @param datasets
	 *            数据集
	 * @param request
	 *            文件的响应
	 * @return
	 * @throws IOException
	 */
	public static String getBarURL(String title, String x, String y, CategoryDataset dataset,
			HttpServletRequest request) throws IOException {
		JFreeChart Chart = ChartFactory.createBarChart3D(title, x, y, dataset, PlotOrientation.VERTICAL, false, false,
				false);

		CategoryPlot plot = (CategoryPlot) Chart.getPlot();
		BarRenderer renderer = (BarRenderer) plot.getRenderer();
		/**
		 * renderer设置 柱子相关属性设置
		 */
		// 设置柱的透明度
		plot.setForegroundAlpha(1.0f);
		renderer.setBaseOutlinePaint(Color.ORANGE); // 边框颜色
		renderer.setDrawBarOutline(true);
		renderer.setMaximumBarWidth(0.08); // 设置柱子宽度
		renderer.setMinimumBarLength(0.1); // 设置柱子高度
		renderer.setSeriesPaint(0, Color.decode("#3487be")); // 设置柱的颜色
		renderer.setItemMargin(0); // 设置每个地区所包含的平行柱的之间距离
		// 在柱子上显示相应信息
		renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
		renderer.setBaseItemLabelsVisible(true);
		renderer.setBaseItemLabelPaint(Color.BLACK);// 设置数值颜色，默认黑色
		// 搭配ItemLabelAnchor TextAnchor
		// 这两项能达到不同的效果，但是ItemLabelAnchor最好选OUTSIDE，因为INSIDE显示不出来
		renderer.setBasePositiveItemLabelPosition(
				new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12, TextAnchor.CENTER_LEFT));
		// 下面可以进一步调整数值的位置，但是得根据ItemLabelAnchor选择情况.
		renderer.setItemLabelAnchorOffset(10);
		getCreatePie3DChart(Chart);

		// 800是图片长度，600是图片高度
		String filenamebar = ServletUtilities.saveChartAsPNG(Chart, 600, 400, null, request.getSession());
		String barURL = request.getContextPath() + "/chart?filename=" + filenamebar;
		return barURL;
	}

	/**
	 * 饼状图
	 * 
	 * @param title
	 * @param request
	 * @param dataset
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings("deprecation")
	public static String getPieURL(String title, HttpServletRequest request, DefaultPieDataset dataset)
			throws IOException {
		JFreeChart chart = ChartFactory.createPieChart(title, dataset, true, true, false);
		// 得到标题
		TextTitle texttitle = chart.getTitle();
		texttitle.setFont(new Font("黑体", Font.PLAIN, 20));
		// 得到绘图区
		PiePlot pieplot = (PiePlot) chart.getPlot();
		// 设置绘图面板外边的填充颜色(矩形边框)
		pieplot.setOutlinePaint(Color.WHITE);
		// 注释显示数据
		// pieplot.setLegendLabelGenerator(new
		// StandardPieSectionLabelGenerator("{0}={2}({1})"));
		// 显示是百分比的数据
		pieplot.setLabelGenerator(new StandardPieSectionLabelGenerator("{0}:{2}({1})"));
		// 设置标签字体
		pieplot.setLabelFont(new Font("宋体", Font.PLAIN, 16));
		// 指定 section 轮廓线的颜色
		pieplot.setBaseSectionOutlinePaint(Color.WHITE);
		// 指定 section 轮廓线的厚度
		pieplot.setSectionOutlineStroke(new BasicStroke(1));
		pieplot.setCircular(true);
		pieplot.setBackgroundPaint(Color.white);
		pieplot.setLabelGap(0.02);
		// 设定背景透明度（0-1.0之间）
		pieplot.setBackgroundAlpha(0.2f);
		// 设定前景透明度（0-1.0之间）
		pieplot.setForegroundAlpha(1f);
		// 提示条字体
		chart.getLegend().setItemFont(new Font("宋体", Font.PLAIN, 16));
		// 将图形转换为图片，传到前台
		String fileName = ServletUtilities.saveChartAsJPEG(chart, 600, 400, null, request.getSession());
		String pieURL = request.getContextPath() + "/chart?filename=" + fileName;
		return pieURL;
	}

	/**
	 * 折线图
	 * 
	 * @param title
	 * @param x
	 * @param y
	 * @param dataset
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@SuppressWarnings("deprecation")
	public static String getLineURL(String title, String x, String y, DefaultCategoryDataset dataset,
			HttpServletRequest request) throws IOException {
		JFreeChart Chartline = ChartFactory.createLineChart(title, x, y, dataset, PlotOrientation.VERTICAL, // 绘制方向
				true, // 显示图例
				true, // 采用标准生成器
				false // 是否生成超链接
		);
		Chartline.getLegend().setItemFont(new Font("微软雅黑", Font.BOLD, 12));
		// 获取折线对象
		LineAndShapeRenderer renderer = (LineAndShapeRenderer) Chartline.getCategoryPlot().getRenderer();
		// 设置拐点是否可见/是否显示拐点
		renderer.setBaseShapesVisible(true);
		// 设置拐点不同用不同的形状
		renderer.setDrawOutlines(true);
		// 设置线条是否被显示填充颜色
		renderer.setUseFillPaint(true);
		// 设置拐点颜色
		renderer.setBaseFillPaint(Color.blue);// 蓝色
		// 设置折点的大小
		renderer.setSeriesOutlineStroke(0, new BasicStroke(3.5F));
		// 设置折线拐点
		renderer.setSeriesShape(0, new java.awt.geom.Ellipse2D.Double(-4D, -4D, 8D, 8D));
		// 设置每个地区所包含的平行柱的之间距离
		renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
		renderer.setItemLabelsVisible(true);// 显示每个点上的数据值的提示工具,数据标签是否可见
		// 设置折线加粗
		for (int i = 0; i < 20; i++) {
			renderer.setSeriesStroke(i, new BasicStroke(2.5F));
		}
		// renderer.setSeriesStroke(1, new BasicStroke(4.0F));// 设置折线大小
		// c橙色
		renderer.setSeriesPaint(2, Color.ORANGE);
		getCreatePie3DChart(Chartline);
		// 800是图片长度，500是图片高度
		String filenameline = ServletUtilities.saveChartAsPNG(Chartline, 800, 600, null, request.getSession());
		String lineURL = request.getContextPath() + "/chart?filename=" + filenameline;
		return lineURL;
	}

	/**
	 * 多条折线
	 * 
	 * @param title
	 * @param x
	 * @param y
	 * @param dataset
	 * @param request
	 * @return
	 * @throws IOException
	 */

	// 设置文字样式
	private static void getCreatePie3DChart(JFreeChart chart) {
		// 设置标题字体
		TextTitle textTitle = chart.getTitle();
		textTitle.setFont(new Font("黑体", Font.PLAIN, 20));
		textTitle.setBackgroundPaint(Color.white);// 标题背景色
		textTitle.setPaint(Color.BLACK);// 标题字体颜色
		// textTitle.setText("类型统计图");// 标题内容
		// 获取绘图区对象
		CategoryPlot plot = (CategoryPlot) chart.getPlot();
		plot.setBackgroundPaint(Color.LIGHT_GRAY); // 设置绘图区背景色
		plot.setRangeGridlinePaint(Color.WHITE); // 设置水平方向背景线颜色
		plot.setRangeGridlinesVisible(true);// 设置是否显示水平方向背景线,默认值为true
		plot.setDomainGridlinePaint(Color.WHITE); // 设置垂直方向背景线颜色
		plot.setDomainGridlinesVisible(true); // 设置是否显示垂直方向背景线,默认值为false

		Color lineColor = new Color(192, 208, 224);
		ValueAxis axis = plot.getRangeAxis();
		axis.setAxisLinePaint(lineColor);// X坐标轴颜色
		axis.setTickMarkPaint(lineColor);// X坐标轴标记|竖线颜色
		// 隐藏Y刻度
		axis.setAxisLineVisible(false);
		axis.setTickMarksVisible(false);
		
		// 设置网格竖线颜色
//		plot.setDomainGridlinePaint(Color.blue);
		plot.setDomainGridlinesVisible(true);
//		// 设置网格横线颜色
		plot.setRangeGridlinePaint(Color.blue);
		// 设置背景色
		plot.setBackgroundPaint(Color.WHITE);
		CategoryAxis domainAxis = plot.getDomainAxis();

		// 设置X轴坐标上的文字
		domainAxis.setTickLabelFont(new Font("sans-serif", Font.PLAIN, 11));
		// 设置X轴的标题文字
		domainAxis.setLabelFont(new Font("黑体", Font.PLAIN, 16));
		// domainAxis.setLabel("");// X轴的标题内容
		domainAxis.setLabelPaint(Color.black);// 标题内容颜色
		domainAxis.setTickLabelPaint(Color.black);// X轴的标题文字颜色
		domainAxis.setTickLabelsVisible(true);// X轴的标题文字是否显示
		domainAxis.setAxisLinePaint(Color.red);// X轴横线颜色
		domainAxis.setTickMarksVisible(true);// 标记线是否显示
		domainAxis.setTickMarkOutsideLength(3);// 标记线向外长度
		domainAxis.setTickMarkInsideLength(3);// 标记线向内长度
		domainAxis.setTickMarkPaint(Color.red);// 标记线颜色
		domainAxis.setUpperMargin(0.05);// 设置距离图片左端距离
		domainAxis.setLowerMargin(0.05); // 设置距离图片右端距离
		// 横轴上的 Lable 是否完整显示
		domainAxis.setMaximumCategoryLabelWidthRatio(0.6f);
		// 横轴上的 Lable 45度倾斜
		domainAxis.setCategoryLabelPositions(CategoryLabelPositions.DOWN_45);

		// 设置Y轴
		ValueAxis rangeAxis = plot.getRangeAxis();
		// 设置Y轴坐标上的文字
		rangeAxis.setTickLabelFont(new Font("sans-serif", Font.PLAIN, 12));
		// 设置Y轴的标题文字
		rangeAxis.setLabelFont(new Font("黑体", Font.PLAIN, 16));
		// Y轴取值范围（下面不能出现 rangeAxis.setAutoRange(true) 否则不起作用）
		// rangeAxis.setRange(100, 600);
		// rangeAxis.setLowerBound(100); //Y轴以开始的最小值
		// rangeAxis.setUpperBound(600);//Y轴的最大值
		// rangeAxis.setLabel("content");// Y轴内容
		rangeAxis.setLabelAngle(1.6);// 标题内容显示角度（1.6时候水平）
		rangeAxis.setLabelPaint(Color.black);// 标题内容颜色
		rangeAxis.setTickLabelPaint(Color.black);// Y轴的标题文字颜色
		rangeAxis.setMinorTickMarksVisible(true);// 标记线是否显示
		rangeAxis.setMinorTickCount(5);// 节段中的刻度数
		rangeAxis.setMinorTickMarkInsideLength(3);// 内刻度线向内长度
		rangeAxis.setMinorTickMarkOutsideLength(3);// 内刻度记线向外长度
		rangeAxis.setTickMarkInsideLength(3);// 外刻度线向内长度
		rangeAxis.setTickMarkPaint(Color.red);// 刻度线颜色
		rangeAxis.setTickLabelsVisible(true);// 刻度数值是否显示
		// 所有Y标记线是否显示（如果前面设置rangeAxis.setMinorTickMarksVisible(true); 则其照样显示）
		rangeAxis.setTickMarksVisible(true);
		rangeAxis.setAxisLinePaint(Color.red);// Y轴竖线颜色
		rangeAxis.setAxisLineVisible(true);// Y轴竖线是否显示
		// 设置最高的一个 Item 与图片顶端的距离 (在设置rangeAxis.setRange(100, 600);情况下不起作用)
		rangeAxis.setUpperMargin(0.15);
		// 设置最低的一个 Item 与图片底端的距离
		rangeAxis.setLowerMargin(0.15);
		rangeAxis.setAutoRange(true);// 是否自动适应范围
		rangeAxis.setVisible(true);// Y轴内容是否显示

		CategoryPlot plotas = chart.getCategoryPlot();// 设置图的高级属性
		// 数据轴精度
		NumberAxis na = (NumberAxis) plotas.getRangeAxis();
		na.setAutoRangeIncludesZero(true);
		DecimalFormat df = new DecimalFormat("#0.00");
		// 数据轴数据标签的显示格式
		na.setNumberFormatOverride(df);

	}
}