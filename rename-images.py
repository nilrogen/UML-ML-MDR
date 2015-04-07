import os 
import glob

subdir = os.listdir('Images')
for d in subdir:
    if d != 'Images':
        
        path = os.path.join('Images', d)
        if os.path.isdir(path):
            dogname = ''.join(d.split('-')[1:])
            if dogname != '':
                dogdir = os.listdir(path)
                for i in range(len(dogdir)):
                    imgpath = os.path.join(path, dogdir[i])
                    newimgpath = os.path.join(path, "%s_%s.jpg" % (dogname, i))
                    os.rename(os.path.join(path, dogdir[i]), newimgpath)
                os.rename(path, os.path.join('Images', dogname))
