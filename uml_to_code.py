import tkinter as tk
from pyparsing import Word, alphas, Group, ZeroOrMore, Suppress, Optional, oneOf
import unittest

# Classe para representar uma UML Class
class UMLClass:
    def __init__(self, name):
        self.name = name
        self.attributes = []
        self.methods = []

    def add_attribute(self, attr):
        self.attributes.append(attr)

    def add_method(self, method):
        self.methods.append(method)

# Classe para gerar código
class CodeGenerator:
    def generate_class(self, uml_class):
        code = f"class {uml_class.name}:\n"
        for attr in uml_class.attributes:
            code += f"    {attr[0]}: {attr[1]}\n"
        for method in uml_class.methods:
            code += f"    def {method[0]}(self):\n        pass\n"
        return code

# Função para analisar UML
def parse_uml(text):
    identifier = Word(alphas)
    attribute = Group(identifier + Suppress(":") + identifier)
    method = Group(identifier + Suppress("()"))
    classDef = Group(identifier + Suppress("{") + ZeroOrMore(attribute | method) + Suppress("}"))

    parsedResult = classDef.parseString(text)
    uml_class = UMLClass(parsedResult[0])
    for item in parsedResult[1:]:
        if len(item) == 2:
            uml_class.add_attribute(item)
        else:
            uml_class.add_method(item)
    return uml_class

# Interface Gráfica
def generate_code():
    uml_text = text_input.get("1.0", "end-1c")
    uml_class = parse_uml(uml_text)
    code = code_generator.generate_class(uml_class)
    code_output.delete("1.0", "end")
    code_output.insert("1.0", code)

root = tk.Tk()
root.title("UML to Code Generator")

text_input = tk.Text(root, height=10)
text_input.pack()

generate_button = tk.Button(root, text="Generate", command=generate_code)
generate_button.pack()

code_output = tk.Text(root, height=10)
code_output.pack()

code_generator = CodeGenerator()

root.mainloop()

# Testes Unitários
class TestCodeGeneration(unittest.TestCase):
    def test_class_generation(self):
        uml_class = UMLClass("Test")
        uml_class.add_attribute(("attr1", "int"))
        uml_class.add_method(("method1",))
        code = code_generator.generate_class(uml_class)
        self.assertIn("class Test:", code)
        self.assertIn("attr1: int", code)
        self.assertIn("def method1(self):", code)

if __name__ == '__main__':
    unittest.main()
