From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] PV-Move fails, now at 127 Pe's...
Message-Id: <20020306105407.A21935@sistina.com>
References: <3C83AD42.20301@theiqgroup.com>
    <20020305002428.B13751@sistina.com> <3C85289C.8060606@theiqgroup.com>
    <20020305223226.A19035@sistina.com> <3C854B93.2060402@theiqgroup.com>
    <00d301c1c4a2$ae939c60$f707a182@gimmie.tudelft.nl>
MIME-Version: 1.0
In-Reply-To: <00d301c1c4a2$ae939c60$f707a182@gimmie.tudelft.nl>;
    from D.Andriessen@pink.nl on Wed, Mar 06, 2002 at 01:05:53AM +0100
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
Date: Wed Mar  6 03:56:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Well, you hit the cast problem I reported a fix for on linux-lvm shortly
after the LVM 1.0.3 release.

Sorry for the inconvenience!

Here's the patch again.

Regards,
Heinz    -- The LVM Guy --

diff -u -B -r1.43 -r1.44
--- LVM/tools/lib/liblvm.h      18 Feb 2002 16:37:18 -0000      1.43
+++ LVM/tools/lib/liblvm.h      20 Feb 2002 10:49:14 -0000      1.44
@@ -93,10 +93,10 @@
 #include <time.h>
 #include <limits.h>
 #ifdef _G_LSEEK64
-int lseek64 ( unsigned int, unsigned long long, unsigned int);
+loff_t lseek64 ( int, loff_t, int);
 #define llseek lseek64
 #else
-int llseek ( unsigned int, unsigned long long, unsigned int);
+loff_t llseek ( int, loff_t, int);
 #endif

 #include <sys/ioctl.h>
@@ -130,7 +130,7 @@
 #define        LVMTAB                  "/etc/lvmtab"   /* LVM table of VGs */
 #define        LVMTAB_DIR              "/etc/lvmtab.d" /* storage dir VG data */
 #define        LVMTAB_MINSIZE   ( sizeof ( vg_t) + sizeof ( lv_t) + sizeof ( pv_t))
-#define        LVM_DEV                 "/dev/lvm"
+#define        LVM_DEV                 LVM_DIR_PREFIX "lvm"
 #define        VG_BACKUP_DIR           "/etc/lvmconf"
 #define        DISK_NAME_LEN           8
 #define        LV_MIN_NAME_LEN         5


On Wed, Mar 06, 2002 at 01:05:53AM +0100, Denie Andriessen wrote:
> Hi,
> 
> So, I've updated my lvm tools from 0.9.1-beta2 to 1.0.3., and now I seem to
> have ran into quite some problems..
> 
> Ran all test of the move again, and after a few faultless flows I started
> off again..
> We have a volume with 4 * 60, 2 * 80 disk, and another volume (new one, new
> disk) with 120Gb.
> 
> I'd like to move one 60Gb disk to the volume with the 120 Gb disk.
> 
> E2fsran nicely, then I started with a PV move, to get /dev/hdc1 out (after
> failing the first time I tries also to move /dev/hdb1 out) both failing at
> the same point, that is with 127 PE's moved...
> 
> Any takers ?
> 
> Regards,
> ------- info-----------
> pvmove -- writing physical extent part of VGDA on destination "/dev/hdg1"
> lv: /dev/volume/data[1]  old_dev: 22:01  new_dev: 34:01  old_pe_sector:
> 4176642  new_pe_sector: 47036865
> pvmove -- opening output physical volume "/dev/hdg1"
> pvmove -- llseeking input physical volume "/dev/hdc1"
> pvmove -- llseeking output physical volume "/dev/hdg1"
> pvmove -- /dev/hdc1 [PE 127 [data [LE 7328]] -> /dev/hdg1 [PE 1435]
> [128/3577]
> pvmove -- locking physical extent 127 of "/dev/hdc1" in kernel
> pvmove -- about to read input physical volume "/dev/hdc1" and to write
> output physical volume "/dev/hdg1"
> pvmove -- ERROR reading input physical volume "/dev/hdc1" (still 7733248
> bytes to read)
> pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents
> 
> [root@localhost /]# lvscan
> lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> vgscan
> 
> [root@localhost /]# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "volume"
> vgscan -- only found 20391 of 20518 LEs for LV /dev/volume/data (0)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
> data of volume group "volume" from physical volume(s)
> vgscan -- found active volume group "mp3volume"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> groups
> 
> [root@localhost /]# lvscan
> lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> vgscan
> 
> [root@localhost /]# vgdisplay
> vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> vgscan
> 
> [root@localhost /]# vgdisplay -v volume
> vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> vgscan
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
