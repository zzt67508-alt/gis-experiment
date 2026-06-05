#!/bin/bash
# ============================================================
# GIS 全栈开发环境自检脚本
# 验证 Node.js / Python / Java / Git / Docker 版本
# 用法: bash check-env.sh
# ============================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo "=============================================="
echo "  GIS 全栈开发环境自检"
echo "  $(date '+%Y-%m-%d %H:%M:%S')"
echo "=============================================="

# -------- Node.js --------
echo ""
echo -e "${CYAN}[1/5] Node.js 前端运行时${NC}"
if command -v node &> /dev/null; then
    NODE_VER=$(node -v 2>&1)
    echo -e "  状态: ${GREEN}OK${NC}   版本: $NODE_VER"
else
    echo -e "  状态: ${RED}MISSING${NC}  请安装 Node.js"
fi

if command -v npm &> /dev/null; then
    NPM_VER=$(npm -v 2>&1)
    echo -e "  npm:  ${GREEN}OK${NC}   版本: $NPM_VER"
fi

if command -v pnpm &> /dev/null; then
    PNPM_VER=$(pnpm --version 2>&1)
    echo -e "  pnpm: ${GREEN}OK${NC}   版本: $PNPM_VER"
fi

# -------- Python --------
echo ""
echo -e "${CYAN}[2/5] Python 空间数据处理${NC}"
if command -v python &> /dev/null; then
    PY_VER=$(python --version 2>&1)
    echo -e "  状态: ${GREEN}OK${NC}   $PY_VER"
else
    echo -e "  状态: ${RED}MISSING${NC}  请安装 Python"
fi

python -c "import geopandas" 2>/dev/null && \
    echo -e "  geopandas: ${GREEN}OK${NC}" || \
    echo -e "  geopandas: ${RED}MISSING${NC}  请 pip install geopandas"

python -c "import shapely" 2>/dev/null && \
    echo -e "  shapely:   ${GREEN}OK${NC}" || \
    echo -e "  shapely:   ${RED}MISSING${NC}"

python -c "import fiona" 2>/dev/null && \
    echo -e "  fiona:     ${GREEN}OK${NC}" || \
    echo -e "  fiona:     ${RED}MISSING${NC}"

# -------- Java --------
echo ""
echo -e "${CYAN}[3/5] Java 后端环境${NC}"
if command -v java &> /dev/null; then
    JAVA_VER=$(java -version 2>&1 | head -1)
    echo -e "  状态: ${GREEN}OK${NC}   $JAVA_VER"
else
    # 尝试 E 盘路径
    if [ -f "E:/Java/jdk-21/bin/java.exe" ]; then
        JAVA_VER=$("E:/Java/jdk-21/bin/java" -version 2>&1 | head -1)
        echo -e "  状态: ${GREEN}OK${NC}   $JAVA_VER  (E:/Java/jdk-21)"
    else
        echo -e "  状态: ${RED}MISSING${NC}  请安装 JDK 21"
    fi
fi

if command -v mvn &> /dev/null; then
    MVN_VER=$(mvn -v 2>&1 | head -1)
    echo -e "  状态: ${GREEN}OK${NC}   $MVN_VER"
else
    if [ -f "E:/apache-maven-3.9.9/bin/mvn" ]; then
        echo -e "  状态: ${GREEN}OK${NC}   Maven 3.9.9  (E:/apache-maven-3.9.9)"
    else
        echo -e "  状态: ${RED}MISSING${NC}  请安装 Maven"
    fi
fi

# -------- Git --------
echo ""
echo -e "${CYAN}[4/5] Git 版本控制${NC}"
if command -v git &> /dev/null; then
    GIT_VER=$(git --version 2>&1)
    echo -e "  状态: ${GREEN}OK${NC}   $GIT_VER"
    echo -e "  用户: $(git config user.name) <$(git config user.email)>"
else
    echo -e "  状态: ${RED}MISSING${NC}  请安装 Git"
fi

# -------- Docker --------
echo ""
echo -e "${CYAN}[5/5] Docker 容器 (加分项)${NC}"
if command -v docker &> /dev/null; then
    DOCKER_VER=$(docker --version 2>&1)
    echo -e "  状态: ${GREEN}OK${NC}   $DOCKER_VER"
else
    echo -e "  状态: ${RED}MISSING${NC}  (非必需项)"
fi

# -------- 汇总 --------
echo ""
echo "=============================================="
echo "  自检完成"
echo "=============================================="
