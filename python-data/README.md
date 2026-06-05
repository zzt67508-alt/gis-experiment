# Python 数据处理 (Python Data Processing)

基于 geopandas + shapely 进行 GIS 空间数据分析与处理。

## 技术栈
- Python 3.12
- geopandas (矢量数据处理)
- shapely (几何运算)
- fiona (文件读写)
- pyproj (坐标投影)
- rtree (空间索引)

## 目录结构
```
python-data/
├── notebooks/       # Jupyter Notebook 实验记录
├── data/           # 原始数据 (Shapefile、GeoJSON、CSV)
└── output/          # 处理结果输出
```

## 安装依赖
```bash
source .venv/Scripts/activate && pip install geopandas shapely fiona pyproj rtree
```
