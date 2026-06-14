allprojects {
    repositories {
        google()
        mavenCentral()
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

// Back-fill `namespace` for plugins whose build.gradle predates Android
// Gradle Plugin 8 (which made it mandatory). Without this, such plugins —
// e.g. vosk_flutter_2 — fail configuration with "Namespace not specified".
// The value is taken from the plugin's AndroidManifest `package` attribute.
subprojects {
    afterEvaluate {
        val androidExt = extensions.findByName("android") ?: return@afterEvaluate
        val getNamespace = androidExt.javaClass.methods.firstOrNull {
            it.name == "getNamespace" && it.parameterCount == 0
        }
        val setNamespace = androidExt.javaClass.methods.firstOrNull {
            it.name == "setNamespace" && it.parameterCount == 1
        }
        if (getNamespace != null && setNamespace != null &&
            getNamespace.invoke(androidExt) == null
        ) {
            val manifest = file("src/main/AndroidManifest.xml")
            if (manifest.exists()) {
                val pkg = Regex("package=\"([^\"]+)\"")
                    .find(manifest.readText())?.groupValues?.get(1)
                if (pkg != null) {
                    setNamespace.invoke(androidExt, pkg)
                    println("Back-filled namespace '$pkg' for ${project.name}")
                }
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
