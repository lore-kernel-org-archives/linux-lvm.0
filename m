Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FF71174A7
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2017 03:49:25 +0000 (UTC)
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A1C381229
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2017 03:49:23 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id b65so5741256wrd.0
	for <linux-lvm@redhat.com>; Sun, 13 Aug 2017 20:49:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALm7yL3gMJ6Aech3juPbP+5nK-nOZr1H6PZBdsf-hP6-vrzwqA@mail.gmail.com>
References: <CALm7yL3gMJ6Aech3juPbP+5nK-nOZr1H6PZBdsf-hP6-vrzwqA@mail.gmail.com>
From: Mark Mielke <mark.mielke@gmail.com>
Date: Sun, 13 Aug 2017 23:49:21 -0400
Message-ID: <CALm7yL0ePnQh04ztPDzTOoGgTpDLUbcfKY6tPh_gDF3jay3V5Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary="f403045d56f64d78530556ae8cb0"
Subject: Re: [linux-lvm] LVM archive management ( /etc/lvm/archives) expiry
 / retention misbehaves after index #100, 000.
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

--f403045d56f64d78530556ae8cb0
Content-Type: text/plain; charset="UTF-8"

I opened this Bugzilla issue for tracking purposes:

https://bugzilla.redhat.com/show_bug.cgi?id=1481085

On Sun, Aug 13, 2017 at 8:05 AM, Mark Mielke <mark.mielke@gmail.com> wrote:

> I searched around for this a bit, and although other users may have hit
> this, I didn't find a good explanation offered. I suspect the users clean
> it up manually and then it disappears for another 2 years. I hope this
> message will get captured by Google, and help somebody else out. Also, I
> hope to have some discussion about this as it seems like an easily
> preventable problem.
>
> The archive file names are generated like:
>
>                 if (dm_snprintf(archive_name, sizeof(archive_name),
>                                  "%s/%s_%05u-%d.vg",
>                                  dir, vg->name, ix, rnum) < 0) {
>
> The directory scanning code that loads the archive file names into memory
> recognizes a problem, although it isn't explicit about what the problem is:
>
>         /* Sort fails beyond 5-digit indexes */
>         if ((count = scandir(dir, &dirent, NULL, alphasort)) < 0) {
>                 log_error("Couldn't scan the archive directory (%s).",
> dir);
>                 return 0;
>         }
>
> The file names encode the index like "00000". The sorting code uses
> "alphasort", which will only work properly as long as the index stays
> within 5 digits. As soon as it exceeds 5 digits, it begins to sort the
> "100000" to the beginning, and "99999" to the end. Then, new archives seems
> to *all* be "100000". We had some 40,000 indexes with "100000" before we
> noticed. And, because the index is followed by a random number, it would
> only expire a few of the "100000" before it would hit one that was younger
> than the 30 days retention period set by default. When I reduced the
> retention period to 7 days, it expired only about 12 archive files of
> 40,000 archive files. This behaviour is probably due to random number
> distribution ensuring that there are always some recent records near 0?
>
> This issue eventually affects everyone, although obviously the people that
> use features like snapshots more frequently (we use it every 15 minutes,
> across multiple volumes) will hit it sooner,
>
> There are a few fixes possible... Probably, "alphasort" should not be used
> at all, but a context aware sort should be used, that can filter and sort
> as it goes, decoding the index correctly as a number, and comparing it as a
> number. Then, if performance is desirable, and scalability, it would be
> ideal if it did it in a single pass, and buffering only the minimum needed
> to expire the correct archive files.
>
> We hit this on RHEL 7.2. I wasn't surprised to find it in RHEL 7.2, but I
> was surprised that it still exists on "master". "git blame" says this has
> been an issue since 2002:
>
> 5be981bab5 (Alasdair Kergon  2002-05-07 12:47:11 +0000 139)     /* Sort
> fails beyond 5-digit indexes */
> 59d6420b9a (Joe Thornber     2002-02-08 11:58:18 +0000 140)     if ((count
> = scandir(dir, &dirent, NULL, alphasort)) < 0) {
> b8f47d5f69 (Alasdair Kergon  2009-07-15 20:02:46 +0000 141)
> log_error("Couldn't scan the archive directory (%s).", dir);
> 952d12a5f5 (Alasdair Kergon  2002-01-09 19:16:48 +0000 142)
> return 0;
> 952d12a5f5 (Alasdair Kergon  2002-01-09 19:16:48 +0000 143)     }
>
> Ouch... :-)
>
> For anybody that does hit this.... Prune the archive files with index <
> 100000 is effective. It starts counting from 100000, and you now have 9X
> more life before it will happen again... :-)
>
> --
> Mark Mielke <mark.mielke@gmail.com>
>
>


-- 
Mark Mielke <mark.mielke@gmail.com>

--f403045d56f64d78530556ae8cb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I opened this Bugzilla issue for tracking purposes:<div><b=
r></div><div><a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D14810=
85">https://bugzilla.redhat.com/show_bug.cgi?id=3D1481085</a><br></div></di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Aug 13,=
 2017 at 8:05 AM, Mark Mielke <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.=
