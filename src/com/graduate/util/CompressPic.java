package com.graduate.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

/***
 * 上传图片的压缩处理
 * 
 * 缩略图类（通用） 本java类能将jpg、bmp、png、gif图片文件，进行等比或非等比的大小转换。 具体使用方法
 * compressPic(大图片路径,生成小图片路径,大图片文件名,生成小图片文名,生成小图片宽度,生成小图片高度,是否等比缩放(默认为true))
 */
public class CompressPic {

    public static void resizeImage(String srcImgPath, String distImgPath,int width, int height) throws IOException {  

        String subfix = "jpg";

        subfix = srcImgPath.substring(srcImgPath.lastIndexOf(".")+1,srcImgPath.length());

         

        File srcFile = new File(srcImgPath);  

        Image srcImg = ImageIO.read(srcFile);  

         

        BufferedImage buffImg = null; 

        if(subfix.equals("png")){

            buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);

        }else{

            buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        }

     

        Graphics2D graphics = buffImg.createGraphics();

        graphics.setBackground(Color.WHITE);

        graphics.setColor(Color.WHITE);

        graphics.fillRect(0, 0, width, height);

        graphics.drawImage(srcImg.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);  

 

        ImageIO.write(buffImg, subfix, new File(distImgPath));  

    }  

 

public static void main(String[] args) {

        try {  

            resizeImage("D:\\IMG_20161008_223029.jpg","E:\\4.jpg",350,350); 

            System.out.println("处理好了");

			File f = new File("D:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\learner\\html\\file\\4e228f65-2ce3-4e47-9ea2-c2c298c243ef.jpg");
			f.delete();

        } catch (IOException e) {  

            System.out.println("图片转换出现异常！");  

        }  

 

    }

	/*// main测试
	// compressPic(大图片路径,生成小图片路径,大图片文件名,生成小图片文名,生成小图片宽度,生成小图片高度,是否等比缩放(默认为true))
	public static void main(String[] arg) {
		System.out.println("jar包路径：" + System.getProperty("java.library.path"));
		CompressPic mypic = new CompressPic();
		System.out.println("输入的图片大小："
				+ mypic.getPicSize("D:\\1115779_c221d1fc47b97bb1605cddc9c8aec0a7_1391347675.gif") / 1024 + "KB");
		mypic.compressPic("D:\\", "E:\\", "1115779_c221d1fc47b97bb1605cddc9c8aec0a7_1391347675.gif", "r1" + ".jpg", 450,
				450, true);
		int count = 0; // 记录全部图片压缩所用时间
		for (int i = 0; i < 1; i++) {
			int start = (int) System.currentTimeMillis(); // 开始时间
			mypic.compressPic("D:\\", "E:\\", "1115779_c221d1fc47b97bb1605cddc9c8aec0a7_1391347675.gif",
					"r1" + i + ".jpg", 450, 450, true);
			int end = (int) System.currentTimeMillis(); // 结束时间
			int re = end - start; // 但图片生成处理时间
			count += re;
			System.out.println("第" + (i + 1) + "张图片压缩处理使用了: " + re + "毫秒");
			System.out.println("输出的图片大小：" + mypic.getPicSize("E:\\r1.jpg") / 1024 + "KB");
		}
		System.out.println("总共用了：" + count + "毫秒");
	}*/
}