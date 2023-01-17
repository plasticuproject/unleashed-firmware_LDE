# Linux Development Environment for Flipper Zero Unleashed-Firmware

Everything needed to modify, develop, and build for the [Flipper Zero Unleashed Firmware](https://github.com/DarkFlippers/unleashed-firmware)

Clone this repository:
- `git clone https://github.com/plasticuproject/unleashed-firmware_LDE.git`

Run:
- `./build_image.sh` to build the Ubuntu development environment docker image.
- `./start_container.sh` to run the disposable docker container with an interactive shell.

To build a Flipper Application Plugin (fap):
- Copy the directory containing your application files to `unleashed-firmware/applications_user/`
- From the `unleashed-firmware` directory run the Flipper Build Tool (fbt) with your application id `./fbt fap_<application-id>`
- Your application binary will be found at `unleashed-firmware/build/f7-firmware-D/.extapps/<application-id>.fap`
