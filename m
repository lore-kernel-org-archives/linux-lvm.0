Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k2ULx1vR005733
	for <linux-lvm@redhat.com>; Thu, 30 Mar 2006 22:59:01 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FP5AT-0003DA-Dc
	for linux-lvm@redhat.com; Thu, 30 Mar 2006 22:59:01 +0100
Date: Thu, 30 Mar 2006 22:59:01 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Re: Boot Mgr support for '/boot' on LVM2 volumes ?
Message-ID: <20060330215901.GL2690@agk.surrey.redhat.com>
References: <6dcf0dbc0603050846k2b8bb546r1a3b6f30f541e473@mail.gmail.com>
	<20060307190636.GA12504@percy.comedia.it>
	<e03uq2$aa1$1@sea.gmane.org>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e03uq2$aa1$1@sea.gmane.org>
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

On Sat, Mar 25, 2006 at 06:31:41PM +0100, Claus F=EF=BF=BDrber wrote:
> What about adding a "boot" flag to LVs? It set, it could have the=20
> following effect:
=20
Well we already have --alloc contiguous which comes close.

This would be a subset: contiguous and not striped etc., but could
be mirrored to similarly-contiguous space.

--alloc bootable perhaps.

Alasdair
--=20
agk@redhat.com
