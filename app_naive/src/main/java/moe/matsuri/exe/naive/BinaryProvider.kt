package moe.matsuri.exe.naive

import android.net.Uri
import android.os.ParcelFileDescriptor
import io.nekohasekai.sagernet.plugin.NativePluginProvider
import io.nekohasekai.sagernet.plugin.PathProvider
import java.io.File
import java.io.FileNotFoundException

class BinaryProvider : NativePluginProvider() {
    override fun populateFiles(provider: PathProvider) {
        provider.addPath("naive-plugin", 0b111101101)
    }

    override fun getExecutable() = context!!.applicationInfo.nativeLibraryDir + "/libnaive.so"

    override fun openFile(uri: Uri): ParcelFileDescriptor = when (uri.path) {
        "/naive-plugin" -> ParcelFileDescriptor.open(
            File(getExecutable()),
            ParcelFileDescriptor.MODE_READ_ONLY
        )
        else -> throw FileNotFoundException()
    }
}
