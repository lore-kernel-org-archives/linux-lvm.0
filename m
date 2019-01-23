Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83C536017A
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2019 10:46:43 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BFB4C04BD2F
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2019 10:46:42 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id q2-v6so1464286lji.10
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2019 02:46:42 -0800 (PST)
MIME-Version: 1.0
References: <CAJ6XMjEzDgj4iccGVKkWftBWNiQbnRkPOKnOCrgSLjhzdm+Z=A@mail.gmail.com>
In-Reply-To: <CAJ6XMjEzDgj4iccGVKkWftBWNiQbnRkPOKnOCrgSLjhzdm+Z=A@mail.gmail.com>
From: Steve Dodd <steved424@gmail.com>
Date: Wed, 23 Jan 2019 10:46:29 +0000
Message-ID: <CAJ6XMjFuj4acAq3Fahj7wd7Kbyh09Geq4Pt9UVwQYDf1Th9S=g@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001b702d05801dcfe9"
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

--0000000000001b702d05801dcfe9
Content-Type: text/plain; charset="UTF-8"

Sorry, user error sent the last email before I'd finished typing, trying
again..

Hi everyone,

I am experiencing a mystery scrub failure after extending a particular LV
which is a raid1 type mirror. I am using Ubuntu 18.04, LVM
2.02.176-4.1ubuntu3, Ubuntu kernel 4.15.0-29-generic. I mentioned this on
IRC, thought an email might reach more people and allow me to provide more
detail.

As far as I can tell, the LV was *not* created with --nosync:

# lvs rvg/backups
>   LV      VG  Attr       LSize  Pool Origin Data%  Meta%  Move Log
> Cpy%Sync Convert
>   backups rvg rwi-aor--- 96.64G                                    100.00
>


The only odd thing I tend to do is specify extents for the extension
manually, being a bit OCD about on disk segment layouts. Having mined
.bash_history, it seems that last time I ran:

lvextend -l+2561 rvg/backups /dev/sdc3:20480-23041 /dev/sdb3:80097-82658


After that, a *lvchange --syncaction check rvg/backups* showed a huge
number for raid_mismatch_count (seemed roughly consistent with the newly
extended portion not being synced), but dumping the actual filesystem with
partclone from both legs of the mirror through md5sum showed no
inconsistencies; the contents are mostly borg repositories and for good
measure I verified the data in those using borg as well - no problems.

After a full resync all is well again. This is the second time this
happened to me on the same LV (I think - certainly the same VG.)

Any clues? Any known bugs fixed recently that might not have made it into
Ubuntu 1804? I am trying to reproduce with a test LV but can't. Only other
thing I can think might be relevant was that the volume was mounted (but
quiescent) at the time.

Thanks,
Steve

--0000000000001b702d05801dcfe9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div>Sorry, user error sent the last email before I&#39;d finishe=
d typing, trying again..</div><div><br></div>Hi everyone,<br><br>I am exper=
iencing a mystery scrub failure after extending a particular LV which is a =
raid1 type mirror. I am using Ubuntu 18.04, LVM 2.02.176-4.1ubuntu3, Ubuntu=
 kernel=C2=A04.15.0-29-generic. I mentioned this on IRC, thought an email m=
ight reach more people and allow me to provide more detail.</div><div dir=
=3D"ltr"><br></div><div>As far as I can tell, the LV was *not* created with=
 --nosync:</div><div><br></div><div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><font face=3D"monospace, monospace"># lvs rvg/backups<br>=C2=A0 =
LV=C2=A0 =C2=A0 =C2=A0 VG=C2=A0 Attr=C2=A0 =C2=A0 =C2=A0 =C2=A0LSize=C2=A0 =
Pool Origin Data%=C2=A0 Meta%=C2=A0 Move Log Cpy%Sync Convert<br>=C2=A0 bac=
kups rvg rwi-aor--- 96.64G=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 100.00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</font></blockquote><div>=
<br></div><div>The only odd thing I tend to do is specify extents for the e=
xtension manually, being a bit OCD about on disk segment layouts. Having mi=
ned <font face=3D"monospace, monospace">.bash_history</font>, it seems that=
 last time I ran:</div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><font face=3D"monospace, monospace">lvextend -l+2561 rvg/backu=
ps /dev/sdc3:20480-23041 /dev/sdb3:80097-82658</font></blockquote><div><br>=
</div></div><div>After that, a=C2=A0<font face=3D"monospace, monospace"><u>=
lvchange --syncaction check rvg/backups</u></font> showed a huge number for=
 <font face=3D"monospace, monospace">raid_mismatch_count</font>=C2=A0(seeme=
d roughly consistent with the newly extended portion not being synced), but=
 dumping the actual filesystem with partclone from both legs of the mirror =
through md5sum showed no inconsistencies; the contents are mostly borg repo=
sitories and for good measure I verified the data in those using borg as we=
ll - no problems.</div><div><br></div><div>After a full resync all is well =
again. This is the second time this happened to me on the same LV (I think =
- certainly the same VG.)</div><div><br></div><div>Any clues? Any known bug=
s fixed recently that might not have made it into Ubuntu 1804? I am trying =
to reproduce with a test LV but can&#39;t. Only other thing I can think mig=
ht be relevant was that the volume was mounted (but quiescent) at the time.=
</div><div><br></div><div>Thanks,</div><div>Steve</div></div></div></div></=
div>

--0000000000001b702d05801dcfe9--
