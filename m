From: "Dale Gallagher" <foobar@mighty.co.za>
Message-ID: <web-210716707@mail01.infosat.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Compile problem - Linux 2.6.1 + LVM2.2.00.08
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Jan 19 06:20:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi there

I Cannot compile LVM2.2.00.08 on a system with the
following info.  Compilation error output included too.
 Help would be appreciated - this is my first attempt to
run a system with LVM and thought it best to get going with
the latest stable kernel and LVM to prevent migration
headaches at a later stage.  Thanks.

Slackware 9.1

/ and /boot on ext3 paritions and swap separate
would like to use remaining disk space with LVM

kernel-headers-2.4.22-i386-1
gcc-3.2.3-i486-2
gcc-g++-3.2.3-i486-1

Successfully built and running Linux 2.6.1 with:

#
# Multi-device support (RAID and LVM)
#
CONFIG_MD=y
# CONFIG_BLK_DEV_MD is not set
CONFIG_BLK_DEV_DM=y
CONFIG_DM_IOCTL_V4=y

cd /usr/src/build/LVM2.2.00.08
./configure --enable-readline --with-lvm1=none

resulted in compilation failure... see below:

----- <snip> -----
In file included from activate/activate.c:9:
activate/activate.h:13:28: libdevmapper.h: No such file or
directory
activate/activate.c: In function `library_version':
activate/activate.c:119: warning: implicit declaration of
function `dm_get_library_version'
activate/activate.c: In function `driver_version':
activate/activate.c:133: warning: implicit declaration of
function `dm_task_create'
activate/activate.c:133: `DM_DEVICE_VERSION' undeclared
(first use in this function)
activate/activate.c:133: (Each undeclared identifier is
reported only once
activate/activate.c:133: for each function it appears in.)
activate/activate.c:133: warning: assignment makes pointer
from integer without a cast
activate/activate.c:138: warning: implicit declaration of
function `dm_task_run'
activate/activate.c:141: warning: implicit declaration of
function `dm_task_get_driver_version'
activate/activate.c:147: warning: implicit declaration of
function `dm_task_destroy'
activate/activate.c: In function `_lv_info':
activate/activate.c:160: storage size of `dminfo' isn't
known
activate/activate.c:160: warning: unused variable `dminfo'
make[1]: *** [activate/activate.o] Error 1
make[1]: *** Waiting for unfinished jobs....
commands/toolcontext.c: In function `_process_config':
commands/toolcontext.c:151: warning: implicit declaration
of function `dm_set_dev_dir'
make[1]: *** [commands/toolcontext.o] Error 1
make[1]: Leaving directory
`/mnt/stage/build/LVM2.2.00.08/lib'
make: *** [lib] Error 2
----- </snip> -----

Let me know if more details are required to track my issues
down.

Thanks
Dale
