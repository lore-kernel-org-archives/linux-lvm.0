Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j19J1EO12990
	for <linux-lvm@redhat.com>; Wed, 9 Feb 2005 14:01:14 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.196])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j19J1D6A016676
	for <linux-lvm@redhat.com>; Wed, 9 Feb 2005 14:01:14 -0500
Received: by rproxy.gmail.com with SMTP id a41so2013963rng
	for <linux-lvm@redhat.com>; Wed, 09 Feb 2005 11:01:08 -0800 (PST)
Message-ID: <a58063aa05020911013b724ac9@mail.gmail.com>
Date: Wed, 9 Feb 2005 11:01:08 -0800
From: "M. Matt Colgin" <mcolgin@gmail.com>
Subject: Re: [linux-lvm] moving LVM to a new box
In-Reply-To: <1107958513l.12640l.4l@tangerine-64>
Mime-Version: 1.0
References: <000701c50eae$503fbd20$911ba8c0@godzilla>
	<1107958513l.12640l.4l@tangerine-64>
Content-Transfer-Encoding: quoted-printable
Reply-To: "M. Matt Colgin" <mcolgin@gmail.com>,
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

I think you'll want to make a new installation on the P4 box as it
would use a new, faster kernel for your processor. Really the question
is if the old installation for P3 will boot under your new P3, as a
bit more than the processor will have changed (at least to the OS). If
you can get the OS to boot on the new computer, then LVM will be found
and work.

Moving the LVM to another machine is trival, check the below link:
http://www.tldp.org/HOWTO/LVM-HOWTO/recipemovevgtonewsys.html

Maybe a FC mailing list will get a more targeted group that would know exac=
tly.


On Wed, 09 Feb 2005 14:15:13 +0000, Jean-Luc Coulon (f5ibh)
<jean-luc.coulon@wanadoo.fr> wrote:
> Le 09.02.2005 14:50:28, Sutto Zoltan a =EF=BF=BDcrit :
> > I have a newly installed/configured/updated FC3 with LVM2 on a P3 box.
> > How can I move this working system to a new P4 box with a larger SATA
> > disk without reinstalling/upgrading/configuring the whole OS.
> >
> > Any help would be appreciated
>=20
> If I suppose you can install and boot you old disk in you new system
> together with the new disk, you can do the following (I suppose the old
> disk is /dev/hda with a /dev/hda1 partition, and new one /dev/sda with
> a /dev/sda1 partition, I suppose your volume group is vg0):
>=20
> make backups  ;-)
>=20
> - pvcreate /dev/sda1
> - vgextend vg0 /dev/sda1
> - move all the lv data with pvmove /dev/hda1.
> - vgreduce vg0 /dev/hda2
> - you will have to configure lilo/grub to install and point on your new
> disk.
>=20
> I've done such a way but it was not with lvm2. Maybe there are some
> pvmove issues with lvm2.
>=20
> > Zoltan Sutto
>=20
> Jean-Luc
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
>=20
>
