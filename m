Return-Path: <lembark@wrkhors.com>
Message-ID: <3AB41AB7.41A3AAFA@wrkhors.com>
Date: Sat, 17 Mar 2001 20:17:27 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Getting LVM to startup on RedHat
References: <01C0AF18.CB0D5B60.smdenton@bellsouth.net>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

> > congenital defect in the lvm.  you might want to schedule it
> > post-boot in /etc/rc.d/rc1.d.  i've nearly given up on the
> > entire LVM due to the vgscan-at-startup requirement.  to
> > speed things up you can use
> 
> Last I heard, this "vgscan-at-startup requirement" was taken out
> several releases ago.  I've successfully crashed and booted (unclean
> and clean restart, respectively) my system several times with various
> different versions of LVM and kernel without having to run vgscan
> once.

lacking a vgscan at startup -- even with one frequently --
i keep getting problems with bad minor numbers after a 
reboot.  so long as i don't reboot LVM works nicely, afterwards
i'm frequently stuck restoring from tape.  i was running this
by hand well after startup to get the sequences correct for 
whatever i had to code into rc.sysinit (or rc0.d/lvm) and 
have never gotten any good results out of the process.


> >       ( /usr/sbin/vgscan && /usr/sbin/vgchange -a -y ) &
> >
> > to background the whole thing.  problem there is that you
> > will have problems mounting things -- can't use mount -a
> > to get them if lvm startup isn't in /etc/rc.d/rc.sysinit
> > but probably don't want anything this tricky in there at
> > all.
> 
> My init sequence is closer to SYSV than pure redhat but it should
> still work for this... i put a vgchange -a y in my rcS.d (which i
> think is rc.sysinit in redhat) and the mount calls are in rc1.d and
> have never had a problem with them.  In fact, my swap partition is
> also lvm.
> 
> I could be wrong, and the LVM maintainers/developers could probably
> steer you properly if i am, but it appears to me that if you can
> start your LVs via commandline but rc script initialization fails to
> start the LVs, you may have a mistiming in your rc scripts.  Perhaps
> you're using the module instead of the compiled-in and somehow
> vgchange is starting before modprobe/insmod?  Or perhaps you've not
> yet mounted /proc and vgchange is failing?  The fact that you can
> vgchange at all seems to imply that LVM is working properly and that
> your rc/init scripts need to be tweaked.

if "rcS" == single user then rcS.d and rc.sysinit are basically
equivalent.  main reason for an rc.sysinit is to keep the really
basic stuff (e.g., fsck, remount / read+write) in one place for
recovery.  i actually prefer your method for most things :-)

the bootstrap issue is non-trivial:  w/o LVM you cannot get 
all of the volumes mounted but can easily run into pain 
trying to get LVM up.  

> > other fix is to put the mounts directly into an lvm init.d
> > file and live with hard-coding them, write your own version
> > of /etc/fstab to mount the lvm's...  none of which are
> > very pretty.
> 
> I'd be curious to see how you change /etc/fstab to mount an LV that's
> not yet started... that would be horrific.  However, you did remind
> me of one caveat... I had to change the mount sequence from a
> mountall -a to mount /proc, /dev/pts, etc before lvm initialization
> then go back in another script to do the actual LV mounts.  Not all
> that inelegant as far as I see, however, as that's how most other
> unix variants I've seen do LVM-type init.  mount -t no<fstype> is
> your friend :)

that's the point:  you'd have to write /etc/myfstab and have 
another process -- not mount -- process the contents to mount
the items after LVM has started up.  one slight hack is to 
take the file system types and add a new one, say "lvmfs" as
an alias for "ext2".  the first stage of mounting would do
something like "mount -a -text2" and the later stuff would then
"mount -a -tlvmfs".  another way is to have the lvm stuff noauto
then grep (or whatever) the mounts by looking for "/dev/vg" in
the /etc/fstab.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
