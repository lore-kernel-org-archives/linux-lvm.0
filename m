Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5FBaspN023103
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2016 07:36:54 -0400
Received: from mtaextp1.scidom.de (mtaextp1.scidom.de [146.107.103.20])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5929180087
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2016 11:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id 0BD15140CE5
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2016 13:36:51 +0200 (CEST)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id fhlm5mR7ZbIA for <linux-lvm@redhat.com>;
	Wed, 15 Jun 2016 13:36:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id D8325141E44
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2016 13:36:47 +0200 (CEST)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dYV-iFVh3cVH for <linux-lvm@redhat.com>;
	Wed, 15 Jun 2016 13:36:47 +0200 (CEST)
Received: from mtaintp1.scidom.de (mtaintp1.scidom.de [146.107.8.104])
	by mtaextp1.scidom.de (Postfix) with ESMTPS id 2FF2613FF31
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2016 13:36:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 243A3101967
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2016 13:36:46 +0200 (CEST)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 9pElqgqmxUFY for <linux-lvm@redhat.com>;
	Wed, 15 Jun 2016 13:36:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 0F51C1018C8
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2016 13:36:45 +0200 (CEST)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0_IZw2qJNfKB for <linux-lvm@redhat.com>;
	Wed, 15 Jun 2016 13:36:44 +0200 (CEST)
Received: from mbxp1.scidom.de (mbxp1.scidom.de [146.107.8.101])
	by mtaintp1.scidom.de (Postfix) with ESMTP id DD473101967
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2016 13:36:44 +0200 (CEST)
Date: Wed, 15 Jun 2016 13:36:44 +0200 (CEST)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Message-ID: <794851222.4973520.1465990604321.JavaMail.zimbra@helmholtz-muenchen.de>
In-Reply-To: <x4cggj1m5cc8u187ub709h33.1465935940882@email.android.com>
References: <x4cggj1m5cc8u187ub709h33.1465935940882@email.android.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] managing "local" LVM and cLVM concurrently ?
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
To: LVM Mailingliste <linux-lvm@redhat.com>


----- On Jun 14, 2016, at 10:25 PM, Bernd Lentes bernd.lentes@helmholtz-mue=
nchen.de wrote:

> -------- Urspr=C3=BCngliche Nachricht --------
> Von: Digimer <lists@alteeve.ca>

> On 14/06/16 11:27 AM, Lentes, Bernd wrote:
> > Hi,

>> i have a configuration where i have some local logical volumes (on an in=
ternal
>> RAID-Controller) and also some logical volumes on a SAN which are shared=
 with a
> > second host. Is this possible concurrently ?
> > Which locking_type to i have to povide ?

> > Thanks.

> > Bernd

> Yup. When you create the VG on the cluster, use the -cy switch (cluster
> =3D yes). Conversely, when creating a VG on non-shared storage, use -cn.
> You need to set the locking to '3' (cluster locking) and be running the
> clvmd service (which requires DLM which is provided by cman on older
> distros and by a stand-alone DLM service on newer distros).

> I assume your cluster is formed properly and fencing/stonith is
> configured and tested?


No. Currently i'm just trying and testing.
I think cman is a Red Hat thing ? I have SLES 11 for the nodes. My plan is =
to use pacemaker. From what i read=20
until now DLM should be ressource managed by the cluster manager.
Or can i configure it as a normal service, managed by init or systemd?=20

Bernd
=20

Helmholtz Zentrum Muenchen
Deutsches Forschungszentrum fuer Gesundheit und Umwelt (GmbH)
Ingolstaedter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Aufsichtsratsvorsitzende: MinDir'in Baerbel Brumme-Bothe
Geschaeftsfuehrer: Prof. Dr. Guenther Wess, Dr. Alfons Enhsen, Renate Schlu=
sen (komm.)
Registergericht: Amtsgericht Muenchen HRB 6466
USt-IdNr: DE 129521671
