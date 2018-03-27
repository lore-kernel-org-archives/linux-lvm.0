Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2284850DFD
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 10:22:33 +0000 (UTC)
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0D1D7FEA2
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 10:22:31 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l16so20747230wmh.3
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 03:22:31 -0700 (PDT)
References: <5AB52B8D020000F9000B14B9@prv-mh.provo.novell.com>
	<229d22d1217a7fa96874df0fb6d53e0c@xenhideout.nl>
	<5AB8FDE7020000F9000B19DD@prv-mh.provo.novell.com>
	<CAD+pdNdPKmHb7BQfT4DUj2M+=yy1P3JYtXO4GjNRXn2QA_cwwA@mail.gmail.com>
	<5ABA4D6D020000F9000B1E44@prv-mh.provo.novell.com>
	<8d1d7152bf62372494a0aa5d2be0012c@xenhideout.nl>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <b9f55f3f-1998-4ca8-b6ce-e0a2be6e2698@gmail.com>
Date: Tue, 27 Mar 2018 12:22:28 +0200
MIME-Version: 1.0
In-Reply-To: <8d1d7152bf62372494a0aa5d2be0012c@xenhideout.nl>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Can't work normally after attaching disk volumes
 originally in a VG on another machine
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Xen <list@xenhideout.nl>

Dne 27.3.2018 v 11:12 Xen napsal(a):
> Gang He schreef op 27-03-2018 7:55:
>=20
>> I just reproduced a problem from the customer, since they did virtual
>> disk migration from one virtual machine=EF=BF=BD to another one.
>> According to your comments, this does not look like a LVM code problem,
>> the problem can be considered as LVM administer misoperation?
>=20
> Counterintuitively, you must remove the PV from the VG before you remove =
the=20
> (physical) disk from the system.
>=20
> Yes that is something you can often forget doing, but as it stands resolv=
ing=20
> the situation often becomes a lot harder when you do it in reverse.
>=20
> Ie. removing the disk first and then removing the PV from the VG is a lot=
 harder.
>=20


IMO 'vgreduce --removemissing'  doesn't look to me like a real rocket scien=
ce.

Of course if the space on a missing PV has been in-use with some LVs - it g=
ets
a bit more complex - but still as long as you don't care about data adding
'--force' option should usually help  (although there can be some room for
improvement -  but every coding takes its time - and there are not to many =

hands working on this...)

Regards

Zdenek
