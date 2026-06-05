# Java 后端 (Java Backend)

基于 Spring Boot 构建 GIS 服务端，提供空间数据 API。

## 技术栈
- JDK 21 (Temurin)
- Maven 3.9
- Spring Boot 3.x
- GeoTools (空间数据处理)
- PostGIS (空间数据库 — 加分项)

## 目录结构
```
java-backend/
└── src/main/
    ├── java/         # Java 源代码
    │   └── controller/  # REST API 控制器
    │   └── service/      # 业务逻辑层
    │   └── repository/   # 数据访问层
    └── resources/    # 配置文件 (application.yml)
```

## 启动
```bash
cd java-backend && mvn spring-boot:run
```
