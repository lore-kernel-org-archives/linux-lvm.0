Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7FD05E7A8
	for <linux-lvm@redhat.com>; Sat,  2 Feb 2019 13:34:17 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 674BFC058CBE
	for <linux-lvm@redhat.com>; Sat,  2 Feb 2019 13:34:15 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id c19-v6so8149648lja.5
	for <linux-lvm@redhat.com>; Sat, 02 Feb 2019 05:34:15 -0800 (PST)
MIME-Version: 1.0
References: <CAJ6XMjEzDgj4iccGVKkWftBWNiQbnRkPOKnOCrgSLjhzdm+Z=A@mail.gmail.com>
	<CAJ6XMjFuj4acAq3Fahj7wd7Kbyh09Geq4Pt9UVwQYDf1Th9S=g@mail.gmail.com>
In-Reply-To: <CAJ6XMjFuj4acAq3Fahj7wd7Kbyh09Geq4Pt9UVwQYDf1Th9S=g@mail.gmail.com>
From: Steve Dodd <steved424@gmail.com>
Date: Sat, 2 Feb 2019 13:34:02 +0000
Message-ID: <CAJ6XMjGgSPP7nBFZk-JBz_6uAjJssunKonAEoDjWQmOZJyXfmQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b7acd50580e95030"
Subject: Re: [linux-lvm] Scrub errors after extending LVM RAID1 mirror [full
	email]
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
To: linux-lvm@redhat.com

--000000000000b7acd50580e95030
Content-Type: text/plain; charset="UTF-8"

Weirdly, I thought I had failed to reproduce this bug, but my auto-scrub
job ran this morning (first Sat of month), and I got:

03:15:15: Starting scrub of rvg/test ...
03:15:15: ... scrub started ...
03:18:36: FAILED:      7926656 mismatches

So I really have no idea what's going on there. I will wade through my bash
history and see if I can see what I did last week and what triggered this..

S.

On Wed, 23 Jan 2019 at 10:46, Steve Dodd <steved424@gmail.com> wrote:

> Sorry, user error sent the last email before I'd finished typing, trying
> again..
>
> Hi everyone,
>
> I am experiencing a mystery scrub failure after extending a particular LV
> which is a raid1 type mirror. I am using Ubuntu 18.04, LVM
> 2.02.176-4.1ubuntu3, Ubuntu kernel 4.15.0-29-generic. I mentioned this on
> IRC, thought an email might reach more people and allow me to provide more
> detail.
>
> As far as I can tell, the LV was *not* created with --nosync:
>
> # lvs rvg/backups
>>   LV      VG  Attr       LSize  Pool Origin Data%  Meta%  Move Log
>> Cpy%Sync Convert
>>   backups rvg rwi-aor--- 96.64G
>> 100.00
>
>
> The only odd thing I tend to do is specify extents for the extension
> manually, being a bit OCD about on disk segment layouts. Having mined
> .bash_history, it seems that last time I ran:
>
> lvextend -l+2561 rvg/backups /dev/sdc3:20480-23041 /dev/sdb3:80097-82658
>
>
> After that, a *lvchange --syncaction check rvg/backups* showed a huge
> number for raid_mismatch_count (seemed roughly consistent with the newly
> extended portion not being synced), but dumping the actual filesystem with
> partclone from both legs of the mirror through md5sum showed no
> inconsistencies; the contents are mostly borg repositories and for good
> measure I verified the data in those using borg as well - no problems.
>
> After a full resync all is well again. This is the second time this
> happened to me on the same LV (I think - certainly the same VG.)
>
> Any clues? Any known bugs fixed recently that might not have made it into
> Ubuntu 1804? I am trying to reproduce with a test LV but can't. Only other
> thing I can think might be relevant was that the volume was mounted (but
> quiescent) at the time.
>
> Thanks,
> Steve
>

--000000000000b7acd50580e95030
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Weirdly, I thought I had failed to r=
eproduce this bug, but my auto-scrub job ran this morning (first Sat of mon=
th), and I got:</div><div><br></div><div><div>03:15:15: Starting scrub of r=
vg/test ...=C2=A0</div><div>03:15:15: ... scrub started ...</div><div>03:18=
:36: FAILED:=C2=A0 =C2=A0 =C2=A0 7926656 mismatches</div><div><br></div></d=
iv><div>So I really have no idea what&#39;s going on there. I will wade thr=
ough my bash history and see if I can see what I did last week and what tri=
ggered this..</div><div><br></div><div>S.</div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 23 Jan 2019 at 10:46, Stev=
e Dodd &lt;<a href=3D"mailto:steved424@gmail.com">steved424@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"l=
tr"><div>Sorry, user error sent the last email before I&#39;d finished typi=
ng, trying again..</div><div><br></div>Hi everyone,<br><br>I am experiencin=
g a mystery scrub failure after extending a particular LV which is a raid1 =
type mirror. I am using Ubuntu 18.04, LVM 2.02.176-4.1ubuntu3, Ubuntu kerne=
l=C2=A04.15.0-29-generic. I mentioned this on IRC, thought an email might r=
each more people and allow me to provide more detail.</div><div dir=3D"ltr"=
><br></div><div>As far as I can tell, the LV was *not* created with --nosyn=
c:</div><div><br></div><div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><font face=3D"monospace, monospace"># lvs rvg/backups<br>=C2=A0 LV=C2=A0=
 =C2=A0 =C2=A0 VG=C2=A0 Attr=C2=A0 =C2=A0 =C2=A0 =C2=A0LSize=C2=A0 Pool Ori=
gin Data%=C2=A0 Meta%=C2=A0 Move Log Cpy%Sync Convert<br>=C2=A0 backups rvg=
 rwi-aor--- 96.64G=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 100.0=
0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</font></blockquote><div><br></div=
><div>The only odd thing I tend to do is specify extents for the extension =
manually, being a bit OCD about on disk segment layouts. Having mined <font=
 face=3D"monospace, monospace">.bash_history</font>, it seems that last tim=
e I ran:</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><font face=3D"monospace, monospace">lvextend -l+2561 rvg/backups /dev/s=
dc3:20480-23041 /dev/sdb3:80097-82658</font></blockquote><div><br></div></d=
iv><div>After that, a=C2=A0<font face=3D"monospace, monospace"><u>lvchange =
--syncaction check rvg/backups</u></font> showed a huge number for <font fa=
ce=3D"monospace, monospace">raid_mismatch_count</font>=C2=A0(seemed roughly=
 consistent with the newly extended portion not being synced), but dumping =
the actual filesystem with partclone from both legs of the mirror through m=
d5sum showed no inconsistencies; the contents are mostly borg repositories =
and for good measure I verified the data in those using borg as well - no p=
roblems.</div><div><br></div><div>After a full resync all is well again. Th=
is is the second time this happened to me on the same LV (I think - certain=
ly the same VG.)</div><div><br></div><div>Any clues? Any known bugs fixed r=
ecently that might not have made it into Ubuntu 1804? I am trying to reprod=
uce with a test LV but can&#39;t. Only other thing I can think might be rel=
evant was that the volume was mounted (but quiescent) at the time.</div><di=
v><br></div><div>Thanks,</div><div>Steve</div></div></div></div></div>
</blockquote></div></div></div>

--000000000000b7acd50580e95030--
