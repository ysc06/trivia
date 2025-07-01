

def is_symmetrical_title(title):
    title = title.lower() 

    title = "".join(title.split())


    pt1 = 0 
    pt2 = len(title) - 1
    while pt1 < pt2: 
        if title[pt1] == title[pt2]:
            pt1 += 1
            pt2 -= 1 
        else:
            return False 
        
    return True
     

print(is_symmetrical_title("A Santa at NASA"))
print(is_symmetrical_title("Social Media")) 