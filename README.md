# GIS Engineering and Development

GIS 全栈开发实验项目，面向《GIS 工程与开发》课程上机实验。

## 项目结构

```
GIS Engineering and Development/
├── leaflet-map.html          # Leaflet 地图初始化组件（粗略版）
├── leaflet-map-refined.html  # Leaflet 专业地图组件（精化版）
├── .gitignore                # Git 忽略规则
└── README.md                 # 项目说明
```

## 技术栈

| 层级 | 技术 |
|------|------|
| 前端 | Leaflet 1.9.4、Vanilla JS |
| 瓦片服务 | 高德地图（矢量 + 卫星） |
| CDN | BootCDN 国内镜像 |

## 快速开始

在浏览器中直接打开 `leaflet-map.html` 或 `leaflet-map-refined.html` 即可查看地图。

## 功能特性

- 高德矢量/卫星双图层切换
- 鼠标坐标与缩放级别实时显示
- 标记 FIFO 管理（上限 5 个）
- CDN 加载失败降级提示
- requestAnimationFrame 事件节流

## 作者

zzt6708

## 课程信息

《GIS 工程与开发》—— 实验一：GIS 全栈开发环境搭建与 AI 辅助编程
