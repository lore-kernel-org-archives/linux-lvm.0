From: Helen Koike <helen.koike@collabora.com>
Date: Wed, 26 Sep 2018 02:00:45 -0300
Message-Id: <cover.1537936397.git.helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] [PATCH 0/2] boot to a mapped device
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: dm-devel@redhat.com
Cc: wad@chromium.org, snitzer@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-lvm@redhat.com, enric.balletbo@collabora.com, kernel@collabora.com, agk@redhat.com

This series is reviving an old patchwork.
Booting from a mapped device requires an initramfs. This series is
allows for device-mapper targets to be configured at boot time for
use early in the boot process (as the root device or otherwise).

Example, the following could be added in the boot parameters.
dm="lroot,,,rw, 0 4096 linear 98:16 0, 4096 4096 linear 98:32 0" root=/dev/dm-0

Enric Balletbo i Serra (1):
  dm ioctl: add a device mapper ioctl function.

Will Drewry (1):
  init: add support to directly boot to a mapped device

 .../admin-guide/kernel-parameters.rst         |   1 +
 .../admin-guide/kernel-parameters.txt         |   3 +
 Documentation/device-mapper/dm-boot.txt       |  63 +++
 drivers/md/dm-ioctl.c                         |  50 ++
 include/linux/device-mapper.h                 |   6 +
 init/Makefile                                 |   1 +
 init/do_mounts.c                              |   1 +
 init/do_mounts.h                              |  10 +
 init/do_mounts_dm.c                           | 475 ++++++++++++++++++
 9 files changed, 610 insertions(+)
 create mode 100644 Documentation/device-mapper/dm-boot.txt
 create mode 100644 init/do_mounts_dm.c

-- 
2.19.0
