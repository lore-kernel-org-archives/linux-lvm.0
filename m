Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s447vYnD031351
	for <linux-lvm@redhat.com>; Sun, 4 May 2014 03:57:34 -0400
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s447vWVw031888
	for <linux-lvm@redhat.com>; Sun, 4 May 2014 03:57:32 -0400
Received: from gateway.linuxnetwork.fr (unknown [82.241.253.92])
	by smtp3-g21.free.fr (Postfix) with ESMTP id C594EA620D
	for <linux-lvm@redhat.com>; Sun,  4 May 2014 09:56:43 +0200 (CEST)
Received: from netstation (netstation.linuxnetwork.fr [192.168.0.1])
	by gateway.linuxnetwork.fr (Postfix) with ESMTP id 3C8C2343BE
	for <linux-lvm@redhat.com>; Sun,  4 May 2014 09:57:31 +0200 (CEST)
Date: Sun, 4 May 2014 09:57:33 +0200
From: "L.M.J" <linuxmasterjedi@free.fr>
Message-ID: <20140504095733.104b3561@netstation>
In-Reply-To: <536318D1.7050809@gathman.org>
References: <20140417122315.4c3687ea@netstation> <53502CB5.3060109@gathman.org>
	<20140418231417.7f10605d@netstation>
	<20140426204744.25b201e4@netstation> <536318D1.7050809@gathman.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] LVM issues after replacing linux mdadm RAID5 drive
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

Le Fri, 02 May 2014 00:02:25 -0400,
Stuart Gathman <stuart@gathman.org> a =EF=BF=BDcrit :

> > I presume I still have data on my broken RAID5.
> >
> > I did a pvcreate --restorefile and vgcfgrestore. =20
> Did you restore the raid 5, taking out the new drive, and add00ing it
> back in properly?  I can't take the time right now to give you a step by
> step.  The big warning on what you did wasn't a joke.  You should get
> help from md driver people.  You do not have an LVM problem.

Yes, I did that, I had it back properly, but I guess the problem comes from=
 the first sync, which was bad...
