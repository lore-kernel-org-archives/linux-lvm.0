Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l5TAKFVh012358
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2007 06:20:15 -0400
Message-ID: <4684DCA3.8020504@redhat.com>
Date: Fri, 29 Jun 2007 11:19:15 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Forcibly remove broken disk from LV
References: <87ps3fdqex.fsf@pumba.bayour.com>
In-Reply-To: <87ps3fdqex.fsf@pumba.bayour.com>
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

Turbo Fredriksson wrote:
> I have a disk that only gives SCSI errors etc which
> I want to remove from the VG. But vgreduce only hangs
> and so does pvremove...
> 
> If I physically remove the disk, the vg/pv/lv etc isn't
> accessible so the vgreduce won't work (claims that it
> can't find any PV's etc).
> 
> So how do I remove the disk?
> 

You can activate what's left of the volume group with:

vgchange --partial -ay <VolGroup>

You can remove the missing PV from the VG with:

vgreduce --removemissing <VolGroup>

Note that this will also remove any logical volumes that were using the
missing physical volume. You can run it with --test first to see what
effect it will have.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGhNyj6YSQoMYUY94RAj1/AKC5MV2UOwX1H9fJDEPB29gAzAwLXQCg1c6b
fd0Tnpn1dInlwx5TnH8G2fM=
=WGy8
-----END PGP SIGNATURE-----
