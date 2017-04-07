Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2B7F7F385
	for <linux-lvm@redhat.com>; Fri,  7 Apr 2017 22:24:19 +0000 (UTC)
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 165AA61D1D
	for <linux-lvm@redhat.com>; Fri,  7 Apr 2017 22:24:17 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id w204so1730059wmd.1
	for <linux-lvm@redhat.com>; Fri, 07 Apr 2017 15:24:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <fe625ba1be451139dd871982a24fb9ba@assyoma.it>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
From: Mark Mielke <mark.mielke@gmail.com>
Date: Fri, 7 Apr 2017 18:24:15 -0400
Message-ID: <CALm7yL1Qm4xanZ=tbLgC7B7KZ=dzLZtsTJXTd0rsEONxg0nqng@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a1146790cf72937054c9b15be
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
To: Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--001a1146790cf72937054c9b15be
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 7, 2017 at 5:12 AM, Gionatan Danti <g.danti@assyoma.it> wrote:

> Il 07-04-2017 10:19 Mark Mielke ha scritto:
>
>>
>> I found classic LVM snapshots to suffer terrible performance. I
>> switched to BTRFS as a result, until LVM thin pools became a real
>> thing, and I happily switched back.
>>
>
> So you are now on lvmthin? Can I ask on what pool/volume/filesystem size?


We use lvmthin in many areas... from Docker's dm-thinp driver, to XFS file
systems for PostgreSQL or other data that need multiple snapshots,
including point-in-time backup of certain snapshots. Then, multiple sizes.
I don't know that we have 8 TB anywhere right this second, but we are using
it in a variety of ranges from 20 GB to 4 TB.


>
>> I expect this depends on exactly what access patterns you have, how
>> many accesses will happen during the time the snapshot is held, and
>> whether you are using spindles or flash. Still, even with some attempt
>> to be objective and critical... I think I would basically never use
>> classic LVM snapshots for any purpose, ever.
>>
>
> Sure, but for nightly backups reduced performance should not be a problem.
> Moreover, increasing snapshot chunk size (eg: from default 4K to 64K) gives
> much faster write performance.
>


When you say "nightly", my experience is that processes are writing data
all of the time. If the backup takes 30 minutes to complete, then this is
30 minutes of writes that get accumulated, and subsequent performance
overhead of these writes.

But, we usually keep multiple hourly snapshots and multiply daily
snapshots, because we want the option to recover to different points in
time. With the classic LVM snapshot capability, I believe this is
essentially non-functional. While it can work with "1 short lived
snapshot", I don't think it works at all well for "3 hourly + 3 daily
snapshots".  Remember that each write to an area will require that area to
be replicated multiple times under classic LVM snapshots, before the
original write can be completed. Every additional snapshot is an additional
cost.



> I more concerned about lenghtly snapshot activation due to a big, linear
> CoW table that must be read completely...



I suspect this is a pre-optimization concern, in that you are concerned,
and you are theorizing about impact, but perhaps you haven't measured it
yourself, and if you did, you would find there was no reason to be
concerned. :-)

If you absolutely need a contiguous sequence of blocks for your drives,
because your I/O patterns benefit from this, or because your hardware has
poor seek performance (such as, perhaps a tape drive? :-) ), then classic
LVM snapshots would retain this ordering for the live copy, and the
snapshot could be as short lived as possible to minimize overhead to only
that time period.

But, in practice - I think the LVM authors of the thinpool solution
selected a default block size that would exhibit good behaviour on most
common storage solutions. You can adjust it, but in most cases I think I
don't bother, and just use the default. There is also the behaviour of the
systems in general to take into account in that even if you had a purely
contiguous sequence of blocks, your file system probably allocates files
all over the drive anyways. With XFS, I believe they do this for
concurrency, in that two different kernel threads can allocate new files
without blocking each other, because they schedule the writes to two
different areas of the disk, with separate inode tables.

So, I don't believe the contiguous sequence of blocks is normally a real
thing. Perhaps a security camera that is recording a 1+ TB video stream
might allocate contiguous, but basically nothing else does this.

To me, LVM thin volumes is the right answer to this problem. It's not
particularly new or novel either. Most "Enterprise" level storage systems
have had this capability for many years. At work, we use NetApp and they
take this to another level with their WAFL = Write-Anywhere-File-Layout.
For our private cloud solution based upon NetApp AFF 8080EX today, we have
disk shelves filled with flash drives, and NetApp is writing everything
"forwards", which extends the life of the flash drives, and allows us to
keep many snapshots of the data. But, it doesn't have to be flash to take
advantage of this. We also have large NetApp FAS 8080EX or 8060 with all
spindles, including 3.5" SATA disks. I was very happy to see this type of
technology make it back into LVM. I think this breathed new life into LVM,
and made it a practical solution for many new use cases beyond being just a
more flexible partition manager.


-- 
Mark Mielke <mark.mielke@gmail.com>

