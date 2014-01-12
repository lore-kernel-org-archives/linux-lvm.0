Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0C9cJF9013498
	for <linux-lvm@redhat.com>; Sun, 12 Jan 2014 04:38:19 -0500
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0C9cI9d026876
	for <linux-lvm@redhat.com>; Sun, 12 Jan 2014 04:38:18 -0500
Received: by mail-ob0-f172.google.com with SMTP id gq1so6633047obb.31
	for <linux-lvm@redhat.com>; Sun, 12 Jan 2014 01:38:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <52D2254D.5090802@alteeve.ca>
References: <1389500888.48728.YahooMailNeo@web161702.mail.bf1.yahoo.com>
	<52D21B4F.50504@alteeve.ca>
	<1389502767.50207.YahooMailNeo@web161703.mail.bf1.yahoo.com>
	<52D2254D.5090802@alteeve.ca>
Date: Sun, 12 Jan 2014 11:38:17 +0200
Message-ID: <CAJc7SsbaO+QMbST9vNC5OoYUHcbSGmnspUyjh8AxEsS-ASD96g@mail.gmail.com>
From: Gabriel <jarod125@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c2b8b20b439f04efc2b89e
Subject: Re: [linux-lvm] Logical Volume Inaccessible
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

--001a11c2b8b20b439f04efc2b89e
Content-Type: text/plain; charset=ISO-8859-1

Perhaps it would be better to use ddrescue[1] for this (instead of dd).

[1] http://www.gnu.org/software/ddrescue/
On Jan 12, 2014 7:21 AM, "Digimer" <lists@alteeve.ca> wrote:

