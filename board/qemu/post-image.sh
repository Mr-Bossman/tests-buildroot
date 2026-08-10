#!/bin/bash
BOARD_DIR="$(dirname "$0")"

cp ${CONFIG_DIR}/board/qemu/post-image.sh ${BOARD_DIR}/post-image-int.sh
cp ${CONFIG_DIR}/board/qemu/start-qemu.sh.in ${BOARD_DIR}/start-qemu.sh.in

${BOARD_DIR}/post-image-int.sh $@

rm ${BOARD_DIR}/post-image-int.sh
rm ${BOARD_DIR}/start-qemu.sh.in
