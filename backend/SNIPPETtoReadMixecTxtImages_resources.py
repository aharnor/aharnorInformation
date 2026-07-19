            reader = PdfReader(file_path)
            images = None  # Lazy load images only if we need OCR
            text = ""
            
            for page_num, page in enumerate(reader.pages):
                extracted = page.extract_text()
                
                if extracted and extracted.strip():
                    # Page has digital text, use it
                    text += extracted + "\n"
                else:
                    # Page is empty or an image, run OCR on this specific page
                    print(f"No digital text on page {page_num + 1} of {os.path.basename(file_path)}. Running OCR...")
                    if images is None:
                        images = convert_from_path(file_path)
                    
                    # Match the current page to its converted image
                    if page_num < len(images):
                        text += pytesseract.image_to_string(images[page_num]) + "\n"

Or take 2 
Why this is simpler:

    convert_from_path(file_path) converts every page of the PDF into an image list (one image per page).
    First, we loop through the PDF pages to grab any digital text.
    Second, we loop through the page images to grab any text inside the images.
    Everything is combined into the single text variable, ensuring you never miss anything, even if a page has both.


            reader = PdfReader(file_path)
            images = convert_from_path(file_path)
            text = ""
            
            # 1. Extract all digital text from the PDF
            for page in reader.pages:
                extracted = page.extract_text()
                if extracted:
                    text += extracted + "\n"
            
            # 2. Extract all text from the images in the PDF and append it
            print(f"Running OCR on {os.path.basename(file_path)} to capture image text...")
            for img in images:
                text += pytesseract.image_to_string(img) + "\n"
