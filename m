Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i62M9P023286
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 18:09:25 -0400
Received: from mail.myself.gen.nz (203-79-83-162.cable.paradise.net.nz
	[203.79.83.162])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i62M9HXn004048
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 18:09:18 -0400
From: "Steve Wray" <steve.wray@paradise.net.nz>
Subject: RE: [linux-lvm] pvmove - Can't expand LV: Mirror support missing
	fromkernel?
Date: Sat, 3 Jul 2004 10:09:20 +1200
Message-ID: <001b01c46081$399cc6c0$0201a8c0@fosi>
MIME-Version: 1.0
In-Reply-To: <1088690081.4221.6.camel@freya>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>
Cc: ganja@0x63.nu

> Magnus M=EF=BF=BDnsson wrote:
>=20
> Hi,
> I am having some trouble doing pvmove.

Me too.

I'm afraid that the only response I've ever got to this is
'its not supported in LVM2'.

Some people have suggested using a kernel with the latest dm
patches, which I tried and which failed.

About the only answer I have is to have enough spare disk to move=20
everything over and remove the lv's residing on those pv's,
reorganise them and then move everything back.

I think that the unpleasent answer here is that LVM2 is *not*
ready for the enterprise user... sadly I've already deployed it.

[snip]
> I am running a clean 2.6.7-kernel, with device mapper,=20
> dm-crypt and raid (including all raidlevels) as modules, the only thing I=
 do not
have
> under RAID and LVM is Multipath I/O support.

Yup, likewise; I was there about a month ago and it still doesn't
work...

> Can anyone please tell me why I am getting this problem and=20
> how to solve it?

I strongly doubt that you'll get any help out of the list on this,
but if someone does send you a fix which works, off-list, *please*
send it to me too; I have two failing disks which I need to decommission.

Thanks!

(I'm hoping against hope that there really is a fix for this,
and if theres anyone who would know, they'd be on this list.
So if noone on this list comes up with a fix, I'd submit that=20
LVM2 should absolutely NOT be used on production systems (until there=20
*is* a fix: LVM is great in principle)).
