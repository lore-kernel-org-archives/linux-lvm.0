Subject: Re: [linux-lvm] cant mount LV via partition/filesystem labels
From: "Kirby C. Bohling" <kbohling@birddog.com>
In-Reply-To: <3DCD6269.6010508@mvista.com>
References: <3DCA84BB.9050404@jumpline.com>
	<1036691083.13804.59.camel@hawk.birddog.com>  <3DCD6269.6010508@mvista.com>
Content-Type: multipart/mixed; boundary="=-hjGTw8VHLqsMrWFwZlDg"
Message-Id: <1036881654.10657.66.camel@hawk.birddog.com>
Mime-Version: 1.0
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
Date: Sat Nov  9 17:00:03 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: Steven Dake <sdake@mvista.com>

--=-hjGTw8VHLqsMrWFwZlDg
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2002-11-09 at 13:30, Steven Dake wrote:
> I wouldn't mind seeing the patches.
> 
> Thanks
> -steve
> 

Steve,

	I'm an idiot...  I sent Ted Tso the a patch, that was crappy, but
worked.  He re-wrote it, and accidently inverted the a check in the
logic.  I replied to him that the patch worked, but he'd inverted this
check, if he fixed that it was great.  I didn't however send him the a
correct patch back.  That was stupid on my part.  I shouldn't have
replied with it works, w/o a corrected patch.

	The patch that fixes the LVM so fsck to it works is this attached as
fsck_lvm_labels.patch.

	It's a trivial one line fix.  This applies to 1.26.  I'm guessing it
will apply to any version of the e2fsck since then.  That was the
earliest version that it did work on.  It applies cleanly on 1.32 which
is the latest version on sourceforge.

	My copy of mount does work with LVM devices.  mount-2.11g-5 from redhat
is what I'm using.  According to this page:

http://compton.phys.iit.edu/doc/util-linux-locales/changelog

	The fix went in on util-linux 2.11n.  Not sure what is the deal with
that. I'm pretty sure I didn't install a modified version of mount on my
machine. I've reinstalled, and remember being upset it didn't work on
the fresh install. So maybe I did.

	Unfortuantely, the crappy code I sent to the mount maintainer did make
it in (Ted fixed mine up nicely, with the exception of the logic
inversion).  Mine's got a few resource leaks that I should fix up.  I'll
try and work up a cleaner patch and sent it to the mount maintainer. 
The newer versions of mount however, work just fine, and it is in the
mainline version of mount now.

	Either way, the pertinate code is in:

e2fs-progs-1.26/misc/get_device_by_label.c 

	Look for the function named init_lvm.  

	In the util-linux package it's at:

util-linux-2.11r/mount/mount_by_label.c

	Look for it the function: uuidcache_init_lvm.  

	The code won't work if you use devfs.  It assumes that the proper name
is:
/dev/"VG_NAME"/"LV_NAME"

	In reality, it should open /proc/lvm/VGs/data/LVs and read the file
looking for "name:", and grab data the colon, and use it for the
device.  That was more work then I deemed worth it at the time to get my
stuff going.  I wasn't sure how much internally LVM was holding to the
proc file interface.  So I wasn't going to depend on that without more
information.

	It's a hack, but it works enough to get me going which is all I really
wanted.  If that isn't what you wanted, or you want more information
just ask.  It's not wonderful, but it works for me.

	Thanks,
		Kirby










> Kirby C. Bohling wrote:
> 
> >On Thu, 2002-11-07 at 09:20, Ben Snyder wrote:
> >  
> >
> >>Here's what I've got:
> >>
> >>RH7.2, kernel  2.4.9-34enterprise
> >>
> >>1 physical volume each on /dev/sda9 and /dev/sdb1
> >>one logical volume over these two PV's
> >>
> >>I've labeled the filesystem via 'tune2fs' and want to use the label for 
> >>mounting purposes, as is the default with the other (non-LVM) filesystems
> >>
> >>'vgscan' and 'vgchange -a y' have been performed
> >>'vgdisplay' and 'lvdisplay' tell me all is well - everthing is 
> >>read/write and available
> >>'fsck' on the physical path reports clean...
> >>
> >>If I attempt to mount via the physical path to the LV, providing the 
> >>mount point, everything works fine
> >>
> >>However, mount refuses to mount via filesystem/partition label, 
> >>regardless if I use '-L' and provide the label or use the mountpoint and 
> >>let mount figure it out on its own from /etc/fstab.  I get 'mount: no 
> >>such partition found' (it is in /etc/fstab correctly, already checked that).
> >>
> >>Am I missing something about labels?  Maybe some other remedial 
> >>filesystem characteristics/operations that I've missed because of 
> >>cranius-up-rectus (head up a$$).
> >>
> >>    
> >>
> >
> >I'm the guy sent in the patch to add LVM label support to mount and
> >e2fsprogs.  I'm not sure RedHat 7.2 includes the proper version of those
> >tools at all.  I've had problems were built by RedHat.
> >
> >The label stuff in mount and e2fsprogs reads /etc/partitions and
> >searches all entries in that file for labels.  It doesn't search
> >anything else.  LVM didn't (probably still doesn't) show up in etc
> >partitions so label support fails.  It should search in the /proc files
> >that have the LVM stuff to find them, and search for those.  That's what
> >I added to the code, but I haven't seen it work since I sent in the
> >patch.
> >
> >It's not hard to modify the code, I didn't bother figuring out why the
> >redhat tools fails.  It wasn't terribly important to me.  If you want to
> >look at it I will.  If nothing else I can send you a patch that you can
> >use to rebuild your source RPM with.
> >
> >	Thanks,
> >		Kirby
> >
> >
> >
> >
> >  
> >
> >>Thanks in advance for feedback/suggestions.
> >>
> >>
> >>_______________________________________________
> >>linux-lvm mailing list
> >>linux-lvm@sistina.com
> >>http://lists.sistina.com/mailman/listinfo/linux-lvm
> >>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >>
> >>    
> >>
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
-- 
Real Programmers view electronic multimedia files with a hex editor.

--=-hjGTw8VHLqsMrWFwZlDg
Content-Disposition: attachment; filename=fsck_lvm_labels.patch
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; name=fsck_lvm_labels.patch; charset=ISO-8859-1

diff -u -r e2fsprogs-1.26.modified/misc/get_device_by_label.c e2fsprogs-1.2=
6/misc/get_device_by_label.c
--- e2fsprogs-1.26.modified/misc/get_device_by_label.c	Sat Nov  9 15:40:39 =
2002
+++ e2fsprogs-1.26/misc/get_device_by_label.c	Sun Jan 20 00:27:02 2002
@@ -166,7 +166,7 @@
=20
 		lv_list =3D opendir(vdirname);
 		free(vdirname);
-		if (lv_list =3D=3D NULL)
+		if (lv_list !=3D NULL)
 			return;
=20
 		while ((lv_iter =3D readdir(lv_list)) !=3D 0) {

--=-hjGTw8VHLqsMrWFwZlDg--
