Return-Path: <raheesom@navpoint.com>
Message-Id: <200104180021.f3I0L0f15604@west.navpoint.com>
From: Rupert Heesom <raheesom@navpoint.com>
Date: 17 Apr 2001 19:13:15 -0400
Mime-Version: 1.0
Subject: [linux-lvm] Seems LVM not properly installed - help!
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@sistina.com>

I've installed LVM using RPMs - the rpms listed belowl

lvm-iop10-0.9.1_beta6-1.i386.rpm
lvm-iop10-lib-0.9.1_beta6-1.i386.rpm
lvm-iop10-man-0.9.1_beta6-1.i386.rpm
lvm-iop10-patchgen-0.9.1_beta6-1.i386.rpm
lvm-base-1.1-1.i386.rpm

All the /sbin/<progs> are there (as far as I can tell).
I'm loading the kernel support via a module (kernel 2.4.3).  I can tell
the module is loaded by the LSMOD command which lists LVM-MOD as one of
the modules loaded.  Also /proc/lvm is there.

The iop10 libraries are under /lib/lvm-iop10.  (what IS "IOP10"
anyway??)

However when I try to run any of the /sbin progs, the same msg keeps
appearing -


    vgcreate
    lvmiopversion -- LVM driver/module not loaded?

    vgcreate: /lib/lvm-iop not found.  Is lvm-iop installed?


VGCREATE seems to be looking in the wrong place - "/lib/lvm-iop" instead
of "/lib/lvm-iop10".

Have I installed LVM correctly here, does anyone know?   If so, where
can I look for a solution?

-- 
regs
rupert
