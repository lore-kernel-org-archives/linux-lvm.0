Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o953VVTA007119
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 23:31:31 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o953VKCn021810
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 23:31:20 -0400
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1P2yFL-0001jz-L1
	for linux-lvm@redhat.com; Mon, 04 Oct 2010 20:31:19 -0700
Date: Mon, 04 Oct 2010 22:31:18 -0500
From: Ray Morris <support@bettercgi.com>
References: <AANLkTikmp+gSajt=Nnp7JuopFBQgzM1DsGmziyMOjeXW@mail.gmail.com>
	<AANLkTinq+3DzM0x1sOGJB6Kw93d3i+dezNy86B1SQRBP@mail.gmail.com>
In-Reply-To: <AANLkTinq+3DzM0x1sOGJB6Kw93d3i+dezNy86B1SQRBP@mail.gmail.com>
	(from mightydreams@gmail.com on Mon Oct  4 21:40:57 2010)
Message-Id: <1286249478.12105.27@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] mounting a filesystem on LVM2
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
Content-Type: text/plain; charset="iso-8859-1"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> mkfs.ext3 and mkswapfs commands exist but how to I break the LVM in =20
> to 2 parts.
> I am not asking to extend or move or resize or taking snapshot of the
> LVM which is given in your LVM Howto.
> If you used virt-manager it does that
> any user space program will show you one LVM but inside it will be
> having ext3 and swap partition within same LVM.

partitions, just like any other block device.
Preferably use parted as opposed to fdisk, as
fdisk can support only up to 2 TB.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 10/04/2010 09:40:57 PM, Tapas Mishra wrote:
> On Tue, Oct 5, 2010 at 1:27 AM, Alexander Skwar
> <alexanders.mailinglists+nospam@gmail.com> wrote:
> >
> > Yes. The question was, what filesystem you've put
> > on the lv. cfdisk is (basically) of no use for LVM. And
> > even in old style partitioning, cfdisk isn't used for
> > creating filesystems.
> Are you referring to ext3/ext4 type of file system.
> >>>
> >>> =EF=BF=BD Read the howto!
> >> Well what exactly ?
> >>
> >
> > The LVM howto.
> I have read it but what I am asking is not mentioned.
> I am breaking an LVM which is not having any filesystem on it into 2 =20
> parts.
> One will be used as root of type ext4 and another part will be used as
> swap filesystem.
> How can this be done.
> mkfs.ext3 and mkswapfs commands exist but how to I break the LVM in =20
> to 2 parts.
> I am not asking to extend or move or resize or taking snapshot of the
> LVM which is given in your LVM Howto.
> If you used virt-manager it does that
> any user space program will show you one LVM but inside it will be
> having ext3 and swap partition within same LVM.
> I do not want to have different LVM for swap and ext3.
> I want both these filesystems to co exist.
> This thing is not mentioned in the LVM How to.
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
>=20
