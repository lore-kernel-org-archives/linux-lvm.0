Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1LLLdK20251
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2005 16:21:39 -0500
Received: from storix.com (mill-adnc_internal-206-71-178-18.adnc.com
	[206.71.178.18] (may be forged))
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1LLLYdM028552
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2005 16:21:34 -0500
Received: from [192.168.1.126] (65.106.88.139.ptr.us.xo.net [65.106.88.139])
	by storix.com (Postfix) with ESMTP id 6B914158F2
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2005 12:54:49 -0800 (PST)
Subject: Re: [linux-lvm] bootloader questions
From: rich turner <rich@storix.com>
In-Reply-To: <1109019036l.14910l.1l@tangerine>
References: <1109018274.4532.14.camel@rich> <1109019036l.14910l.1l@tangerine>
Message-Id: <1109020966.4532.59.camel@rich>
Mime-Version: 1.0
Date: Mon, 21 Feb 2005 13:22:47 -0800
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

this is perhaps the wrong mailing list but is this the case with
software raid as well? although, i believe the software raid must be
raid level 1.

On Mon, 2005-02-21 at 12:50, Jean-Luc Coulon (f5ibh) wrote:
> Le 21.02.2005 21:37:54, rich turner a =EF=BF=BDcrit :
> > if i have root(/) on a logical volume, is it required that i have
> > /boot
> > on a separate filesystem? does /boot have to be a partition?
> >=20
> > the boot loaders i need to support are lilo and grub. do the answers
> > to
> > the above question vary if i use lilo or grub?
>=20
>=20
> both lilo and grub can boot the root filesystem as a logical volume.
>=20
> but grub cannot boot /boot from a logical volume.
> With lilo it can either be a separate lv, a partition, a disk, what you  =

> what. With grub it should be outside of the logical volume manager =20
> (IIRC, there is a patch for grub to use /boot on a LV but I've never =20
> found/tried it)
>=20
>=20
> >=20
> > thanks for the help
>=20
> Regards
>=20
> Jean-Luc
>=20
> ______________________________________________________________________
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
