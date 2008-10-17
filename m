Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9KEXCO9008464
	for <linux-lvm@redhat.com>; Mon, 20 Oct 2008 10:33:12 -0400
Received: from cdc-exfep1.ciber.cbr.inc (fw.ciber.com [12.10.248.50])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9KEWevn009284
	for <linux-lvm@redhat.com>; Mon, 20 Oct 2008 10:32:41 -0400
Subject: Re: [linux-lvm] LVs corrupted after pvresize
From: Peter Larsen <plarsen@CIBER.com>
In-Reply-To: <48F80EFB.30404@knebb.de>
References: <48F7AD78.1000002@knebb.de>
	<Pine.LNX.4.64.0810161829570.14457@bmsred.bmsi.com>
	<48F80EFB.30404@knebb.de>
Date: Fri, 17 Oct 2008 01:23:50 -0400
Message-Id: <1224221030.7772.17.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2008-10-17 at 06:05 +0200, Christian V=C3=B6lker wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Yohoo!
>=20
> |> I resized one of these RAID arrays for additional 250GB. After this was
> | Resizing a RAID-5 array is often not what you think, and doing so often
> | scrambles the data, depending on what RAID implementation you are using.
> I'm using a hardware RAID 3ware 9500S Controller. And this guy offers
> migration from RAID10 (4disks) to RAID5 (4disks, but with larger capacity=
).
> And I already did this task several times on these types of controllers.

That wasn't really the issue raised. Extending raids by adding new disks
doesn't do a balanced increase. In other words, you don't get a very
well functioning raid. Doing true raid migration is not straight
forward. So unless you fully restructure all data, you aren't getting
the performance you should be getting.

> | In any case, LVM was not your problem.
> This answer is too simple to be true.

Not really. Your approach was very poor.

> After the resize the partition and the PV were recognized correctly!=20

Because at that time, the PVs were intact.

> So
> I'm pretty sure the migration was ok.

Again, you misunderstood Stuart's comment. He didn't say your RAID
migration didn't work. He said it wasn't optimal.

> But after the deletion of the partion, recreation and pvcreate

That's the error. There's a pvresize for a reason. You also need to use
the same UUID. Removing the PV makes your vg inconsistent and you've
basically @#$@# up LVM.

> everything went wrong. So for me it is obvious, LVM had an issue. But
> which one?

No - your use of LVM was wrong. Not LVM itself.=20

---=20
Regards
    Peter Larsen

"Right now I'm having amnesia and deja vu at the same time."
		-- Steven Wright
