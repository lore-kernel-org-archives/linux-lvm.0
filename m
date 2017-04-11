Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 776AA8069D
	for <linux-lvm@redhat.com>; Tue, 11 Apr 2017 09:42:29 +0000 (UTC)
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04D87C04B92E
	for <linux-lvm@redhat.com>; Tue, 11 Apr 2017 09:42:28 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id r16so72346571ioi.2
	for <linux-lvm@redhat.com>; Tue, 11 Apr 2017 02:42:27 -0700 (PDT)
MIME-Version: 1.0
From: Roger Morton <ttguy1@gmail.com>
Date: Tue, 11 Apr 2017 19:42:26 +1000
Message-ID: <CAC=a5kwVOFjzaBR208s=GSmE7u0TMihhdLxjYRS-pzej9C8oqw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a1148d5d4e1e816054ce0e8a1
Subject: [linux-lvm] root: Failed query for merging percentage. Aborting
	merge
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

--001a1148d5d4e1e816054ce0e8a1
Content-Type: text/plain; charset=UTF-8

Thanks for the reply Zdenek,

So just to make sure I have this correct - you think that my merge was
probably working just fine and that all I needed was patience.
I just needed to wait until the merge completed?

An answer on http://serverfault.com/questions/559649/see-progress-
of-lvm-merge tells me that

" lvs -a: Data% columns will go down to 0% while merging  "

So here is my  lvs -a - Data% is nothing on root now. So I guess that means
it has completed.

god@new-desktop:~$ sudo lvs -a
 LV                 VG         Attr       LSize    Pool Origin Data%  Meta%
 Move Log Cpy%Sync Convert
 home_lv            kubuntu-vg rwi-aor--- 1000.00g
                                   100.00
 root               kubuntu-vg owi-aor---   50.00g
                                   100.00


And in fact today I can create a new snapshot of root. So the merge has
completed - I guess.

So really what was that error that told me "Aborting merge" ?  You are
telling me that it did not abort the merge. It was just doing it in the
back ground?  I would humbly suggest that this message be changed!!
Because "Aborting merge" sure sounds like the system is giving up on doing
the merge.  Which causes concerns to the joe shmo user like me.

On Mon, Apr 10, 2017 at 8:54 PM, Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Dne 9.4.2017 v 09:17 Roger Morton napsal(a):
>
>> I wanted to merge a old snap shot (root_snap10) of my root file system
>> back
>> into root.
>>
>>
>>     LV          VG         Attr       LSize    Pool Origin Data%  Meta%
>> Move
>> Log Cpy%Sync Convert
>>   home_lv     kubuntu-vg rwi-aor--- 1000.00g
>>  100.00
>>   root        kubuntu-vg owi-aor---   50.00g
>>  100.00
>>   root_snap10 kubuntu-vg swi-a-s---   50.00g      root   28.42
>>   root_snap14 kubuntu-vg swi-a-s---   50.00g      root   0.00
>>
>>
> In genernal -
>
>
> Once the merge IS started -  you see immediately 'the merged state' and
> the
> blocks are moved in background (they are moved back from COW to origin -
> while you already see a device in 'merged-state').
>
> While the merge IS happening you can't merge another LV.
>
> So you need to wait till merge of snap10 is finished (0%).
>
>
>> sudo lvcreate -s -n root_snap10b -L 50G /dev/kubuntu-vg/root
>>   Snapshots of an origin that has a merging snapshot is not supported
>>
>> So the system still thinks   /dev/kubuntu-vg/root is in the middle of
>> merging.
>> Which worries me - my root file system might be in some half and half
>> state
>> between two different snapshots
>>
>
>
> As said there is never 'half and half state' - this would clearly never
> work ;) you can't see  old & new data mixed at the same time.
>
>
> Regards
>
>
> Zdenek
>
>
>
>

--001a1148d5d4e1e816054ce0e8a1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">Thanks for the=
 reply Zdenek,<div><br></div><div>So just to make sure I have this correct =
- you think that my merge was probably working just fine and that all I nee=
ded was patience.=C2=A0</div><div>I just needed to wait until the merge com=
pleted?</div><div><br></div><div>An answer on=C2=A0<a href=3D"http://server=
fault.com/questions/559649/see-progress-of-lvm-merge" target=3D"_blank">htt=
p://serverfault.com/<wbr>questions/559649/see-progress-<wbr>of-lvm-merge</a=
> tells me that</div><div><br></div><div>&quot;=C2=A0<span class=3D"m_-4660=
664052726125901gmail-comment-copy" style=3D"font-size:13px;margin:0px;paddi=
ng:0px;border:0px;color:rgb(36,39,41);font-family:arial,&quot;helvetica neu=
e&quot;,helvetica,sans-serif"><code style=3D"margin:0px;padding:1px 5px;bor=
der:0px;font-family:consolas,menlo,monaco,&quot;lucida console&quot;,&quot;=
liberation mono&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream vera san=
s mono&quot;,&quot;courier new&quot;,monospace,sans-serif;background-color:=
rgb(239,240,241)">lvs -a</code>: Data% columns will go down to 0% while mer=
ging</span><span style=3D"font-size:13px;color:rgb(36,39,41);font-family:ar=
ial,&quot;helvetica neue&quot;,helvetica,sans-serif">=C2=A0</span>=C2=A0&qu=
ot;</div><div><br></div><div>So here is my =C2=A0<span style=3D"color:rgb(0=
,0,0);font-family:monospace">lvs -a</span><span style=3D"color:rgb(0,0,0);f=
ont-family:monospace">=C2=A0- Data% is nothing on root now. So I guess that=
 means it has completed.</span></div><div><span style=3D"color:rgb(0,0,0);f=
