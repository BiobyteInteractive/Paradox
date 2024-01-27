package shader

import "core:strings"
import "core:os"
import "core:fmt"
import gl "vendor:OpenGL"

Shader :: struct {
    ID: u32,
}

New :: proc(vertexPath: string, fragmentPath: string) -> ^Shader {
    shader := Shader{}
    
    vertexCode, readVertexOk := os.read_entire_file(vertexPath, context.allocator)
    if !readVertexOk {
        fmt.eprintln("Could not load vertex shader.")
    }
    defer delete(vertexCode, context.allocator)

    fragmentCode, readFragmentOk := os.read_entire_file(fragmentPath, context.allocator)
    if !readFragmentOk {
        fmt.eprintln("Could not load vertex shader.")
    }
    defer delete(vertexCode, context.allocator)

    vertex, fragment: u32
    success: i32

    vertex = gl.CreateShader(gl.VERTEX_SHADER)
    gl.ShaderSource(vertex, 1, cast(^cstring) &vertexCode, nil)
    gl.CompileShader(vertex)
    gl.GetShaderiv(vertex, gl.COMPILE_STATUS, &success)
    if !bool(success) {
        fmt.eprintln("Vertex shader compilation failed.")
    }

    fragment = gl.CreateShader(gl.FRAGMENT_SHADER)
    gl.ShaderSource(fragment, 1, cast(^cstring) &fragmentCode, nil)
    gl.CompileShader(fragment)
    gl.GetShaderiv(fragment, gl.COMPILE_STATUS, &success)
    if !bool(success) {
        fmt.eprintln("Fragment shader compilation failed.")
    }

    shader.ID = gl.CreateProgram()
    gl.AttachShader(shader.ID, vertex)
    gl.AttachShader(shader.ID, fragment)
    gl.LinkProgram(shader.ID)

    gl.GetProgramiv(shader.ID, gl.LINK_STATUS, &success)
    if !bool(success) {
        fmt.eprintln("Failed to link the shader program.")
    }

    gl.DeleteShader(vertex)
    gl.DeleteShader(fragment)

    return &shader
}

Use :: proc(shader: ^Shader) {
    gl.UseProgram(shader.ID)
}

SetBool :: proc(shader: ^Shader, name: string, value: bool) {
    gl.Uniform1i(gl.GetUniformLocation(shader.ID, strings.clone_to_cstring(name)), i32(value))
}

SetInt :: proc(shader: ^Shader, name: string, value: i32) {
    gl.Uniform1i(gl.GetUniformLocation(shader.ID, strings.clone_to_cstring(name)), value)
}

SetFloat :: proc(shader: ^Shader, name: string, value: f32) {
    gl.Uniform1f(gl.GetUniformLocation(shader.ID, strings.clone_to_cstring(name)), value)
}