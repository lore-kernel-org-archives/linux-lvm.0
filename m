Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20021011142810B.jyoshida@miraclelinux.com>
From: Jun YOSHIDA <jyoshida@miraclelinux.com>
Subject: [linux-lvm] A tool to administrate LVM.
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
Date: Fri Oct 11 00:29:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello all,

I am a developer working for MIRACLE LINUX which is one of the linux
distributors in Japan.

I made a tool to administrate LVM easily and named it LVMAdmin temporarily. 
It will help beginners to create PV/VG/LV easily.

Small screenshot is put at:
	http://www.miraclelinux.com/developer/lvmadmin.html
# Though it is Japanese page...

Please evaluate it if you are interested.

[Implementation]

Currently, LVMAdmin has the following features:

 - create a partition.
 - create a physical volume.
 - create a volume group.
 - create a logical volume.
 - display disk/partition/PV/VG/LV information.

# The extending logical volume, snapshot, etc. are not implemented yet.

[System Requirements]

LVMAdmin is a Tcl/Tk script so it requires Tcl/Tk 8.0 or highter and,
ofcourse, the system environment that the LVM can work comfortably.

[Download]

You can download the RPM from:
 ftp://ftp.miraclelinux.com/pub/Miracle/ia32/standard/2.1/unsupported/RPMS/lvmadmin-0.2.0-3ml.i686.rpm

And SRPM from:

 ftp://ftp.miraclelinux.com/pub/Miracle/ia32/standard/2.1/unsupported/SRPMS/lvmadmin-0.2.0-3ml.src.rpm

The binary package I prepared was built on Miracle Linux V2.1.
Miracle Linux V2.1 is based on Red Hat Linux 7.1 and we applied some kernel
patches including LVM kernel module to the kernel.
Unfortunately, our products have not been shipped outside Japan so I
think you need to rebuild LVMAdmin from SRPM.

[How to use]

On root account, type the following on xterm or some X terminal program:
 # lvma
A window will be appeared on your display.

You can read the manual written in English at:
   /usr/share/doc/lvmadmin-0.2.0/lvmadmin-doc-e.html

# Since I'm not a native English speaker, I belive there are some
# incorrect English in the manual. I'll much appreciate if you correct
# my English and report it to me.

[NOTE]
 - I have tested LVMAdmin with kernel-2.4.9 and lvm-1.0.1.

 - LVMAdmin outputs trace log to '/var/tmp/lvma.log' when you invoke it
   with 'debug' option as follows:
	# lvma debug

   Please attach the log file to the bug report because it will help
   me investigate where the bug is.

 - Please evaluate it AT YOUR OWN RISK.

Any comments/suggestions will be welcome.

Regards,
-Jun YOSHIDA
