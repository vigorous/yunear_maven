
package com.haopai.util.barcode;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.Binarizer;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.EncodeHintType;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;

/**
 * 二维码生成工具
 * 
 * @author zhangb
 *
 */
public class QrcodeUtil {

	private static final int	BLACK	= 0xFF000000;
	private static final int	WHITE	= 0xFFFFFFFF;

	private QrcodeUtil() {
	}

	public static BufferedImage toBufferedImage(BitMatrix matrix) {
		int width = matrix.getWidth();
		int height = matrix.getHeight();
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		for (int x = 0; x < width; x++) {
			for (int y = 0; y < height; y++) {
				image.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);
			}
		}
		return image;
	}

	public static void writeToFile(BitMatrix matrix, String format, File file) throws IOException {
		BufferedImage image = toBufferedImage(matrix);
		if (!ImageIO.write(image, format, file)) {
			throw new IOException("Could not write an image of format " + format + " to " + file);
		}
	}

	public static void writeToStream(BitMatrix matrix, String format, OutputStream stream)
			throws IOException {
		BufferedImage image = toBufferedImage(matrix);
		if (!ImageIO.write(image, format, stream)) {
			throw new IOException("Could not write an image of format " + format);
		}
	}

	public static void scanQrcode(String imagePath) {
		String contents = null;

		MultiFormatReader formatReader = new MultiFormatReader();

		BufferedImage image;
		try {
			image = ImageIO.read(new File(imagePath));

			// 将图像数据转换为1 bit data
			LuminanceSource source = new BufferedImageLuminanceSource(image);
			Binarizer binarizer = new HybridBinarizer(source);
			// BinaryBitmap是ZXing用来表示1 bit data位图的类，Reader对象将对它进行解析
			BinaryBitmap binaryBitmap = new BinaryBitmap(binarizer);

			Map<DecodeHintType, String> hints = new HashMap<DecodeHintType, String>();
			hints.put(DecodeHintType.CHARACTER_SET, "UTF-8");

			// 对图像进行解码
			Result result = formatReader.decode(binaryBitmap, hints);
			contents = result.toString();

			System.out.println("barcode encoding format :\t " + result.getBarcodeFormat());
			
			System.out.println(contents);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (NotFoundException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 生成二维码
	 * 
	 * @param url
	 *            链接
	 * @param remoteFilePath
	 *            目标目录
	 * @param fileName
	 *            文件名称，包括后缀
	 * @return
	 */
	public static File generateQrcode(String url, String remoteFilePath, String fileName) {
		File file = null;
		try {
			MultiFormatWriter multiFormatWriter = new MultiFormatWriter();
			File dir = new File(remoteFilePath);
			if (!dir.exists()) {
				dir.mkdirs();
			}

			Map<EncodeHintType, String> hints = new HashMap<EncodeHintType, String>();
//			hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
			hints.put(EncodeHintType.CHARACTER_SET, "iso-8859-1");
			BitMatrix bitMatrix = multiFormatWriter.encode(url, BarcodeFormat.QR_CODE, 400, 400,
					hints);
			file = new File(remoteFilePath, fileName);
			writeToFile(bitMatrix, "jpg", file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return file;
	}
	
	public static void main(String[] args) {
		generateQrcode("http://www.baidu.com", "C:\\qrcode", "h.jpg");

		scanQrcode("C:\\qrcode\\h.jpg");
	}

	

}
