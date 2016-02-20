Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1KDQ2pS002329
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 08:26:02 -0500
Received: from mtaextp1.scidom.de (mtaextp1.scidom.de [146.107.3.105])
	by mx1.redhat.com (Postfix) with ESMTPS id 73F7691FE5
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 13:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id 75987140DF1
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 14:25:58 +0100 (CET)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id zkjBSAymiH7c for <linux-lvm@redhat.com>;
	Sat, 20 Feb 2016 14:25:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id 821B7140EAF
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 14:25:56 +0100 (CET)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3eB1Om0O_gko for <linux-lvm@redhat.com>;
	Sat, 20 Feb 2016 14:25:56 +0100 (CET)
Received: from mtaintp1.scidom.de (mtaintp1.scidom.de [146.107.8.104])
	by mtaextp1.scidom.de (Postfix) with ESMTPS id 54460140DF1
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 14:25:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 4D467100965
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 14:25:56 +0100 (CET)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id oxzT6KV-BPtP for <linux-lvm@redhat.com>;
	Sat, 20 Feb 2016 14:25:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id A46D11014D2
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 14:25:55 +0100 (CET)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KL9g0T1vI3my for <linux-lvm@redhat.com>;
	Sat, 20 Feb 2016 14:25:55 +0100 (CET)
Received: from mbxp1.scidom.de (mbxp1.scidom.de [146.107.8.101])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 80B9C100965
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 14:25:55 +0100 (CET)
Date: Sat, 20 Feb 2016 14:25:51 +0100 (CET)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Message-ID: <724866179.5061938.1455974751462.JavaMail.zimbra@helmholtz-muenchen.de>
In-Reply-To: <56C77BAC.5010702@gmail.com>
References: <1665753824.5013038.1455907222524.JavaMail.zimbra@helmholtz-muenchen.de>
	<56C77BAC.5010702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] problem with lvcreate and redirection
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



----- Am 19. Feb 2016 um 21:31 schrieb Zdenek Kabelac zdenek.kabelac@gmail.=
com:

> Dne 19.2.2016 v 19:40 Lentes, Bernd napsal(a):
>> Hi,
>>
>> i have a script in which i invoke lvremove and lvcreate. With lvremove i=
 don't
>> have proplems but with lvcreate.
>> I'm redirecting stdout and stderr to a file because the script is execut=
ed by
>> cron and i'd like to have a look afterwards if everything went fine.
>> The command is: lvcreate -v -L 25G -n lv_root_snapshot -s vg1/lv_root >
>> lvcreate_with_redirection.log 2>&1. Shell does not accept further comman=
ds
>> afterwards, but host still responds to ping. You can have a look on
>> lvcreate_with_redirection.log here:
>> https://hmgubox.helmholtz-muenchen.de:8001/d/b4c7025bac/ .
>> System seems to stop while suspending.
>>
>> last lines of the log:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>>
>> ...
>>      Creating vg1-lv_root_snapshot-cow
>>      Loading vg1-lv_root_snapshot-cow table (252:3)
>>      Resuming vg1-lv_root_snapshot-cow (252:3)
>>      Loading vg1-lv_root_snapshot table (252:1)
>>      Suspending vg1-lv_root (252:0) with filesystem sync with device flu=
sh
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>>
>=20
>=20
> Unfortunately you can't do that if you log to the SAME volume you are
> suspending - i.e. you run your command from your root volume
> which is also suspended.
>=20
> We could likely 'buffer' the output while in suspend mode,
> and throw out the output later - but as this is seen as 'debug' help it's
> assume user takes care and user place for logging which doesn't block.
>=20
> So if you want to see logs - use something tmpfs location for it.
>=20
> Regards
>=20
>=20
> Zdenek
>=20

Hi Zdenek,

thanks for your answer. I redirected the output already to another partitio=
n, but system still stopped. Maybe because the partition is on the same dis=
k as the lv ? Whole disk is suspended ? It's not possible to suspend just a=
 partition ? I will try with tmpfs or something else.
But does that mean that redirection is generally not possible when suspendi=
ng a lv ? Or just in my case because i invoke lvcreate ? What is about othe=
r programs having redirections during the suspend ? And why does it work wh=
en i just rediredt stdout ? When i redirect stdout and stderr system stops.

Bernd
Helmholtz Zentrum M=C3=BCnchen

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
