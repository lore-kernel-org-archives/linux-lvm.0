Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k59AVZQt030619
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 06:31:35 -0400
Received: from mtagate1.de.ibm.com (mtagate1.de.ibm.com [195.212.29.150])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k59AVXIG021322
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 06:31:33 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate1.de.ibm.com (8.13.6/8.13.6) with ESMTP id k59AVSVf043090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 10:31:28 GMT
Received: from d12av03.megacenter.de.ibm.com (d12av03.megacenter.de.ibm.com
	[9.149.165.213])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.6/NCO/VER7.0) with ESMTP id
	k59AXTHJ114802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 12:33:29 +0200
Received: from d12av03.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av03.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id k59AVRtL025504
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 12:31:27 +0200
Received: from dyn-9-152-216-85.boeblingen.de.ibm.com
	(dyn-9-152-216-85.boeblingen.de.ibm.com [9.152.216.85])
	by d12av03.megacenter.de.ibm.com (8.12.11.20060308/8.12.11) with ESMTP
	id k59AVRMk025501
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 12:31:27 +0200
From: Jens Wilke <jens.wilke@de.ibm.com>
Subject: Re: [linux-lvm] [PATCH] lvm metadata handling,
	=?iso-8859-1?q?=09warn_only_once_about_missing?= PV
Date: Fri, 9 Jun 2006 12:30:39 +0200
References: <200606091137.49000.jens.wilke@de.ibm.com>
	<4489484E.6010806@conterra.de>
In-Reply-To: <4489484E.6010806@conterra.de>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200606091230.40205.jens.wilke@de.ibm.com>
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

On Friday 09 June 2006 12:07, Dieter St=EF=BF=BDken wrote:
> Jens Wilke wrote:
> > With patch:
> >
> > # vgchange -ay -P
> >   Partial mode. Incomplete volume groups will be activated read-only.
> >   Missing PV with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw' in VG
> > main 2 logical volume(s) in volume group "main" now active
>
> the metadata backup also shows the device name as a hint.
> Is this saved by the on-disk MD, too? Might be helpful to see.

Dieter,

Yes, the on-disk and backup metadata is identical so we have the
device hint. But I don't think that it is really a good idea to show it,
because this would make up a bit pitfall and confusing in stress
situations.

But it would be usefull to add a list of lvs that are partially available
or degraded in case of mirrors, so you have a quick info what is
the actual state of your system.

Best,

Jens

--=20
  Jens Wilke
  Linux on zSeries - Application Development Tools + GCC
  phone +49-(0)7031-16-3936 - tl *120-3936 - email jens.wilke@de.ibm.com
  IBM Germany Lab, Schoenaicher Str. 220, 71032 Boeblingen