> On 11/01/14 11:59 PM, Tom+Dale wrote:
>
>>
>>  What does 'pvscan; vgscan; lvscan' show? If the LVs show 'inactive', try
>>>
>>
>>  'lvchange -ay <lv_path>', then 'lvscan' should show the LV as 'ACTIVE'.
>>> If so, try mounting the LV.
>>> --
>>> Digimer
>>> Papers and Projects: https://alteeve.ca/w/
>>> What if the cure for cancer is trapped in the mind of a person without
>>> access to education?
>>>
>>
>> Here is what I got:
>>
>> [root@localhost ~]# pvscan
>>    /dev/sda2: read failed after 0 of 1024 at 0: Input/output error
>>    /dev/sda2: read failed after 0 of 1024 at 4096: Input/output error
>>    /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
>>    No matching physical volumes found
>> [root@localhost ~]# lvscan
>>    /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
>> [root@localhost ~]# vgscan
>>    Reading all physical volumes.  This may take a while...
>>    /dev/sda2: read failed after 0 of 1024 at 0: Input/output error
>>    /dev/sda2: read failed after 0 of 1024 at 4096: Input/output error
>>    /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
>> [root@localhost ~]# lvchange -ay /dev/sda2
>>    /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
>>    /dev/sda2: read failed after 0 of 1024 at 0: Input/output error
>>    /dev/sda2: read failed after 0 of 1024 at 4096: Input/output error
>>    /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
>>    Volume group "sda2" not found
>>    Skipping volume group sda2
>> [root@localhost ~]#
>>
>
> Eep,
>
>   That looks like the drive might be failing. If you don't have a good
> backup, then you might want to stop. If the data on the drive is very
> valuable, I would do nothing more and call a data recovery house. If that's
> not feasible, then the first thing I would do is connect another drive of
> equal or larger size and dd the bad drive to the other drive.
>
>   For example, if the bad drive comes up as /dev/sdb and the spare/backup
> drive comes up as /dev/sdc, you would want to run something like 'dd
> if=/dev/sdb of=/dev/sdc bs=8k'. That will clone, byte for byte, sdb onto
> sdc (and erase whatever was on sdc, of course). Then set aside the failing
> drive and try to recover the data on sdc (possibly copy it again to a 3rd
> drive, just to be extra safe). This way, if something goes wrong, you can
> start over.
>
>
>
> --
> Digimer
> Papers and Projects: https://alteeve.ca/w/
> What if the cure for cancer is trapped in the mind of a person without
> access to education?
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001a11c2b8b20b439f04efc2b89e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Perhaps it would be better to use ddrescue[1] for this (inst=
ead of dd).</p>
<p dir=3D"ltr">[1] <a href=3D"http://www.gnu.org/software/ddrescue/">http:/=
/www.gnu.org/software/ddrescue/</a></p>
<div class=3D"gmail_quote">On Jan 12, 2014 7:21 AM, &quot;Digimer&quot; &lt=
;<a href=3D"mailto:lists@alteeve.ca">lists@alteeve.ca</a>&gt; wrote:<br typ=
e=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
On 11/01/14 11:59 PM, Tom+Dale wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
What does &#39;pvscan; vgscan; lvscan&#39; show? If the LVs show &#39;inact=
ive&#39;, try<br>
</blockquote>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
&#39;lvchange -ay &lt;lv_path&gt;&#39;, then &#39;lvscan&#39; should show t=
he LV as &#39;ACTIVE&#39;.<br>
If so, try mounting the LV.<br>
--<br>
Digimer<br>
Papers and Projects: <a href=3D"https://alteeve.ca/w/" target=3D"_blank">ht=
tps://alteeve.ca/w/</a><br>
What if the cure for cancer is trapped in the mind of a person without<br>
access to education?<br>
</blockquote>
<br>
Here is what I got:<br>
<br>
[root@localhost ~]# pvscan<br>
=A0 =A0/dev/sda2: read failed after 0 of 1024 at 0: Input/output error<br>
=A0 =A0/dev/sda2: read failed after 0 of 1024 at 4096: Input/output error<b=
r>
=A0 =A0/dev/sda2: read failed after 0 of 2048 at 0: Input/output error<br>
=A0 =A0No matching physical volumes found<br>
[root@localhost ~]# lvscan<br>
=A0 =A0/dev/sda2: read failed after 0 of 2048 at 0: Input/output error<br>
[root@localhost ~]# vgscan<br>
=A0 =A0Reading all physical volumes. =A0This may take a while...<br>
=A0 =A0/dev/sda2: read failed after 0 of 1024 at 0: Input/output error<br>
=A0 =A0/dev/sda2: read failed after 0 of 1024 at 4096: Input/output error<b=
r>
=A0 =A0/dev/sda2: read failed after 0 of 2048 at 0: Input/output error<br>
[root@localhost ~]# lvchange -ay /dev/sda2<br>
=A0 =A0/dev/sda2: read failed after 0 of 2048 at 0: Input/output error<br>
=A0 =A0/dev/sda2: read failed after 0 of 1024 at 0: Input/output error<br>
=A0 =A0/dev/sda2: read failed after 0 of 1024 at 4096: Input/output error<b=
r>
=A0 =A0/dev/sda2: read failed after 0 of 2048 at 0: Input/output error<br>
=A0 =A0Volume group &quot;sda2&quot; not found<br>
=A0 =A0Skipping volume group sda2<br>
[root@localhost ~]#<br>
</blockquote>
<br>
Eep,<br>
<br>
=A0 That looks like the drive might be failing. If you don&#39;t have a goo=
d backup, then you might want to stop. If the data on the drive is very val=
uable, I would do nothing more and call a data recovery house. If that&#39;=
s not feasible, then the first thing I would do is connect another drive of=
 equal or larger size and dd the bad drive to the other drive.<br>

<br>
=A0 For example, if the bad drive comes up as /dev/sdb and the spare/backup=
 drive comes up as /dev/sdc, you would want to run something like &#39;dd i=
f=3D/dev/sdb of=3D/dev/sdc bs=3D8k&#39;. That will clone, byte for byte, sd=
b onto sdc (and erase whatever was on sdc, of course). Then set aside the f=
ailing drive and try to recover the data on sdc (possibly copy it again to =
a 3rd drive, just to be extra safe). This way, if something goes wrong, you=
 can start over.<br>

<br>
<br>
<br>
-- <br>
Digimer<br>
Papers and Projects: <a href=3D"https://alteeve.ca/w/" target=3D"_blank">ht=
tps://alteeve.ca/w/</a><br>
What if the cure for cancer is trapped in the mind of a person without acce=
ss to education?<br>
<br>
______________________________<u></u>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/<u></u>mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-<u></u>HOWTO/</a><br>
</blockquote></div>

--001a11c2b8b20b439f04efc2b89e--
