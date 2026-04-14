cmake_minimum_required (VERSION 3.21.1)

project(LeftPaddingParentCrash VERSION 0.0.1 LANGUAGES C CXX ASM)

find_package(Qul)

qul_add_target(LeftPaddingParentCrash QML_PROJECT LeftPaddingParentCrash.qmlproject GENERATE_ENTRYPOINT)
app_target_setup_os(LeftPaddingParentCrash)
