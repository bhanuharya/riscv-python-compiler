import re

def tokenize_python_code(code):
    tokens = []
    keywords = set(['int','short','double','float','char','void','for','while','if','else','do','return','include','break'])
    operators = set(['+','-','*','/','=','!','&','|','>','<','>=','<=','++','--','!=','=='])
    special_chars = set(['(',')','[',']','{','}',',',';','\"'])
    
    # Define regular expression patterns
    pattern = r'(\w+)|(\d+\.\d+|\d+)|(\".*?\")|(\S)'
    regex = re.compile(pattern)
    
    # Tokenize the code
    for match in regex.finditer(code):
        token = match.group()
        if token in keywords:
            tokens.append((token, 'keyword'))
        elif token in operators:
            tokens.append((token, 'operator'))
        elif token in special_chars:
            tokens.append((token, 'special_char'))
        elif re.match(r'\d+\.\d+|\d+', token):
            tokens.append((token, 'number'))
        elif re.match(r'\".*?\"', token):
            tokens.append((token, 'string'))
        else:
            tokens.append((token, 'identifier'))
            
    return tokens

# Example usage:
input_code = '''
def bubbleSort(arr):
     
    n = len(arr)
 
    # For loop to traverse through all 
    # element in an array
    for i in range(n):
        for j in range(0, n - i - 1):
             
            # Range of the array is from 0 to n-i-1
            # Swap the elements if the element found 
            #is greater than the adjacent element
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
                 
# Driver code
 
# Example to test the above code
arr = [ 2, 1, 10, 23 ]
 
bubbleSort(arr)
 
print("Sorted array is:")
for i in range(len(arr)):
    print("%d" % arr[i])
'''

tokens = tokenize_python_code(input_code)

print(tokens)
for token in tokens:
    print(token)
