# GIS Engineering and Development

GIS 全栈开发实验项目，面向《GIS 工程与开发》课程上机实验。

## 项目结构

```
GIS Engineering and Development/
├── frontend/                  # [1] 前端 — 地图交互界面
│   ├── src/                   # Vue3 源代码
│   ├── public/                # 静态资源
│   └── README.md
├── python-data/               # [2] Python 数据处理 — 空间分析
│   ├── notebooks/             # Jupyter Notebook 实验
│   ├── data/                  # 原始矢量/栅格数据
│   ├── output/                # 处理结果
│   └── README.md
├── java-backend/              # [3] Java 后端 — GIS 服务与 API
│   └── src/main/
│       ├── java/              # 业务逻辑 (Spring Boot)
│       └── resources/         # 配置文件
├── leaflet-map.html           # Leaflet 地图初始化组件（粗略版）
├── leaflet-map-refined.html   # Leaflet 专业地图组件（精化版）
├── check-env.sh               # 环境自检脚本（一键验证）
├── .gitignore                 # Git 忽略规则
└── README.md                  # 项目总说明
```

## 三层架构职责分工

| 层级 | 路径 | 技术 | 在 GIS 工程中的职责 |
|------|------|------|---------------------|
| **前端** | `frontend/` | Vue 3, Leaflet, Vite | 地图可视化与用户交互：加载瓦片底图、渲染矢量图层、实现标注/查询/图层切换等 UI 功能，是 GIS 数据的最终呈现层 |
| **数据处理** | `python-data/` | Python 3.12, geopandas, shapely | 空间数据 ETL 管道：矢量数据读写（Shapefile/GeoJSON）、坐标投影转换、空间连接与缓冲区分析、栅格数据预处理，为前端和后端提供清洗后的数据 |
| **后端** | `java-backend/` | JDK 21, Maven, Spring Boot | GIS 服务端与空间数据库交互：通过 REST API 暴露空间查询接口（WMS/WFS），连接 PostGIS 执行空间 SQL，处理并发请求与权限控制 |

### 数据流

```
[原始数据] → python-data/ (清洗、投影、分析)
                ↓
         java-backend/ (存储到 PostGIS，暴露 API)
                ↓
         frontend/ (Leaflet 渲染，用户交互)
```

## 技术栈

| 类别 | 工具 | 版本 |
|------|------|------|
| 前端 | Node.js | 22.20.0 |
| | npm | 10.9.3 |
| | pnpm | 11.5.1 |
| | Vite | 8.0.16 |
| | Vue | 3.5.35 |
| | Leaflet | 1.9.4 |
| Python | Python | 3.12.13 |
| | geopandas | 1.1.3 |
| | shapely | 2.1.2 |
| | fiona | 1.10.1 |
| | pyproj | 3.7.2 |
| | rtree | 1.4.1 |
| Java | JDK (Temurin) | 21.0.11 LTS |
| | Maven | 3.9.9 |
| DevOps | Git | 2.54.0 |
| | Docker | 28.4.0 |
| 瓦片服务 | 高德地图 | 矢量 + 卫星 |

## 快速开始

### 环境自检
```bash
bash check-env.sh
```

### 前端地图
浏览器直接打开 `leaflet-map.html` 或 `leaflet-map-refined.html`。

### Python 数据处理
```bash
source .venv/Scripts/activate
cd python-data && jupyter notebook
```

### Java 后端
```bash
cd java-backend && mvn spring-boot:run
```

## 功能特性

- 高德矢量/卫星双图层切换
- 鼠标坐标与缩放级别实时显示
- 标记 FIFO 管理（上限 5 个）
- 图层透明度滑块控制
- 用户图例说明面板
- CDN 加载失败降级提示
- requestAnimationFrame 事件节流
- 环境一键自检脚本

## 作者

zzt6708

## 课程信息

《GIS 工程与开发》—— 实验一：GIS 全栈开发环境搭建与 AI 辅助编程
