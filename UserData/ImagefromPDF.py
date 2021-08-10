#extract images from pdf file and saving into local disk
import fitz # PyMuPDF
import io
from PIL import Image
pdf_file = fitz.open("C:\Program Files\Apache Software Foundation\Tomcat 10.0_Tomcat10.0.0\ASS.pdf")
index = 0
# iterate over PDF pages
for page_index in range(len(pdf_file)):
    # get the page itself
    page = pdf_file[page_index]
    image_list = page.getImageList()
    # printing number of images found in this page
    #if image_list:
        #print(f"[+] Found a total of {len(image_list)} images in page {page_index}")
    #else:
        #print("[!] No images found on page", page_index)
    for image_index, img in enumerate(page.getImageList(), start=1):
        # get the XREF of the image
        xref = img[0]
        # extract the image bytes
        base_image = pdf_file.extractImage(xref)
        image_bytes = base_image["image"]
        # get the image extension
        image_ext = base_image["ext"]
        # load it to PIL
        image = Image.open(io.BytesIO(image_bytes))
        # save it to local disk
       	image.save(open(f"image{index}.{image_ext}", "wb"))
        index = index + 1
