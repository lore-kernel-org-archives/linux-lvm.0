Return-Path: <root@srv.sistina.com>
Date: Thu, 19 Jul 2001 11:13:51 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] I/O error: dev 08:11, sector 0
Message-ID: <20010719111351.A28183@sistina.com>
References: <20010718231729.A791@digit-safe.dyndns.org>
Mime-Version: 1.0
In-Reply-To: <20010718231729.A791@digit-safe.dyndns.org>; from allanwind@mediaone.net on Wed, Jul 18, 2001 at 11:17:29PM -0400
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

Allan,

08:11 (/dev/sda11) shows that I/O error, you use /dev/sdb, which is 08:16
for your VG -> no problem for LVM.

Because /dev/sda11 seems to be configured, LVM reads it on its search for
physical volumes.

If you are not using /dev/sda11 for anything you are fine for the moment.

If there's a file system on /dev/sda11 *and* just the first sector is not
accessable, you can still happily access the filesystem, because it doesn't use
that sector at all.
But you should check and probably replace your sda drive to avoid
trouble in the future.

On Wed, Jul 18, 2001 at 11:17:29PM -0400, Allan M. Wind wrote:
> Hi,
> 
> Installed linux 2.4.6 + lvm 0.9.1beta7 with the kernel piece build
> as a module (patched lvm and the kernel, got the user tools from
> the .deb package of the right version).
> 
> # pvcreate /dev/sdb
> # vgcreate -s16 vg1 /dev/scsi/host0/bus0/target9/lun0/disc
>   (apparently, devfsd confuses lvcreate)

vgcreate? Yes, you need to use the full devfs paths for now.

Regards,
Heinz    -- The LVM Guy --

> # lvcreate -L5g -nusr vg1
> # mkfs -m0 /dev/vg1/usr
> # lvcreate -L5g -nvar vg1
> # mkfs -m0 /dev/vg1/var
> # lvcreate -L24.03g -nhome vg1
> # mkfs -m0 /dev/vg1/home
> 
> Updated /etc/fstab and:
> 
> # mount -a
> 
> Migrate data over, rebooted the box which does a:
> 
> # vgchange -a n
> 
> grub failed on me as the staging files were on lvm lv's
> (that is probably a bug as one should be able to boot without
> /usr), so booted off floppy.
> 
> Found that I had overlooked the check in /etc/init.d/lvm which
> fails unless lvm was compiled in (yes, it was docmented but it
> should probably be a tad smarter ;-) ).
> 
> # modprobe lvm-mod
> 
> (I might have had to do a vgscan & vgchange -a y)
> 
> # mount -a
> 
> so here is where I was looking for help... I get an I/O error
> but things come up:
> 
> # vgck -v
> vgck -- locking logical volume manager
> vgck -- finding all volume group(s)
> vgck -- checking volume group name "vg1"
> vgck -- checking existence of volume group "vg1"
> vgck -- reading volume group data for "vg1" from lvmtab
> vgck -- checking volume group consistency  of "vg1" in lvmtab
> vgck -- VGDA of "vg1" in lvmtab is consistent
> vgck -- reading volume group data for "vg1" from physical volume(s)
>  I/O error: dev 08:11, sector 0
> vgck -- checking volume group consistency  of "vg1" on physical volume
> vgck -- VGDA of "vg1" on physical volume is consistent
> vgck -- unlocking logical volume manager
> 
> Is this a problem and how do I fix it?  This problem did not exist
> before I rebooted.
> 
> Thanks in advance,
> 
> 
> /Allan
> -- 
> Allan M. Wind			email: allanwind@mediaone.net
> P.O. Box 2022			finger: awind@digit-safe.dyndns.org (GPG/PGP)
> Woburn, MA 01888-0022
> USA

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
