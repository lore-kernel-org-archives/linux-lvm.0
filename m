Message-ID: <3D905218.90403@mindmatics.de>
From: Andreas Baier <andreas.baier@mindmatics.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] raid1+lvm
References: <20020923152349.GA22130@kluge.net> <30810.1032845190@www7.gmx.net> <20020924112350.GA21473@weissel.dyndns.org>
Content-Transfer-Encoding: quoted-printable
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
Date: Tue Sep 24 06:55:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Hi,

right now, I am not yet sure, if this all is ok, I=B4ve learned quiet a=20
bit about the LVM, and I remember, that it was not suggested to use=20
swap on a lvm in former times, and it doesn=B4t matter if it is a swap=20
file or a partition, since there could be bad things when memory is=20
tight. Perhaps this is problem is removed - I never used swap on a=20
lvm, but I did on a software raid1.

It would be perfect if that all would work, you built a system with=20
two cheap IDE-disks or scsi if you=B4re rich - than one can build a=20
small boot partition on both disks and with the rest of the disk one=20
can make a soft-raid1 with the lvm on top.

I know I can do it, so I have root and swap and data on the raid,=20
accessible via the lvm.  But would it work if mem is tight and the=20
system load is high or could I run into a deadlock ?

Best regards

Andreas

Wolfgang Weisselberg wrote:

> Gerwin Lienert (gerwin.lienert@gmx.de) wrote 37 lines:
>=20
>=20
>>But what do you do, when your swap becomes to small.
>>
>=20
> - use a swapfile (can be on LVM) with a low priority
> - use a swap partition on LVM with a low priority
>=20
>=20


--=20
Andreas Baier
