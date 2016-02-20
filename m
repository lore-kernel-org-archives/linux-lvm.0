Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1KGoAci023255
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 11:50:11 -0500
Received: from mtaextp1.scidom.de (mtaextp1.scidom.de [146.107.3.105])
	by mx1.redhat.com (Postfix) with ESMTPS id 1967FC00B8C8
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 16:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id AEAC81409FE
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 17:50:05 +0100 (CET)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id IRFPNd2narWn for <linux-lvm@redhat.com>;
	Sat, 20 Feb 2016 17:50:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaextp1.scidom.de (Postfix) with ESMTP id A95DF141093
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 17:50:02 +0100 (CET)
Received: from mtaextp1.scidom.de ([127.0.0.1])
	by localhost (mtaextp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RypSkqcdsjJe for <linux-lvm@redhat.com>;
	Sat, 20 Feb 2016 17:50:02 +0100 (CET)
Received: from mtaintp1.scidom.de (mtaintp1.scidom.de [146.107.8.104])
	by mtaextp1.scidom.de (Postfix) with ESMTPS id 80DA2140DAF
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 17:50:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id 785A110149C
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 17:50:02 +0100 (CET)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 5yUJzrYEJC_A for <linux-lvm@redhat.com>;
	Sat, 20 Feb 2016 17:50:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mtaintp1.scidom.de (Postfix) with ESMTP id EFE6A101372
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 17:50:01 +0100 (CET)
Received: from mtaintp1.scidom.de ([127.0.0.1])
	by localhost (mtaintp1.scidom.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uXvci0MHoaT9 for <linux-lvm@redhat.com>;
	Sat, 20 Feb 2016 17:50:01 +0100 (CET)
Received: from mbxp1.scidom.de (mbxp1.scidom.de [146.107.8.101])
	by mtaintp1.scidom.de (Postfix) with ESMTP id CAFA1100921
	for <linux-lvm@redhat.com>; Sat, 20 Feb 2016 17:50:01 +0100 (CET)
Date: Sat, 20 Feb 2016 17:50:01 +0100 (CET)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Message-ID: <990818927.5068508.1455987001095.JavaMail.zimbra@helmholtz-muenchen.de>
In-Reply-To: <56C88082.4010404@gmail.com>
References: <1665753824.5013038.1455907222524.JavaMail.zimbra@helmholtz-muenchen.de>
	<56C77BAC.5010702@gmail.com>
	<724866179.5061938.1455974751462.JavaMail.zimbra@helmholtz-muenchen.de>
	<56C88082.4010404@gmail.com>
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




>>>>
>>>
>>>
>>> Unfortunately you can't do that if you log to the SAME volume you are
>>> suspending - i.e. you run your command from your root volume
>>> which is also suspended.
>>>
>>> We could likely 'buffer' the output while in suspend mode,
>>> and throw out the output later - but as this is seen as 'debug' help it=
's
>>> assume user takes care and user place for logging which doesn't block.
>>>
>>> So if you want to see logs - use something tmpfs location for it.
>>>
>>> Regards
>>>
>>>
>>> Zdenek
>>>
>>
>> Hi Zdenek,
>>
>> thanks for your answer. I redirected the output already to another parti=
tion,
>> but system still stopped. Maybe because the partition is on the same dis=
k as
>> the lv ? Whole disk is suspended ? It's not possible to suspend just a
>> partition ? I will try with tmpfs or something else.
>> But does that mean that redirection is generally not possible when suspe=
nding a
>> lv ? Or just in my case because i invoke lvcreate ? What is about other
>> programs having redirections during the suspend ? And why does it work w=
hen i
>> just rediredt stdout ? When i redirect stdout and stderr system stops.
>>
>=20
>=20
> Your 'partition' layout isn't clear - but anyway - debugging command when=
 you
> run it from a partition you try to suspend is 'tricky'.
> Suspend basically stops any read/write operation from suspended device.
> So you just need to be sure there is nothing on logging path which might =
be
> blocked.
>=20
> So is your command blocked when you log into ramdisk ?
> Are you using some recent version of lvm2 ?
>=20
>=20
> Zdenek
>=20
Hi,

i have two partitions on the disk: One for /boot and one as a lv for /.
I will try to redirect to a ramdisk and inform you.
LVM is lvm2-2.02.98-0.37.2

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
