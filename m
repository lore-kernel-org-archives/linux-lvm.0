Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-ID: <GL978976887291.29157@mail3>
From: jkcwong@mail.hongkong.com
Subject: RE:  [linux-lvm] root fs on lvm - kernel panic
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
Date: Tue Oct 22 22:16:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

the actual error i have now copied down:

VFS: Cannot open root device "3a00" or 3a:00.
Please append a correct "root=" boot option

Kernel panic: VFS: Unable to mount root fs on 3a:00

a few lines above this error i see a line that reads:

Partition check:
Floppy drive(s)
FDC0
LVM version 1.05 (15/07/2002)

i guess it can actually read the /etc/fstab?  which i have a line that reads "root=/dev/vg00/lvol0"

if my root is not on lvm, just say, /home and /usr are on lvm, then it works fine.  i have inserted the following to my rc.sysinit:

if [ -e /proc -a -x /sbin/vgchange -a -f /etc/lvmtab ]; then
  action "Setting up LVM" /sbin/vgscan
  action "Initialising LVM" /sbin/vgchange -a y
fi


i have tried to move the /etc/fstab and /etc/lilo.conf to /boot (not on lvm) and then create sym links to them.  then initrd / lvmcreate_initrd and adjust lilo.conf.... same result.  please help.  thanks.
----------------------------------------------
\305w\252\357\250\317\245\316 hongkon.com \271q\244l\266l\245\363\250t\262\316 
Thank you for using hongkong.com Email system
