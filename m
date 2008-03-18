Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m2IGBYUs023268
	for <linux-lvm@redhat.com>; Tue, 18 Mar 2008 12:11:34 -0400
Message-ID: <47DFE7AD.9000206@redhat.com>
Date: Tue, 18 Mar 2008 16:02:53 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgimport without vgexport (hardware crash)
References: <07774C6E31D94A44A2A60E2085944F0901398E92@tbmail.tradebot.com>
In-Reply-To: <07774C6E31D94A44A2A60E2085944F0901398E92@tbmail.tradebot.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Taylor Lewick wrote:
> Should that server suffer a hardware failure, we?d like to connect up a
> standby server to take its place.
> 
> So in the event of a bad hardware failure, I won?t be able to unmount
> the filesystems, vgchange ?an, and vgexport the volume groups.
> 
> Can I expect a vgscan and vgimport to work on the new server if I wasn?t
>  able to run vgexport?  Any other data I would need to make this work?

Yes - this isn't a problem with LVM2 - you'll be able to activate the VG
on any other host that can see the storage by issuing a vgchange.

The vgimport/vgexport just toggle a flag in the LVM2 metadata that marks
the VG status and PV statuses as imported or exported, e.g.:

Before exporting t0:

t0 {
        id = "ecajMI-eLGR-5Gmn-T3KG-f3Ey-4JkR-VIQGh0"
        seqno = 1
        status = ["RESIZEABLE", "READ", "WRITE"]
[...]
        physical_volumes {

                pv0 {
                        id = "5LgAWX-Qc1q-e3IB-ak8P-EkEK-uY0q-Ar3Im6"
                        device = "/dev/loop0"   # Hint only

                        status = ["ALLOCATABLE"]
[...]
                }
        }

}

After exporting t0:

t0 {
        id = "ecajMI-eLGR-5Gmn-T3KG-f3Ey-4JkR-VIQGh0"
        seqno = 2
        status = ["EXPORTED", "RESIZEABLE", "READ", "WRITE"]
[...]
        physical_volumes {

                pv0 {
                        id = "5LgAWX-Qc1q-e3IB-ak8P-EkEK-uY0q-Ar3Im6"
                        device = "/dev/loop0"   # Hint only

                        status = ["ALLOCATABLE", "EXPORTED"]
[...]
                }
        }

}

The tools won't allow you to change the VG while it's exported, e.g.:

# lvcreate -n foo -L 10M t0
  Volume group t0 is exported

But it's fine to activate and use a VG previously created/used on
another host without doing the vgexport step first - the HA LVM service
in Red Hat Cluster Suite uses this for e.g. since it's not always
possible to cleanly export the VG when a node dies. We just change the
host tags used on the VG and activate it on the new node.

You might still need to fsck file systems if they weren't unmounted
cleanly but from LVM2's side it should be fine.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFH3+et6YSQoMYUY94RAjtWAKDhho6glzvP8+LkvlVf2IUPUdsZkwCfVI5f
mc60NA1vw1AFXaGSDuQg9Ew=
=vC7h
-----END PGP SIGNATURE-----
