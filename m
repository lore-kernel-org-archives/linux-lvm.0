From: "Jason A. Fager" <jafager@jafager.com>
Message-Id: <20020417075302.GB26644@codegate.jafager.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] vgscan fails to find volume groups
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
Date: Wed Apr 17 02:38:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM@sistina.com

I have been attempting to get LVM set up on a freshly-installed
Slackware 8.0 system (custom 2.4.18 monolithic kernel, LVM 1.0.3,
no kernel patches).  It works fine in multi-user mode, it works
fine in single-user mode, however I set up the single-user init
script like this:

(/ is mounted read only at this point)
mount -o remount,rw /
vgscan
vgchange -a y
mount -o remount,ro /
(stock Slackware fsck and mount bits)

The only volume group I have contains one physical volume
(/dev/sdb, on an Adaptec 7xxx controller).  For some reason,
vgscan doesn't pick up the volume group.  The exit code is 0,
and looking at the debug output it hits /dev/sdb and spits out
the same messages as when it hits all the other devices.

As an experiment I put a call to sulogin before the vgscan and
tried running it by hand; same thing happened.  I tried running
pvcreate (on the whole disk, and after creating an LVM partition
/dev/sdb1) and it failed with error code 7.

As another experiment, I tried setting up a loopback filesystem
on a file in the root directory.  That worked perfectly; vgscan
picked it up, vgchange activated it, and the rest of the init
script ran fsck and mounted it.  Other than setting up the
loopback file the only thing I did was add a call to losetup
before the vgscan.

Not sure if this is a problem with the kernel (i.e. SCSI driver)
or a problem with LVM, or some boneheaded thing I'm doing wrong.
Any advice you can give would be appreciated -- let me know if
I can provide more information.

thanks,
jafager
