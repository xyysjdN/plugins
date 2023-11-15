set -e

mkdir_libs() {
  rm -rf "$1"
  mkdir "$1"
  cd "$1"
  mkdir arm64-v8a armeabi-v7a x86 x86_64
}

unzip_xray() {
  rm -rf tmp
  unzip -d tmp tmp.zip
  mv tmp/xray "$1"/libxray.so
  rm -rf tmp tmp.zip
}

unzip_singbox() {
  rm -rf tmp
  mkdir tmp
  tar -zxvf tmp.tar.gz -C tmp
  mv tmp/*/sing-box "$1"/libsingbox.so
  rm -rf tmp tmp.tar.gz
}

unzip_juicity() {
  rm -rf tmp
  unzip -d tmp tmp.zip
  mv tmp/juicity-client "$1"/libjuicity.so
  rm -rf tmp tmp.zip
}

unzip_naive() {
  rm -rf tmp
  mkdir tmp
  tar -xvf naiveproxy.tar.xz -C tmp
  mv tmp/*/naive "$1"/libnaive.so
  rm -rf tmp naiveproxy.tar.xz
}

download_xray() {
  VERSION="v1.8.4"
  mkdir_libs "app_xray/libs"

  dl_and_chmod arm64-v8a/libxray.so "https://github.com/maskedeken/Xray-core/releases/download/$VERSION/xray-android-arm64"
  dl_and_chmod armeabi-v7a/libxray.so "https://github.com/maskedeken/Xray-core/releases/download/$VERSION/xray-android-arm"
  dl_and_chmod x86_64/libxray.so "https://github.com/maskedeken/Xray-core/releases/download/$VERSION/xray-android-x64"
  dl_and_chmod x86/libxray.so "https://github.com/maskedeken/Xray-core/releases/download/$VERSION/xray-android-x86"
}

download_singbox() {
  VERSION="1.7.0-beta.2"
  mkdir_libs "app_singbox/libs"
  dl_and_chmod arm64-v8a/libsingbox.so "https://github.com/maskedeken/sing-box/releases/download/v$VERSION/sing-box-android-arm64"
  dl_and_chmod armeabi-v7a/libsingbox.so "https://github.com/maskedeken/sing-box/releases/download/v$VERSION/sing-box-android-arm"
}

download_naive() {
  VERSION="116.0.5845.92-2"
  mkdir_libs "app_naive/libs"

  curl -Lso naiveproxy.tar.xz "https://github.com/klzgrad/naiveproxy/releases/download/v$VERSION/naiveproxy-v$VERSION-android-arm64.tar.xz"
  unzip_naive arm64-v8a
  curl -Lso naiveproxy.tar.xz "https://github.com/klzgrad/naiveproxy/releases/download/v$VERSION/naiveproxy-v$VERSION-android-arm.tar.xz"
  unzip_naive armeabi-v7a
}

download_trojan-go() {
  VERSION="0.10.15"
  mkdir_libs "app_trojan-go/libs"
  dl_and_chmod arm64-v8a/libtrojan-go.so "https://github.com/maskedeken/trojan-go/releases/download/v$VERSION/trojan-go-android-arm64"
  dl_and_chmod armeabi-v7a/libtrojan-go.so "https://github.com/maskedeken/trojan-go/releases/download/v$VERSION/trojan-go-android-arm"
}

dl_and_chmod() {
  curl -fLso "$1" "$2" && chmod +x "$1"
}

download_brook() {
  VERSION="v20220707"
  mkdir_libs "app_brook/libs"

  dl_and_chmod arm64-v8a/libbrook.so "https://github.com/txthinking/brook/releases/download/$VERSION/brook_linux_arm64"
  dl_and_chmod armeabi-v7a/libbrook.so "https://github.com/txthinking/brook/releases/download/$VERSION/brook_linux_arm7"
  dl_and_chmod x86/libbrook.so "https://github.com/txthinking/brook/releases/download/$VERSION/brook_linux_386"
  dl_and_chmod x86_64/libbrook.so "https://github.com/txthinking/brook/releases/download/$VERSION/brook_linux_amd64"
}

download_hysteria() {
  VERSION="app/v2.2.0"
  mkdir_libs "app_hysteria/libs"

  dl_and_chmod arm64-v8a/libhysteria.so "https://github.com/apernet/hysteria/releases/download/$VERSION/hysteria-linux-arm64"
  dl_and_chmod armeabi-v7a/libhysteria.so "https://github.com/apernet/hysteria/releases/download/$VERSION/hysteria-linux-arm"
  dl_and_chmod x86/libhysteria.so "https://github.com/apernet/hysteria/releases/download/$VERSION/hysteria-linux-386"
  dl_and_chmod x86_64/libhysteria.so "https://github.com/apernet/hysteria/releases/download/$VERSION/hysteria-linux-amd64"
}

download_tuic() {
  mkdir_libs "app_tuic/libs"

  dl_and_chmod arm64-v8a/libtuic.so "https://github.com/MatsuriDayo/tuic/releases/download/rel/tuic-client-0.8.5-2-aarch64-android"
  dl_and_chmod x86_64/libtuic.so "https://github.com/MatsuriDayo/tuic/releases/download/rel/tuic-client-0.8.5-2-x86_64-android"
}

download_tuic5() {
  VERSION="1.0.0-3"
  mkdir_libs "app_tuic5/libs"

  dl_and_chmod arm64-v8a/libtuic.so "https://github.com/MatsuriDayo/tuic/releases/download/rel/tuic-client-"$VERSION"-aarch64-linux-android"
  dl_and_chmod armeabi-v7a/libtuic.so "https://github.com/MatsuriDayo/tuic/releases/download/rel/tuic-client-"$VERSION"-armv7-linux-androideabi"
  dl_and_chmod x86/libtuic.so "https://github.com/MatsuriDayo/tuic/releases/download/rel/tuic-client-"$VERSION"-i686-linux-android"
  dl_and_chmod x86_64/libtuic.so "https://github.com/MatsuriDayo/tuic/releases/download/rel/tuic-client-"$VERSION"-x86_64-linux-android"
}

download_juicity() {
  VERSION="v0.3.0"
  mkdir_libs "app_juicity/libs"

  dl_and_chmod arm64-v8a/libjuicity.so "https://github.com/maskedeken/juicity/releases/download/"$VERSION"/juicity-client-android-arm64"
  dl_and_chmod armeabi-v7a/libjuicity.so "https://github.com/maskedeken/juicity/releases/download/"$VERSION"/juicity-client-android-arm"
  dl_and_chmod x86/libjuicity.so "https://github.com/maskedeken/juicity/releases/download/"$VERSION"/juicity-client-android-x86"
  dl_and_chmod x86_64/libjuicity.so "https://github.com/maskedeken/juicity/releases/download/"$VERSION"/juicity-client-android-x64"
}

download_"$1"
