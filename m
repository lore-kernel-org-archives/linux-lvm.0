From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] filesystem corruption...
Message-Id: <20020301105859.B30022@sistina.com>
References: <224974437.20020227233630@tnonline.net>
    <20020227164228.A964@lynx.adilger.int> <3399590000.1014862362@tiny>
    <77527890.20020228065139@tnonline.net>
    <45423062.20020228093553@tnonline.net> <20020228100118.A25011@sistina.com>
    <1692292625.20020228100703@tnonline.net>
MIME-Version: 1.0
In-Reply-To: <1692292625.20020228100703@tnonline.net>; from
    andewid@tnonline.net on Thu, Feb 28, 2002 at 10:07:03AM +0100
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
Date: Fri Mar  1 03:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Feb 28, 2002 at 10:07:03AM +0100, Anders Widman wrote:
> 
> > On Thu, Feb 28, 2002 at 09:35:53AM +0100, Anders Widman wrote:
> >> 
> >> >> On Wednesday, February 27, 2002 04:42:28 PM -0700 Andreas Dilger <adilger@clusterfs.com> wrote:
> >> 
> >> >>> On Feb 27, 2002  23:36 +0100, Anders Widman wrote:
> >> >>>> Unfortunatley, something went seriously wrong. I can't mount the disk
> >> >>>> any more, or use reiserfsck. They (mount/reiserfsck) say there isn't
> >> >>>> a valid filesystem on the device. Vgscan does however find all devices
> >> >>>> and can activate the volume group, but reiserfsck doesn't work.
> >> >>>> 
> >> >>>> What should I do to be able to save a s much data as possible?
> >> >>> 
> >> >>> dd if=/dev/vg/lv of=/new/disk conv=sync,noerror
> >> 
> >> >> Then we should be able to use debugreiserfs and reiserfsck to 
> >> >> find a copy of the super in the log, or just recreate it.
> >> 
> >> >> -chris
> >> 
> >> > So. How much space would this require on the 'new' disk? The same
> >> > amount as the entire LV? If that is, it would be impossible (for me,
> >> > economically) to do this.
> >> 
> >> > The disk with bad blocks is 80GB, and I have a "spare" 80GB disk, but
> >> > not more.
> >> 
> >> > //Anders
> >> 
> >> Oh, I forgot to ask how I can recover the filsystem
> >> header/suprtblock.. What exactly is "dd if=/dev/vg/lv of=/new/disk
> >> conv=sync,noerror" doing to the data, except copying it to the new
> >> device?
> 
> > It copies all it can read to another sane device so that youe don't loose
> > more data if your drive turns worse.
> 
> > After that, you want to use "reiserfsck --rebuild-sb /dev/vg/lv".
> 
> Ok. Unfortunatley, I can't get enough storage to copy all data. Would
> it be possible to just copy the data from the broken disk to a new,

So /dev/vg/lv is bigger than that disk?

> identical disk (I have a "spare" disk of the same model), and then
> rebuild the filsystem?

Well, then pvcreate the spare disk, add it to your VG and
"pvmove -i /dev/BrokenDisk /dev/SaneDisk" data over.

You need to have recent LVM 1.0.3 tools in order to use the -i option of
pvmove, which ignores read errors and you need to patch liblvm.h with the
following one to make pvmove work correctly.

After that repair the filesystem in /dev/vg/lv.

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
 

> 
> Thanks for your time!
> 
> Regards,
> Anders
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

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
