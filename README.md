# 🚀 Setup-Dev: Windows Developer Environment **ONE-CLICK**

![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-005BAA?style=for-the-badge&logo=PowerShell)
![Winget](https://img.shields.io/badge/Winget-1.0+-0DBC79?style=for-the-badge&logo=winget)
![Windows](https://img.shields.io/badge/Windows-10/11-00C6F8?style=for-the-badge&logo=windows)

**Automated PowerShell script** that installs **+25 applications** for a complete **full-stack**, **data science**, **DevOps** development environment on **Windows 10/11** with **one click**.

## 📦 What's Installed Automatically

### **1. Programming Languages (8 Languages)**
| Language | Versions | 🎯 Use Case |
|----------|----------|-------------|
| **Python** | 3.11 • 3.12 • 3.13 | Data Science, AI/ML, Web |
| **Node.js** | LTS | JS/TS Backend |
| **Go** | Latest | System APIs |
| **Rust** | MSVC | Performance |
| **Java** | JDK 21 | Enterprise |
| **.NET** | SDK 8 | C# |
| **Ruby** | 3.2 | Rails |
| **PHP** | Latest | Web |

### **2. Essential Tools (10+)**
```
🔧 Git -  Visual Studio Code -  Docker Desktop
🔧 Windows Terminal -  Postman -  DBeaver (DB Manager)
🔧 7-Zip -  Notepad++ -  HTTPie (CLI)
```

### **3. Databases (4)**
```
🗄️ PostgreSQL -  MySQL -  MongoDB -  Redis
```

## 🎮 **USAGE: 1 CLICK = FULL SETUP**

**🚀 LAUNCH**: Right-click `start.bat` → **"Run as administrator"**

## ⏱️ Automatic Process (20-45 min)

```
1️⃣  Admin check → OK
2️⃣  Install 25+ apps via winget
3️⃣  Python packages (3 versions + default)
4️⃣  Global Node.js packages
5️⃣  Verify installed versions
6️⃣  🎉 "INSTALLATION COMPLETE!"
```

## 🐍 Python Packages Installed (40+)
```
Data/ML: numpy pandas matplotlib seaborn scikit-learn tensorflow torch opencv-python
Web/API: flask django fastapi uvicorn requests httpx aiohttp pydantic
Scraping: beautifulsoup4 selenium scrapy
DB/ORM: sqlalchemy psycopg2-binary pymongo redis
Dev/Tests: pytest black flake8 pylint mypy jupyter ipython
Utils: python-dotenv pyyaml click rich boto3 sphinx pillow
```

## ⚡ Global Node.js Packages
```
express typescript ts-node jest eslint prettier nodemon dotenv axios
```

## ✅ **POST-INSTALL VERIFICATION**

After restart, new terminal:
```powershell
python --version    # Python 3.13.x
node --version      # v20.x.x LTS
git --version       # git version 2.x
docker --version    # Docker version 27.x
go version          # go version 1.x.x
rustc --version     # rustc 1.x.x
```

## ⚠️ Minimum Requirements
```
✅ Windows 10/11 (build 19041+)
✅ Winget (included since 2021)
✅ 15-20GB free disk space
✅ Stable internet connection
✅ PowerShell 5.1+ (included)
```

## 🔧 Quick Troubleshooting

| ❌ Issue | ✅ Solution |
|---------|------------|
| **"Administrator required"** | Right-click → Run as Admin |
| **Winget error** | `winget --info` + reboot |
| **Python not found** | Reboot + new terminal |
| **Pip packages fail** | `python -m pip install --upgrade pip` |
| **Docker won't start** | Enable Hyper-V/WHP |

## 📈 Time & Space

| Phase | Time | Space |
|-------|------|-------|
| Languages | 10 min | 8GB |
| Tools | 5 min | 3GB |
| DB | 8 min | 4GB |
| **Total** | **~25 min** | **~15GB** |

## 🔄 **MANDATORY Post-Installation**
```
1. ❌ CLOSE all terminals
2. 🔄 RESTART Windows
3. ✅ Open NEW PowerShell/Terminal
4. 🎯 Test: `python --version`
```

## 📝 License & Author

```
MIT License © 2026 ATS

Fork, star, contribute! 💪
Improve via Pull Request with new apps.
```

## 🎯 Why This Script?
```
✅ Zero manual configuration
✅ Complete pro dev setup
✅ Portable (bat + ps1 same folder)
✅ GitHub-ready open source
```
