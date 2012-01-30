Message-ID: <4F26BE81.7040608@redhat.com>
Date: Mon, 30 Jan 2012 16:00:01 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <c7cbb6bbd7b1bb221f1939dc180f29cd.squirrel@webmail.harte-lyne.ca>
In-Reply-To: <c7cbb6bbd7b1bb221f1939dc180f29cd.squirrel@webmail.harte-lyne.ca>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Cannot delete lv
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "James B. Byrne" <byrnejb@harte-lyne.ca>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01/30/2012 03:44 PM, James B. Byrne wrote:
> It was suggested on the centos-virt mailing list that I try using
> dmsetup to suspend this device:
> 
> [root@vhost01 ~]# dmsetup suspend vg_vhost01-lv_vm_base 
> [root@vhost01 ~]# [root@vhost01 ~]# dmsetup info -c
> vg_vhost01-lv_vm_base Name                  Maj Min Stat Open Targ
> Event  UUID vg_vhost01-lv_vm_base 253   5 L-sw    2    1      0 
> LVM-gXMt00E1RDjpSX3INLZ35Prtg66aX36BeAOlKIkmfSNQRNol3Hni920R4YVaZr52
>
> 
[root@vhost01 ~]#

Just suspending isn't going to help. Device-mapper allows you to
suspend a device, replace its definition (table) with a new one and
then resume it - on occasion this can be useful to allow you to
replace a device with a fake layer that always returns I/O errors (it
will cause outstanding I/O to fail and "unstick" any apps that were
blocked on the device).

This doesn't seem to be one of those cases however since your problem
is that something has the device open rather than that access to the
device itself blocks.

> However, now when I run lvremove, the command simply becomes
> unresponsive and does not return, even when a ^C interrupt is
> attempted.

That's because the device is suspended (all I/O will block). Resume it
and the lvremove will complete (with the same error as before).

# dmsetup resume <dev>

> How do I delete these logical volumes, for there are three of
> them?

You need to find out what has them open and get it to close them. If
the VMs have really been shut down then they should have closed the
devices already - run lsof to check that no qemu-kvm processes are
using them (but resume your LV first to avoid lsof blocking..).

Since these are VM images though I guess you may have some partition
mappings for them created by kpartx.

Examine the device dependencies with dmsetup ls --tree or lsblk:

# lsblk
NAME                            MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda                               8:0    0 232.9G  0 disk
??sda1                            8:1    0   200M  0 part
??sda2                            8:2    0 195.3G  0 part
  ??vg_mother-lv_t0 (dm-12)     253:12   0   100M  0 lvm
    ??vg_mother-lv_t0p1 (dm-13) 253:13   0  94.1M  0 part <<<<<<<<

In this case I have an LV named vg_mother/lv_t0 that has a single
kpartx partition mapping.

If this is the case on your LV you can remove these mappings with
"kpartx -d <dev>" where <dev> is the whole LV device.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk8mvoEACgkQ6YSQoMYUY94hjgCgkeemE4oBzIcDVpHZrirGl9wv
AU4AoIF1VtGcB8nMatiJ+d3juXGNXjD0
=RxPI
-----END PGP SIGNATURE-----
