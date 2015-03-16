Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2GCfF62007757
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2015 08:41:15 -0400
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mx1.redhat.com (Postfix) with ESMTPS id BA6408F033
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2015 12:41:13 +0000 (UTC)
Received: by qgez64 with SMTP id z64so38201742qge.2
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2015 05:41:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5506C8FA.6020601@redhat.com>
References: <CANvCAA9qEJQUFbFh6X6BVPO2uo2+ELQZp0Fi_wQr34JyvkaHOA@mail.gmail.com>
	<5506C8FA.6020601@redhat.com>
Date: Mon, 16 Mar 2015 13:41:12 +0100
Message-ID: <CANvCAA_aW7xxHyBjSHpMo48F9HSt9aYqnOEyhGa+Bd=gr94xXQ@mail.gmail.com>
From: Tomas Dalebjork <tomas.dalebjork@repostor.com>
Content-Type: multipart/alternative; boundary=001a114591fc5280f30511672a12
Subject: Re: [linux-lvm] device-mapper: snapshots: Invalidating snapshot:
 Unable to allocate exception.
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Lars <lars.i.johansson@delecsys.se>

--001a114591fc5280f30511672a12
Content-Type: text/plain; charset=UTF-8

Many thanks Zdenek ;)

This confirms our theory of what causes the problem for us.

Best regards Tomas

2015-03-16 13:13 GMT+01:00 Zdenek Kabelac <zkabelac@redhat.com>:

> Dne 15.3.2015 v 14:03 Tomas Dalebjork napsal(a):
>
>  Hi,
>>
>> We have configured /etc/lvm/lvm.conf to extend our snapshot automatically.
>> This works fine for slow growing volumes, but if the growth of the volume
>> is
>> faster, than LVM invalidate the snapshot rather than extend the snapshot
>> volume.
>> Because I think that the lvm-monitor does not grow the volume in time.
>>
>> This is the error we see in kernel log (dmesg)
>> device-mapper: snapshots: Invalidating snapshot: Unable to allocate
>> exception.
>>
>> Our snapshot volume is 1GB
>> Our extension is configured like this in /etc/lvm/lvm.conf
>>
>>      snapshot_autoextend_threshold = 50
>>      snapshot_autoextend_percent = 20
>>
>> And we have restarted lvm2-monitor services after this changes using
>> # service lvm2-monitor restart
>>
>> Other slow growing volumes works fine.
>>
>> Can someone hint us of what the issue can be, or how to mitigate this to
>> happen?
>> Or tell me how often the "lvm2-monitor" is checking the utilization
>> threashold
>> of the volumes?
>>
>
>
> It's a known issue - the advice is to switch to thin provisioning were
> there is no such problem.
>
> 'dmeventd' is not fast enought for old snapshots.
>
> If you want to use old snaps - you need to have reserve for  10 x
> speed_of_your_drive.
>
> So i.e. if you want to be sure you will not get invalid snapshot and
> you could push  0.5G/s through your SSD - you simply need 5GB reserve.
>
> Back to your example - for 1GB origin you need to provide 100% size for
> snapshot otherwise you are in danger of getting invalid snapshot when you
> rapidly write to your origin.
>
> There is no other advice then to switch to thinly provisioned devices for
> such case.
>
>
> Regards
>
> Zdenek
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001a114591fc5280f30511672a12
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Many thanks Zdenek ;)<br><br></div>This confirms=
 our theory of what causes the problem for us.<br><br></div>Best regards To=
mas<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2015=
-03-16 13:13 GMT+01:00 Zdenek Kabelac <span dir=3D"ltr">&lt;<a href=3D"mail=
to:zkabelac@redhat.com" target=3D"_blank">zkabelac@redhat.com</a>&gt;</span=
>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Dne 15.3.2015 v 14:03 Tomas Dalebjork =
napsal(a):<div><div class=3D"h5"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi,<br>
<br>
We have configured /etc/lvm/lvm.conf to extend our snapshot automatically.<=
br>
This works fine for slow growing volumes, but if the growth of the volume i=
s<br>
faster, than LVM invalidate the snapshot rather than extend the snapshot vo=
lume.<br>
Because I think that the lvm-monitor does not grow the volume in time.<br>
<br>
This is the error we see in kernel log (dmesg)<br>
device-mapper: snapshots: Invalidating snapshot: Unable to allocate excepti=
on.<br>
<br>
Our snapshot volume is 1GB<br>
Our extension is configured like this in /etc/lvm/lvm.conf<br>
<br>
=C2=A0 =C2=A0 =C2=A0snapshot_autoextend_threshold =3D 50<br>
=C2=A0 =C2=A0 =C2=A0snapshot_autoextend_percent =3D 20<br>
<br>
And we have restarted lvm2-monitor services after this changes using<br>
# service lvm2-monitor restart<br>
<br>
Other slow growing volumes works fine.<br>
<br>
Can someone hint us of what the issue can be, or how to mitigate this to ha=
ppen?<br>
Or tell me how often the &quot;lvm2-monitor&quot; is checking the utilizati=
on threashold<br>
of the volumes?<br>
</blockquote>
<br>
<br></div></div>
It&#39;s a known issue - the advice is to switch to thin provisioning were =
there is no such problem.<br>
<br>
&#39;dmeventd&#39; is not fast enought for old snapshots.<br>
<br>
If you want to use old snaps - you need to have reserve for=C2=A0 10 x spee=
d_of_your_drive.<br>
<br>
So i.e. if you want to be sure you will not get invalid snapshot and<br>
you could push=C2=A0 0.5G/s through your SSD - you simply need 5GB reserve.=
<br>
<br>
Back to your example - for 1GB origin you need to provide 100% size for sna=
pshot otherwise you are in danger of getting invalid snapshot when you rapi=
dly write to your origin.<br>
<br>
There is no other advice then to switch to thinly provisioned devices for s=
uch case.<br>
<br>
<br>
Regards<br>
<br>
Zdenek<br>
<br>
<br>
______________________________<u></u>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/<u></u>mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-<u></u>HOWTO/</a><br>
</blockquote></div><br></div>

--001a114591fc5280f30511672a12--