--001a1146790cf72937054c9b15be
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Apr 7, 2017 at 5:12 AM, Gionatan Danti <span dir=3D"ltr">&lt;<a href=3D=
"mailto:g.danti@assyoma.it" target=3D"_blank">g.danti@assyoma.it</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">Il 07-04-201=
7 10:19 Mark Mielke ha scritto:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
I found classic LVM snapshots to suffer terrible performance. I<br>
switched to BTRFS as a result, until LVM thin pools became a real<br>
thing, and I happily switched back.<br>
</blockquote>
<br></span>
So you are now on lvmthin? Can I ask on what pool/volume/filesystem size?</=
blockquote><div><br></div><div>We use lvmthin in many areas... from Docker&=
#39;s dm-thinp driver, to XFS file systems for PostgreSQL or other data tha=
t need multiple snapshots, including point-in-time backup of certain snapsh=
ots. Then, multiple sizes. I don&#39;t know that we have 8 TB anywhere righ=
t this second, but we are using it in a variety of ranges from 20 GB to 4 T=
B.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
I expect this depends on exactly what access patterns you have, how<br>
many accesses will happen during the time the snapshot is held, and<br>
whether you are using spindles or flash. Still, even with some attempt<br>
to be objective and critical... I think I would basically never use<br>
classic LVM snapshots for any purpose, ever.<br>
</blockquote>
<br></span>
Sure, but for nightly backups reduced performance should not be a problem. =
Moreover, increasing snapshot chunk size (eg: from default 4K to 64K) gives=
 much faster write performance.<br></blockquote><div><br></div><div><br></d=
iv><div>When you say &quot;nightly&quot;, my experience is that processes a=
re writing data all of the time. If the backup takes 30 minutes to complete=
, then this is 30 minutes of writes that get accumulated, and subsequent pe=
rformance overhead of these writes.</div><div><br></div><div>But, we usuall=
y keep multiple hourly snapshots and multiply daily snapshots, because we w=
ant the option to recover to different points in time. With the classic LVM=
 snapshot capability, I believe this is essentially non-functional. While i=
t can work with &quot;1 short lived snapshot&quot;, I don&#39;t think it wo=
rks at all well for &quot;3 hourly + 3 daily snapshots&quot;.=C2=A0 Remembe=
r that each write to an area will require that area to be replicated multip=
le times under classic LVM snapshots, before the original write can be comp=
leted. Every additional snapshot is an additional cost.</div><div><br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
I more concerned about lenghtly snapshot activation due to a big, linear Co=
W table that must be read completely...</blockquote></div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra"><br></div>I suspect this is =
a pre-optimization concern, in that you are concerned, and you are theorizi=
ng about impact, but perhaps you haven&#39;t measured it yourself, and if y=
ou did, you would find there was no reason to be concerned. :-)</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">If you absolutely=
 need a contiguous sequence of blocks for your drives, because your I/O pat=
terns benefit from this, or because your hardware has poor seek performance=
 (such as, perhaps a tape drive? :-) ), then classic LVM snapshots would re=
tain this ordering for the live copy, and the snapshot could be as short li=
ved as possible to minimize overhead to only that time period.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">But, in practice -=
 I think the LVM authors of the thinpool solution selected a default block =
size that would exhibit good behaviour on most common storage solutions. Yo=
u can adjust it, but in most cases I think I don&#39;t bother, and just use=
 the default. There is also the behaviour of the systems in general to take=
 into account in that even if you had a purely contiguous sequence of block=
s, your file system probably allocates files all over the drive anyways. Wi=
th XFS, I believe they do this for concurrency, in that two different kerne=
l threads can allocate new files without blocking each other, because they =
schedule the writes to two different areas of the disk, with separate inode=
 tables.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">So, I don&#39;t believe the contiguous sequence of blocks is normally a =
real thing. Perhaps a security camera that is recording a 1+ TB video strea=
m might allocate contiguous, but basically nothing else does this.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">To me, LVM thi=
n volumes is the right answer to this problem. It&#39;s not particularly ne=
w or novel either. Most &quot;Enterprise&quot; level storage systems have h=
ad this capability for many years. At work, we use NetApp and they take thi=
s to another level with their WAFL =3D Write-Anywhere-File-Layout. For our =
private cloud solution based upon NetApp AFF 8080EX today, we have disk she=
lves filled with flash drives, and NetApp is writing everything &quot;forwa=
rds&quot;, which extends the life of the flash drives, and allows us to kee=
p many snapshots of the data. But, it doesn&#39;t have to be flash to take =
advantage of this. We also have large NetApp FAS 8080EX or 8060 with all sp=
indles, including 3.5&quot; SATA disks. I was very happy to see this type o=
f technology make it back into LVM. I think this breathed new life into LVM=
, and made it a practical solution for many new use cases beyond being just=
 a more flexible partition manager.</div><div class=3D"gmail_extra"><br cle=
ar=3D"all"><div><br></div>-- <br><div class=3D"gmail_signature" data-smartm=
ail=3D"gmail_signature">Mark Mielke &lt;<a href=3D"mailto:mark.mielke@gmail=
.com" target=3D"_blank">mark.mielke@gmail.com</a>&gt;<br><br></div>
</div></div>

--001a1146790cf72937054c9b15be--
