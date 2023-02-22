cmake_minimum_required(VERSION 3.24)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

project(plannxt)

set(CMAKE_CXX_STANDARD 17)

set(GLEW_H /usr/local/Cellar/glew/2.2.0_1/include/GL)
set(GLFW_H /usr/local/Cellar/glfw/3.3.8/include/GLFW)
set(GLAD_H /usr/local/include/glad)
set(KH_H /usr/local/include/KHR)
set(GL_H /usr/local/include/GL)
include_directories(${OPENGL_INCLUDE_DIRS} ${GLEW_H} ${GLFW_H} ${GLAD_H} ${KH_H} ${GL_H})

# 添加目标链接
set(GLEW_LINK /usr/local/Cellar/glew/2.2.0_1/lib/libGLEW.2.2.dylib)
set(GLFW_LINK /usr/local/Cellar/glfw/3.3.8/lib/libglfw.3.dylib)
link_libraries(${OPENGL} ${GLEW_LINK} ${GLFW_LINK})

# 执行编译命令
# 这个glad.c要拉到项目中，注意路径
set(SOURCE_FILES "src/glad.c" "room.cpp" "src/chair.cpp" "src/cupboard.cpp" "src/fan.cpp" "src/shelf.cpp" "src/snowman.cpp" "src/table.cpp" "src/window.cpp")
add_executable(plannxt ${SOURCE_FILES})

# mac下这步很重要
if (APPLE)
    target_link_libraries(plannxt "-framework OpenGL")
    target_link_libraries(plannxt "-framework GLUT")
endif()