mielke@gmail.com" target=3D"_blank">mark.mielke@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>I searched aro=
und for this a bit, and although other users may have hit this, I didn&#39;=
t find a good explanation offered. I suspect the users clean it up manually=
 and then it disappears for another 2 years. I hope this message will get c=
aptured by Google, and help somebody else out. Also, I hope to have some di=
scussion about this as it seems like an easily preventable problem.</div><d=
iv><br></div><div>The archive file names are generated like:<br></div><div>=
<br></div><div><div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dm_snprintf(archive_name, sizeof=
(archive_name),</font></div><div><font face=3D"monospace, monospace">=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s/%s_%05u-%<a href=3D"http://d=
.vg" target=3D"_blank">d.vg</a>&quot;,</font></div><div><font face=3D"monos=
pace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dir, vg-&gt;n=
ame, ix, rnum) &lt; 0) {</font></div></div><div><br></div><div>The director=
y scanning code that loads the archive file names into memory recognizes a =
problem, although it isn&#39;t explicit about what the problem is:</div><di=
v><br></div><div><div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Sort fails beyond 5-digit indexes */</font></div><div><font f=
ace=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((count =3D sca=
ndir(dir, &amp;dirent, NULL, alphasort)) &lt; 0) {</font></div><div><font f=
ace=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 log_error(&quot;Couldn&#39;t scan the archive directory (%s).&qu=
ot;, dir);</font></div><div><font face=3D"monospace, monospace">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;</font></div><div><f=
ont face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 }</font></div=
><div><br></div></div><div>The file names encode the index like &quot;00000=
&quot;. The sorting code uses &quot;alphasort&quot;, which will only work p=
roperly as long as the index stays within 5 digits. As soon as it exceeds 5=
 digits, it begins to sort the &quot;100000&quot; to the beginning, and &qu=
ot;99999&quot; to the end. Then, new archives seems to *all* be &quot;10000=
0&quot;. We had some 40,000 indexes with &quot;100000&quot; before we notic=
ed. And, because the index is followed by a random number, it would only ex=
pire a few of the &quot;100000&quot; before it would hit one that was young=
er than the 30 days retention period set by default. When I reduced the ret=
ention period to 7 days, it expired only about 12 archive files of 40,000 a=
rchive files. This behaviour is probably due to random number distribution =
ensuring that there are always some recent records near 0?</div><div><br></=
div><div>This issue eventually affects everyone, although obviously the peo=
ple that use features like snapshots more frequently (we use it every 15 mi=
nutes, across multiple volumes) will hit it sooner,=C2=A0</div><div><br></d=
iv><div>There are a few fixes possible... Probably, &quot;alphasort&quot; s=
hould not be used at all, but a context aware sort should be used, that can=
 filter and sort as it goes, decoding the index correctly as a number, and =
comparing it as a number. Then, if performance is desirable, and scalabilit=
y, it would be ideal if it did it in a single pass, and buffering only the =
minimum needed to expire the correct archive files.</div><div><br></div><di=
v>We hit this on RHEL 7.2. I wasn&#39;t surprised to find it in RHEL 7.2, b=
ut I was surprised that it still exists on &quot;master&quot;. &quot;git bl=
ame&quot; says this has been an issue since 2002:</div><div><br></div><div>=
<div><font face=3D"monospace, monospace">5be981bab5 (Alasdair Kergon =C2=A0=
2002-05-07 12:47:11 +0000 139) =C2=A0 =C2=A0 /* Sort fails beyond 5-digit i=
ndexes */</font></div><div><font face=3D"monospace, monospace">59d6420b9a (=
Joe Thornber =C2=A0 =C2=A0 2002-02-08 11:58:18 +0000 140) =C2=A0 =C2=A0 if =
((count =3D scandir(dir, &amp;dirent, NULL, alphasort)) &lt; 0) {</font></d=
iv><div><font face=3D"monospace, monospace">b8f47d5f69 (Alasdair Kergon =C2=
=A02009-07-15 20:02:46 +0000 141) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 log_error(&quot;Couldn&#39;t scan the archive directory (%s).&quot;, dir);=
</font></div><div><font face=3D"monospace, monospace">952d12a5f5 (Alasdair =
Kergon =C2=A02002-01-09 19:16:48 +0000 142) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0;</font></div><div><font face=3D"monospace, monospace">9=
52d12a5f5 (Alasdair Kergon =C2=A02002-01-09 19:16:48 +0000 143) =C2=A0 =C2=
=A0 }</font></div></div><div><br></div><div>Ouch... :-)</div><div><br></div=
><div>For anybody that does hit this.... Prune the archive files with index=
 &lt; 100000 is effective. It starts counting from 100000, and you now have=
 9X more life before it will happen again... :-)</div><span class=3D"HOEnZb=
"><font color=3D"#888888"><div><br></div>-- <br><div class=3D"m_-7646247125=
242464055gmail_signature">Mark Mielke &lt;<a href=3D"mailto:mark.mielke@gma=
il.com" target=3D"_blank">mark.mielke@gmail.com</a>&gt;<br><br></div>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">Mark Mielke &lt;<a =
href=3D"mailto:mark.mielke@gmail.com" target=3D"_blank">mark.mielke@gmail.c=
om</a>&gt;<br><br></div>
</div>

--f403045d56f64d78530556ae8cb0--
