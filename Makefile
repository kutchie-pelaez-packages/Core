PACKAGE_NAME="Core"
DOCCARCHIVE_PATH=".artifacts/Build/Products/Debug-iphonesimulator/${PACKAGE_NAME}.doccarchive"
DESTINATION="platform=iOS Simulator,name=iPhone 13"
DOCC_PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/docc"

generate_docs:
	xcodebuild docbuild \
		-scheme ${PACKAGE_NAME} \
		-derivedDataPath .artifacts \
		-destination ${DESTINATION}

	${DOCC_PATH} process-archive \
		transform-for-static-hosting ${DOCCARCHIVE_PATH} \
		--output-path docs \
		--hosting-base-path ${PACKAGE_NAME}

	rm -r .artifacts
