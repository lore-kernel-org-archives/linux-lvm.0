Return-Path: <jweber@valinux.com>
Date: Sun, 18 Feb 2001 03:31:56 -0800 (PST)
From: Jay Weber <jweber@valinux.com>
Subject: Re: [linux-lvm] vgscan creation of device nodes for volume groups.
In-Reply-To: <E14UQ5e-0008VW-00@whittlesey.cl.cam.ac.uk>
Message-ID: <Pine.LNX.4.30.0102180256160.12371-100000@beefcake.hdqt.valinux.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, 18 Feb 2001, Piete Brooks wrote:

> > Note the duplicate device nodes numbers for vol1 and vol2.
>
> Dangerous -- sounds like a case for devfs ...

Well, that's one solution. :)

> > This makes sense in that the prior /dev entry for a volume is left around
> > after volumes are disable (rather than cleaned up).
>
> As in `that is how the code is' rather than `that is how the code should be'?

Correct.  I'm not sure what the preferred, standards, or such method is
and that's exactly why I brought it up.

> Without devfs, it should at least cache the minor numbers, and re-use the old
> one if there is no clash.  I guess there may be a requirement for no `gaps' in
> minor numbers, but I assume not, as volumes can be de-activated causing them.

Right, the current in place code is proper, as I gather you don't want the
gaps.  But then you have the de-activated volume scenario and I gather you
don't want the incorrect volume pointer also.

> > Now, the problem I'm having with this situation is that obviously any entries
> > in /etc/fstab based on the device node entries may not be proper, I could end
> > up with the wrong devices mounted on the wrong mount points. ;(
>
> ... in that if a non-existant device is mounted before the existant device
> which uses the same minor number, the latter will be mounted on the former's
> mount point, and the latter will not mount as it's already mounted.

Right, it's misleading in that the prior offlined volume is what is shown
as being mounted, when in actuality it is the volume following the
offlined volume that is truely mounted.

[root@localhost /root]# mount
/dev/hda2 on / type ext3 (rw,check=none)
none on /proc type proc (rw)
none on /dev/pts type devpts (rw,gid=5,mode=620)
/dev/hda3 on /opt type ext3 (rw,check=none)
/dev/vol0/vol0 on /vol0 type ext2 (rw)
/dev/vol1/vol1 on /vol1 type ext2 (rw)

Ie.. in this case /dev/vol1/vol1 on /vol1 is REALLY /dev/vol2/vol2 which
I'd normally mount on say /vol2, since I removed the device that
/dev/vol1/vol1 resided on.

> > I gather one possible way around this would be to use a filesystem label
> > on the filesystem on above devices and mount via that.  But last I check,
> > mount via fslabel didn't work with LVM devices.
>
> util-linux-2.10p has:
>
>                 /* skip entire disk (minor 0, 64, ... on ide;
>                    0, 16, ... on sd) */
>                 /* heuristic: partition name ends in a digit */
>
>                 for(s = ptname; *s; s++);
>                 if (isdigit(s[-1])) {
>                 /*
>                  * Note: this is a heuristic only - there is no reason
>                  * why these devices should live in /dev.
>                  * Perhaps this directory should be specifiable by option.
>                  * One might for example have /devlabel with links to /dev
>                  * for the devices that may be accessed in this way.
>                  * (This is useful, if the cdrom on /dev/hdc must not
>                  * be accessed.)
>                  */

Hmm, I think I like the idea of just having a common dir under /dev in
which to place all LVM devices.  Then add that dir to the mount source for
inclusion in the label scanning and resolve to mounting by label or uuid.

Using the source comments above which suggest the use of a /devlabel
dir to register label capable devices in seems interesting, but isn't that
along the lines of devfs, which would probably be a better solution in
that case?  Note, I've played with little devfs as of yet.

> If you apply the patch below and create /dev/lvm[abcd], it works.
>
> # mount -U ea3d46d0-0821-407f-bbed-0fedfe8c4dda /mnt
> # df /mnt
> Filesystem           1k-blocks      Used Available Use% Mounted on
> /dev/lvmd               101698        14     96564   1% /mnt
> #
>
> If the LVM code had entries lvm0, lvm1 instead of lvma, lvmb, only the latter
> would be required -- is there a reason for not doing this ?

Yep, I'd experimented with this in the past, but it limits you to the one
name, no good.  Using a subdir might be better in that you could then add
code to scan the entire subdir full of lvm devices.  I recall the LVM
folks have recently been addressing the issue of allowing such in recent
cvs work, maybe it's time to test it out. :)

I'd say the reason for not doing this is that LVM grants the user the
choice to name their volumes anything they like.  So in the supplied patch
if the device's name doesn't fall within your /dev/lvm[abc] naming scheme
it'll never even get scanned.

The trick is to find a solution we can all use, I'm reluctant to adopt
/dev/subdir approach just for myself and having to maintain a seperate
mount and LVM code tree which addresses such and I'm sure others are
reluctant to have to use a /dev/subdir approach also. :)

..