ont-family:monospace"><br></span></div><div><span style=3D"font-family:mono=
space"><span style=3D"color:rgb(0,0,0)">god@new-desktop:~$ sudo lvs -a
</span><br><span class=3D""> =C2=A0LV =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VG =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Attr =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0LSize =C2=A0=C2=A0=C2=A0Pool Origin Data% =C2=A0Meta% =C2=A0Move Log Cpy=
%Sync Convert
<br> =C2=A0home_lv =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0kubuntu-vg rwi-aor--- 1000.00g =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0100.00 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>=C2=A0root =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kubuntu-vg owi-aor--- =
=C2=A0=C2=A050.00g =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0100.00=C2=A0</span></span></div><div><span style=3D"font-family=
:monospace"><br></span></div><div><span style=3D"font-family:monospace"><br=
></span></div><div><font face=3D"monospace">And in fact today I can create =
a new snapshot of root. So the merge has completed - I guess.</font></div><=
div><span style=3D"font-family:monospace"><br></span></div><div><span style=
=3D"font-family:monospace">So really what was that error that told me &quot=
;</span><span style=3D"font-family:monospace,monospace;font-size:12.8px">Ab=
orting merge</span><span style=3D"font-family:monospace">&quot; ?=C2=A0 You=
 are telling me that it did not abort the merge. It was just doing it in th=
e back ground?=C2=A0 I would humbly suggest that this message be changed!!=
=C2=A0 Because &quot;</span><span style=3D"font-family:monospace,monospace;=
font-size:12.8px">Aborting merge</span><span style=3D"font-family:monospace=
">&quot; sure sounds like the system is giving up on doing the merge.=C2=A0=
 Which causes concerns to the joe shmo user like me. =C2=A0=C2=A0</span></d=
iv></div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Mon, Apr 10, 2017 at 8:54 PM, Zdenek Kab=
elac <span dir=3D"ltr">&lt;<a href=3D"mailto:zkabelac@redhat.com" target=3D=
"_blank">zkabelac@redhat.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Dne 9.4.2017 v 09:17 Roger Morton napsal(a):<span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I wanted to merge a old snap shot (root_snap10) of my root file system back=
<br>
into root.<br>
<br>
<br>
=C2=A0 =C2=A0 LV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VG=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Attr=C2=A0 =C2=A0 =C2=A0 =C2=A0LSize=C2=A0 =C2=A0 Pool Origin =
Data%=C2=A0 Meta%=C2=A0 Move<br>
Log Cpy%Sync Convert<br>
=C2=A0 home_lv=C2=A0 =C2=A0 =C2=A0kubuntu-vg rwi-aor--- 1000.00g<br>
=C2=A0100.00<br>
=C2=A0 root=C2=A0 =C2=A0 =C2=A0 =C2=A0 kubuntu-vg owi-aor---=C2=A0 =C2=A050=
.00g<br>
=C2=A0100.00<br>
=C2=A0 root_snap10 kubuntu-vg swi-a-s---=C2=A0 =C2=A050.00g=C2=A0 =C2=A0 =
=C2=A0 root=C2=A0 =C2=A028.42<br>
=C2=A0 root_snap14 kubuntu-vg swi-a-s---=C2=A0 =C2=A050.00g=C2=A0 =C2=A0 =
=C2=A0 root=C2=A0 =C2=A00.00<br>
<br>
</blockquote>
<br></span>
In genernal -<br>
<br>
<br>
Once the merge IS started -=C2=A0 you see immediately &#39;the merged state=
&#39; and=C2=A0 the<br>
blocks are moved in background (they are moved back from COW to origin -<br=
>
while you already see a device in &#39;merged-state&#39;).<br>
<br>
While the merge IS happening you can&#39;t merge another LV.<br>
<br>
So you need to wait till merge of snap10 is finished (0%).<span><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
sudo lvcreate -s -n root_snap10b -L 50G /dev/kubuntu-vg/root<br>
=C2=A0 Snapshots of an origin that has a merging snapshot is not supported<=
br>
<br>
So the system still thinks=C2=A0 =C2=A0/dev/kubuntu-vg/root is in the middl=
e of merging.<br>
Which worries me - my root file system might be in some half and half state=
<br>
between two different snapshots<br>
</blockquote>
<br>
<br></span>
As said there is never &#39;half and half state&#39; - this would clearly n=
ever work ;) you can&#39;t see=C2=A0 old &amp; new data mixed at the same t=
ime.<br>
<br>
<br>
Regards<span class=3D"m_-4660664052726125901HOEnZb"><font color=3D"#888888"=
><br>
<br>
<br>
Zdenek<br>
<br>
<br>
<br>
</font></span></blockquote></div><br></div>
</div></div></div><br></div>

--001a1148d5d4e1e816054ce0e8a1--
