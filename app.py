import platform
import os

def main():
    os_name = platform.system()
    print(f"Xin chào! Bạn đang chạy trên hệ điều hành: {os_name}")

    if os_name == "Windows":
        print("Lệnh mẫu cho Windows: dir")
        os.system("dir")
    else:
        print("Lệnh mẫu cho Linux/Mac: ls -la")
        os.system("ls -la")

if __name__ == "__main__":
    main()
