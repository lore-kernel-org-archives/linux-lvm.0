Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3OFxWkw000987
	for <linux-lvm@redhat.com>; Mon, 24 Apr 2006 11:59:32 -0400
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3OFxTZs010087
	for <linux-lvm@redhat.com>; Mon, 24 Apr 2006 11:59:29 -0400
Subject: Re: [linux-lvm] different drive speeds in the same volume group
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <444CC1A6.7050802@juhui.ch>
References: <444CC1A6.7050802@juhui.ch>
Date: Mon, 24 Apr 2006 11:59:05 -0400
Message-Id: <1145894345.8585.96.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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

My 2 cents, I do not think there will be any problem on this. There is
no assumption on speed in DM.

On Mon, 2006-04-24 at 14:16 +0200, Gregor Reich wrote:
> Hi
>=20
> As I couldn't search the archives as a whole, I mailing my rather thumb=20
> question to the mailing list:
>=20
> May there be any problem using disks of different drive speed (10k and=20
> 15k) in the same volume group (i.e. using the different speeded disks=20
> for the same logical volume)?
>=20
> Thanks a lot.
>=20
> Greg
>=20
> Mit freundlichen Gr=C3=BCssen
> Gregor Reich
>=20
