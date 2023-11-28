import re

def parse_definition(file_path):
    with open(file_path, 'r') as file:
        content = file.read()

    class_definitions = re.split(r'\n(?=\w)', content)

    classes = []
    for class_definition in class_definitions:
        lines = class_definition.strip().split('\n')
        class_name = lines[0].strip()
        attributes = []
        methods = []

        for line in lines[2:]:
            line = line.strip()
            if line:
                if line.startswith(('+', '-')):
                    method_signature = line[1:].strip()
                    access_modifier = 'public' if line.startswith('+') else 'private'
                    methods.append({'access_modifier': access_modifier, 'signature': method_signature})
                else:
                    attribute_declaration = line.split(':')
                    if len(attribute_declaration) == 2:
                        attribute_name = attribute_declaration[0].strip()
                        attribute_type = attribute_declaration[1].strip()
                        attributes.append({'name': attribute_name, 'type': attribute_type})

        classes.append({'name': class_name, 'attributes': attributes, 'methods': methods})

    return classes

def generate_code(classes):
    code = ""
    for class_info in classes:
        code += f"public class {class_info['name']} {{\n"

        for attribute in class_info['attributes']:
            code += f"    private {attribute['type']} {attribute['name']};\n"

        for method in class_info['methods']:
            code += f"    {method['access_modifier']} {method['signature']} {{}}\n"

        code += "}\n\n"

    return code

def main():
    file_path = 'definicao.txt'
    classes = parse_definition(file_path)
    generated_code = generate_code(classes)
    print(generated_code)

if __name__ == "__main__":
    main()