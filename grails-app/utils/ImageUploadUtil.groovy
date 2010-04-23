import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

class ImageUploadUtil {
    public static uploadImage(inputName, request, params, imagesPath) {
    	def file = request.getFile(inputName)
    	if(file && !file.empty){    		
    		
    		if (imagesPath.contains('mugshots'))
    			params.mugshot = file.originalFilename
    		else
    			params.logo = file.originalFilename
    			
			try {
				// Read the original image from the Server Location
				BufferedImage bufferedImage = ImageIO.read(file.inputStream);				
				/// Write the image
				ImageIO.write(createResizedCopy(bufferedImage), "jpg", new File("${imagesPath}/${file.originalFilename}"));
			} catch (Exception e) {
				println "Problem with image: ${e}"
			}
    	} else {
    		params.mugshot = 'default.gif'
    	}	
    }
    
	private static BufferedImage createResizedCopy(Image originalImage) {		
		int scaledWidth = 200
		float scale = originalImage.width / scaledWidth 
		int scaledHeight = originalImage.height / scale 
		
		BufferedImage scaledBI = new BufferedImage(scaledWidth, scaledHeight, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = scaledBI.createGraphics();
		g.setComposite(AlphaComposite.Src);
		g.drawImage(originalImage, 0, 0, scaledWidth, scaledHeight, null);
		g.dispose();
		return scaledBI;
	}  		
}