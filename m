Return-Path: <piete.brooks@cl.cam.ac.uk>
Subject: Re: [linux-lvm] vgscan creation of device nodes for volume groups. 
In-reply-to: Your message of Sat, 17 Feb 2001 22:24:38 -0800.
             <Pine.LNX.4.30.0102172218260.8781-100000@beefcake.hdqt.valinux.com> 
Mime-Version: 1.0
Date: Sun, 18 Feb 2001 09:25:10 +0000
From: Piete Brooks <Piete.Brooks@cl.cam.ac.uk>
Message-Id: <E14UQ5e-0008VW-00@whittlesey.cl.cam.ac.uk>
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
To: linux-lvm@sistina.com
Cc: Piete.Brooks@cl.cam.ac.uk

> Note the duplicate device nodes numbers for vol1 and vol2.

Dangerous -- sounds like a case for devfs ...

> This makes sense in that the prior /dev entry for a volume is left around
> after volumes are disable (rather than cleaned up).

As in `that is how the code is' rather than `that is how the code should be'?

Without devfs, it should at least cache the minor numbers, and re-use the old 
one if there is no clash.  I guess there may be a requirement for no `gaps' in 
minor numbers, but I assume not, as volumes can be de-activated causing them.

> Now, the problem I'm having with this situation is that obviously any entries
> in /etc/fstab based on the device node entries may not be proper, I could end
> up with the wrong devices mounted on the wrong mount points. ;(

... in that if a non-existant device is mounted before the existant device 
which uses the same minor number, the latter will be mounted on the former's 
mount point, and the latter will not mount as it's already mounted.

> I gather one possible way around this would be to use a filesystem label
> on the filesystem on above devices and mount via that.  But last I check,
> mount via fslabel didn't work with LVM devices.

util-linux-2.10p has:

                /* skip entire disk (minor 0, 64, ... on ide;
                   0, 16, ... on sd) */
                /* heuristic: partition name ends in a digit */

                for(s = ptname; *s; s++);
                if (isdigit(s[-1])) {
                /*
                 * Note: this is a heuristic only - there is no reason
                 * why these devices should live in /dev.
                 * Perhaps this directory should be specifiable by option.
                 * One might for example have /devlabel with links to /dev
                 * for the devices that may be accessed in this way.
                 * (This is useful, if the cdrom on /dev/hdc must not
                 * be accessed.)
                 */

> Any thoughts on this?

If you apply the patch below and create /dev/lvm[abcd], it works.

# mount -U ea3d46d0-0821-407f-bbed-0fedfe8c4dda /mnt 
# df /mnt
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/lvmd               101698        14     96564   1% /mnt
#

If the LVM code had entries lvm0, lvm1 instead of lvma, lvmb, only the latter 
would be required -- is there a reason for not doing this ?

--- mount/mount_by_label.c	Thu Oct  5 01:32:24 2000
+++ mount/mount_by_label.c	Sun Feb 18 09:00:33 2001
@@ -127 +127 @@
-		if (isdigit(s[-1])) {
+		if (isdigit(s[-1]) || !strncmp(ptname, "lvm", 3)) {
