allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

subprojects {
    afterEvaluate {
        project.extensions.findByName("android")?.let { ext ->
            try {
                val getNamespace = ext::class.java.methods.find { it.name == "getNamespace" }
                val setNamespace = ext::class.java.methods.find { it.name == "setNamespace" }
                if (getNamespace != null && setNamespace != null) {
                    val namespace = getNamespace.invoke(ext) as? String
                    if (namespace == null || namespace.isEmpty()) {
                        val group = project.group.toString()
                        if (group.isNotEmpty()) {
                            setNamespace.invoke(ext, group)
                        } else {
                            setNamespace.invoke(ext, "com.example." + project.name.replace("-", "_"))
                        }
                    }
                }
            } catch (e: Exception) {
            }
        }
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
