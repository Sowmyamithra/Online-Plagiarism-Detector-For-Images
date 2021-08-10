import os;

for file in os.listdir('C:\\Users\\Dell\\OneDrive\\Desktop\\PROJECT\\UserData'):
	if file.endswith('.jpeg') or file.endswith('.jpg') or file.endswith('.png'):
		#print('C:\\Users\\Dell\\OneDrive\\Desktop\\PROJECT\\UserData\\' + file);
		os.remove('C:\\Users\\Dell\\OneDrive\\Desktop\\PROJECT\\UserData\\' + file);
os.remove('C:\\Users\\Dell\\OneDrive\\Desktop\\PROJECT\\RESULT\\Result.xlsx');
os.remove('C:\\Users\\Dell\\OneDrive\\Desktop\\PROJECT\\RESULT\\PlagiarisedImages.docx');
os.remove('C:\\Program Files\\Apache Software Foundation\\Tomcat 10.0_Tomcat10.0.0\\ASS.pdf');

