From: "Bill Rugolsky Jr." <brugolsky@telemetry-investments.com>
Message-ID: <20030110171726.E3993@ti19>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] [CFT] LVM2 RPM Packages availalble for Red Hat 8
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
Date: Fri Jan 10 16:17:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, phoebe-list@redhat.com

[Cross-posted to Linux LVM and Red Hat 8.1 Beta lists.]

I've packaged up versions of lvm1, lvm2, devmapper, and mkinitrd for use
with Red Hat 8. I'd like to see similar changes rolled into RedHat 8.1,
so that it is 2.6-ready, and would appreciate comments and wider testing.

WARNING: These are *alpha*-quality developer-only packages!  Don't entrust
your data to them!

What I've done so far:

   - Modified and repackaged LVM1 to create a single /sbin/lvm1 executable, like
     LVM2, and use symlinks for the legacy commands.  Broke the monolithic
     LVM package into sub-packages, so that it can coexist with LVM2.
     Provided an /sbin/lvm1.static that is linked against diet libc.

   - Packaged devmapper with a tiny statically-linked C program (mkdmctl)
     used to create the control file.  This is useful in combination with
     nash for the RedHat initrd, since nash is not a real shell.

   - Packaged LVM2.  Provides an /sbin/lvm2.static that is linked against diet libc.

   - Modified mkinitrd to take a --lvm-version={1,2} argument to specify
     which LVM version to use.   With 2.4.20-2.2, my initrds (with aic7xxxx)
     are 475287 bytes (LVM1) and 472105 bytes (LVM2), so they fit on a 1722kB
     floppy.

   - Made the minimal hack to rc.sysinit required to make it boot.
     Basically, I just want to use LVM2, but have the box function properly
     if for some reason I need to boot a kernel without device mapper.
     Do not trust this patch with your

Currently, I have LVM{1,2} installed as /sbin/lvm{1,2}.  There are two
"links" packages that Provide (in the RPM sense) "lvm". The lvm1-links
sub-package has symlinks pointing -> lvm1.  The lvm2-links sub-package
has links pointing -> lvm, which is a currently a shell script that invokes
one of lvm{1,2}, but could simply be a symlink determined at boot.

I'm currently running root-on-LVM with the RedHat 2.4.20-2.2 kernel.
I managed to destroy my root partition in the process of debugging these
packages.  [Fortunately, I saved a copy in a non-LVM partition.] I believe
that the problem is with switching LVM versions when there are stale
/dev/<vg> directories left over if the box is not shutdown cleanly ...

Find the packages here:

    ftp://67.83.203.127:/pub/lvm

[Caution: my home cable modem, so upstream bandwidth is quite limited.
 I know, I should set up dyndns at a minimum, but another day ...]

Regards,

   Bill Rugolsky
