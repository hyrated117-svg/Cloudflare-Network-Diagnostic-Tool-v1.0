#!/usr/bin/env python3
"""
JSON Validator Utility
Validates JSON files for syntax errors and schema compliance
"""

import json
import sys
import os
from pathlib import Path

def validate_json(file_path):
    """Validate JSON file syntax."""
    try:
        with open(file_path, 'r') as f:
            json.load(f)
        return True, "Valid JSON"
    except json.JSONDecodeError as e:
        return False, f"JSON Error at line {e.lineno}: {e.msg}"
    except FileNotFoundError:
        return False, f"File not found: {file_path}"
    except Exception as e:
        return False, f"Error: {str(e)}"

def validate_directory(directory, pattern="*.json"):
    """Validate all JSON files in directory."""
    results = {"valid": 0, "invalid": 0, "errors": []}
    
    for file_path in Path(directory).glob(f"**/{pattern}"):
        is_valid, message = validate_json(str(file_path))
        
        if is_valid:
            results["valid"] += 1
            print(f"✓ {file_path}")
        else:
            results["invalid"] += 1
            results["errors"].append({"file": str(file_path), "error": message})
            print(f"✗ {file_path}: {message}")
    
    return results

def main():
    if len(sys.argv) < 2:
        print("Usage: validate-json.py <file_or_directory>")
        print("Example: validate-json.py config.json")
        print("Example: validate-json.py ./config/")
        sys.exit(1)
    
    target = sys.argv[1]
    
    print("🔍 JSON Validator")
    print("=" * 50)
    
    if os.path.isfile(target):
        is_valid, message = validate_json(target)
        if is_valid:
            print(f"✓ {target}: {message}")
            sys.exit(0)
        else:
            print(f"✗ {target}: {message}")
            sys.exit(1)
    
    elif os.path.isdir(target):
        print(f"Validating JSON files in: {target}")
        results = validate_directory(target)
        
        print("\n" + "=" * 50)
        print(f"Valid files: {results['valid']}")
        print(f"Invalid files: {results['invalid']}")
        
        if results["errors"]:
            print("\nErrors:")
            for error in results["errors"]:
                print(f"  - {error['file']}: {error['error']}")
            sys.exit(1)
        else:
            print("\n✅ All JSON files are valid!")
            sys.exit(0)
    
    else:
        print(f"❌ Error: {target} is not a file or directory")
        sys.exit(1)

if __name__ == "__main__":
    main()
