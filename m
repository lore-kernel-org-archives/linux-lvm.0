Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7HCu7so003974
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2011 08:56:07 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7HCu5ba003090
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2011 08:56:06 -0400
Received: from r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.17.33] helo=localhost)
	by ps536.phatservers.com with esmtpa (Exim 4.66)
	(envelope-from <support@bettercgi.com>) id 1QtffA-0007CT-WB
	for linux-lvm@redhat.com; Wed, 17 Aug 2011 05:56:05 -0700
Date: Wed, 17 Aug 2011 07:56:03 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110817075603.79ffbe4b@bettercgi.com>
In-Reply-To: <CADinLjQqV+CixkrGUYGfMtS5SCr+BLjgFys98MuXM2BoXcvB=g@mail.gmail.com>
References: <013601cc5bd2$fd25e280$f771a780$@edu.tr>
	<CADinLjQqV+CixkrGUYGfMtS5SCr+BLjgFys98MuXM2BoXcvB=g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] how can I setup software RAID1 on a running LVM
 system
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

"man mdadm" or:
http://tinyurl.com/4pjnu43
--=20
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Wed, 17 Aug 2011 08:06:34 +0200
Claus Koch <claus.koch@thinkproject.com> wrote:

> 2011/8/16, beklan <biseri@ciu.edu.tr>:
> >
> >
> > Hi,
> >
> >
> > I m using Centos 5.5 with LVM system,and I m trying to setup
> > sofrware RA=C4=B0D on that system. Does anybody help  me ?
> >
> >
> > I dont have raid card because of that I have to setup the system
> > with software raid.
> >
> >
> > My problems are, how can I add new disk on running system or how
> > can I get back datas if system fail.
> >
> >
> >
> > beklan
> >
> >
>=20
