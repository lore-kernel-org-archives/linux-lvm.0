Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4MIdPvP002663
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 14:39:25 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4MIdNaa019093
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 14:39:24 -0400
Received: by eaak11 with SMTP id k11so1930765eaa.33
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 11:39:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4FBBD376.7070001@bmsi.com>
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<4FBBD376.7070001@bmsi.com>
Date: Wed, 23 May 2012 00:09:23 +0530
Message-ID: <CAGQjrKYeeG4Bwifh3yno46P3BDe9grbz8Um6mZqpcst5Eh7JaA@mail.gmail.com>
From: tariq wali <ganaiwali@gmail.com>
Content-Type: multipart/alternative; boundary=90e6ba53a1e2607e0d04c0a456e6
Subject: Re: [linux-lvm] Fun and games with mirroring
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

--90e6ba53a1e2607e0d04c0a456e6
Content-Type: text/plain; charset=ISO-8859-1

if I may ask an elementary question please :) I normally take a snapshot on
lvm partition offcourse that contains MySQL data say /data and then mount
it as ro and then use the ancient tar/scp to copy it elsewhere . Could
anyone please correct me if there is a better way to do it ? like can i
take  a snapshot of /data and transfer the entire volume to another system
( i mean duplicate/mirror it ) ?

Also

sometime /data contains data that I really don't need to be in the snapshot
but the way i take snapshot it pretty much creates a mirror .. I have
always wondered how snapshot thing works because when i take snapshot I
continue to use my original /data and continue to do IO on it while
snapshot is mounted :)



On Tue, May 22, 2012 at 11:27 PM, Stuart D Gathman <stuart@bmsi.com> wrote:

> Long ago, Nostradamus foresaw that on 05/22/2012 10:50 AM, Vic would write:
>
>> p.s. The reason I want to do this with LVM mirrors rather than MD RAID is
>> that this is potentially a very useful way of grabbing a backup snapshot
>> of a machine prior to some risky operation - it allows me to "fork" a
>> machine onto two sets of media. But if it leaves the result unbootable,
>> that's something of a problem...
>>
>>  LVM RAID is mainly used for pvmove at the moment.  LVM has a ways to go
> to match ZFS or AIX in LVM mirroring features.   MD RAID takes a snapshot
> just fine.  Add the mirror with mdadm, sync it, and "fail" the mirror and
> remove it before physically removing the drive.  I can see the issue with
> multiple PVs, however.  There is no atomic way to fail multiple mirrors at
> once.
>
>
>
> ______________________________**_________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/**mailman/listinfo/linux-lvm<https://www.redhat.com/mailman/listinfo/linux-lvm>
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-**HOWTO/<http://tldp.org/HOWTO/LVM-HOWTO/>
>



-- 
*Tariq Wali.*

--90e6ba53a1e2607e0d04c0a456e6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">if I may ask an elementary question please :) I normally t=
ake a snapshot on lvm partition offcourse that contains MySQL data say /dat=
a and then mount it as ro and then use the ancient tar/scp to copy it elsew=
here . Could anyone please correct me if there is a better way to do it ? l=
ike can i take =A0a snapshot of /data and transfer the entire volume to ano=
ther system ( i mean duplicate/mirror it ) ?<div>
<br></div><div>Also</div><div><br></div><div>sometime /data contains data t=
hat I really don&#39;t need to be in the snapshot but the way i take snapsh=
ot it pretty much creates a mirror .. I have always wondered how snapshot t=
hing works because when i take snapshot I continue to use my original /data=
 and continue to do IO on it while snapshot is mounted :)</div>
<div><br></div><div><br><br><div class=3D"gmail_quote">On Tue, May 22, 2012=
 at 11:27 PM, Stuart D Gathman <span dir=3D"ltr">&lt;<a href=3D"mailto:stua=
rt@bmsi.com" target=3D"_blank">stuart@bmsi.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
<div class=3D"im">Long ago, Nostradamus foresaw that on 05/22/2012 10:50 AM=
, Vic would write:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
p.s. The reason I want to do this with LVM mirrors rather than MD RAID is<b=
r>
that this is potentially a very useful way of grabbing a backup snapshot<br=
>
of a machine prior to some risky operation - it allows me to &quot;fork&quo=
t; a<br>
machine onto two sets of media. But if it leaves the result unbootable,<br>
that&#39;s something of a problem...<br>
<br>
</blockquote></div>
LVM RAID is mainly used for pvmove at the moment. =A0LVM has a ways to go t=
o match ZFS or AIX in LVM mirroring features. =A0 MD RAID takes a snapshot =
just fine. =A0Add the mirror with mdadm, sync it, and &quot;fail&quot; the =
mirror and remove it before physically removing the drive. =A0I can see the=
 issue with multiple PVs, however. =A0There is no atomic way to fail multip=
le mirrors at once.<div class=3D"HOEnZb">
<div class=3D"h5"><br>
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
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div dir=3D"ltr"><i style=3D"background-color:rgb(255,0,0);color:rgb(0,102,=
0)">Tariq Wali.</i><span><span style=3D"background-color:rgb(255,255,153)">=
</span></span><br>
</div><br>
</div></div>

--90e6ba53a1e2607e0d04c0a456e6--
