Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r3PF5ffa006500
	for <linux-lvm@redhat.com>; Thu, 25 Apr 2013 11:05:41 -0400
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3PF5ddh006846
	for <linux-lvm@redhat.com>; Thu, 25 Apr 2013 11:05:39 -0400
Received: by mail-oa0-f45.google.com with SMTP id o17so2959854oag.32
	for <linux-lvm@redhat.com>; Thu, 25 Apr 2013 08:05:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <51791E1A.8020903@libertytrek.org>
References: <51791E1A.8020903@libertytrek.org>
Date: Thu, 25 Apr 2013 08:05:39 -0700
Message-ID: <CA+_JKzoggNBBKNoD5GZpkJmVjc1t0NUghTavLs-9McQDo0UfkA@mail.gmail.com>
From: Clay Gerrard <clay.gerrard@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b2e4d32613d0f04db30c045
Subject: Re: [linux-lvm] LVM snapshots and filesystem quiescence
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

--047d7b2e4d32613d0f04db30c045
Content-Type: text/plain; charset=ISO-8859-1

I love this question.  I always thought the only way to guarantee a
consistent snap of a block was to unmount it before taking the snap, mostly
just cause of un-fsynced data in the page cache.  Any other answer would be
very welcome.

-Clay


On Thu, Apr 25, 2013 at 5:14 AM, Tanstaafl <tanstaafl@libertytrek.org>wrote:

> Hello,
>
> I'm totally new to LVM snapshots. I've have read the FAQ and docs and
> searched the list archives and can't find an answer to my question...
>
> I know that you have to quiesce SQL databases using their own native tools
> if you want to have a consistent snapshot of the raw db files, but what
> about other programs like postfix or dovecot that are constantly (on a busy
> server) writing to disk? Do you need to stop these, take the snapshot, then
> restart them? Or will the filesystem itself handle this (similar to how VSS
> works on windows)?
>
> I'm fairly certain the answer is no, I don't have to worry about these
> kinds of programs, only SQL databases.
>
> I engage a script that simply performs a native dump of my databases
> immediately preceding the snapshot (my db's are very small and the dumps
> only take a few seconds, and this just seems much simpler to me) and places
> these files into a sql_dumps directory on the filesystem that will be
> snapshotted so these will be included in my backups, so am not worried
> about them being in a consistent state.
>
> Thanks in advance...
>
> Charles
>
> ______________________________**_________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/**mailman/listinfo/linux-lvm<https://www.redhat.com/mailman/listinfo/linux-lvm>
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-**HOWTO/<http://tldp.org/HOWTO/LVM-HOWTO/>
>

--047d7b2e4d32613d0f04db30c045
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I love this question. =A0I always thought the only way to=
=A0guarantee=A0a consistent snap of a block was to unmount it before taking=
 the snap, mostly just cause of un-fsynced data in the page cache. =A0Any o=
ther answer would be very welcome.<div>
<br></div><div>-Clay</div></div><div class=3D"gmail_extra"><br><br><div cla=
ss=3D"gmail_quote">On Thu, Apr 25, 2013 at 5:14 AM, Tanstaafl <span dir=3D"=
ltr">&lt;<a href=3D"mailto:tanstaafl@libertytrek.org" target=3D"_blank">tan=
staafl@libertytrek.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hello,<br>
<br>
I&#39;m totally new to LVM snapshots. I&#39;ve have read the FAQ and docs a=
nd searched the list archives and can&#39;t find an answer to my question..=
.<br>
<br>
I know that you have to quiesce SQL databases using their own native tools =
if you want to have a consistent snapshot of the raw db files, but what abo=
ut other programs like postfix or dovecot that are constantly (on a busy se=
rver) writing to disk? Do you need to stop these, take the snapshot, then r=
estart them? Or will the filesystem itself handle this (similar to how VSS =
works on windows)?<br>

<br>
I&#39;m fairly certain the answer is no, I don&#39;t have to worry about th=
ese kinds of programs, only SQL databases.<br>
<br>
I engage a script that simply performs a native dump of my databases immedi=
ately preceding the snapshot (my db&#39;s are very small and the dumps only=
 take a few seconds, and this just seems much simpler to me) and places the=
se files into a sql_dumps directory on the filesystem that will be snapshot=
ted so these will be included in my backups, so am not worried about them b=
eing in a consistent state.<br>

<br>
Thanks in advance...<br>
<br>
Charles<br>
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

--047d7b2e4d32613d0f04db30c045--
