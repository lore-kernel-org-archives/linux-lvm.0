Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FBDC433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 27 Dec 2021 22:21:42 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-crqxb28GPHWnd53izAajUw-1; Mon, 27 Dec 2021 17:21:37 -0500
X-MC-Unique: crqxb28GPHWnd53izAajUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BD831030C20;
	Mon, 27 Dec 2021 22:21:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B8DE5ED4A;
	Mon, 27 Dec 2021 22:21:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C1864CA9B;
	Mon, 27 Dec 2021 22:21:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BLGDDas016506 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 21 Dec 2021 11:13:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4D6A140CFD16; Tue, 21 Dec 2021 16:13:13 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4815E40CFD0A
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2021 16:13:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29DEE185A79C
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2021 16:13:13 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
	[209.85.219.182]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-231-JRUiqR5UNTuha6gpsUZwlw-1; Tue, 21 Dec 2021 11:13:11 -0500
X-MC-Unique: JRUiqR5UNTuha6gpsUZwlw-1
Received: by mail-yb1-f182.google.com with SMTP id v203so40246534ybe.6
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2021 08:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eG0aCSCKVly9M8LkAeoYKYEq7rUR+qcuMyNS28u7LXM=;
	b=LATQQHjpNy+2k5L0yNmc/YJJ9BMR6EVoOCzzGnDvWkkjezcfvrHBYXgKwN8A9eMCqs
	Pn6cApqS235tsOC0uUe5R3Xwn/JPuM7cJ+h4PttAPaDkc/3scmJzEJCY/On5f1MVD4kn
	Ddi8Ni+bcBGViF7E6efrQpuCJZxsEYb6PjEr9t7uneCSIAQEwxGU7fR6pe51+OFRKtNf
	Wpz8nP1hr5Z1JrW0LjFRb1qUYkQFH89rhHUDvAz8yeegFvSvPDbuYOBg2kyUHfEUaCWL
	3devxFXraSVD8S5MAFcV91UJQ+QI8gIo7MrN1McaFdjeC1gGkEvVIhBDZIq9YUXQFY0w
	pg+A==
X-Gm-Message-State: AOAM533M79vcDp0k+/4+OfnrNd7zy0EfJb6Tyzb8Om30XXtxMCzyBGCM
	9JZXWtvRrP9p4XT9MmAHzMacE/02EFQU7DQyPNHJYrRli8Q=
X-Google-Smtp-Source: ABdhPJyfEDTL8VFhL7gXe5suyx8b/Q5Qssin/svTiHE9Y6OrE+MkE6PDdFTLYcCZiy0UQNIUUCDFe5qaE2AIovzbJNk=
X-Received: by 2002:a25:748d:: with SMTP id p135mr5473438ybc.169.1640103190052;
	Tue, 21 Dec 2021 08:13:10 -0800 (PST)
MIME-Version: 1.0
References: <0026c26e-a5e0-272d-e5d6-739466cbd6b2@gmail.com>
	<89C3404F-E604-45DA-AEFD-200DCC89631D@gmail.com>
	<a9188fbf-5859-4406-7075-4a116bdc036f@gmail.com>
In-Reply-To: <a9188fbf-5859-4406-7075-4a116bdc036f@gmail.com>
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Date: Tue, 21 Dec 2021 17:12:59 +0100
Message-ID: <CACrcyfJW0UyEPmx6AXk_+X0N7hjR0ms2SLtXwaEtsafVUUvedA@mail.gmail.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 27 Dec 2021 17:20:46 -0500
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] how to convert a disk containing a snapshot to a
	snapshot lv?
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0515499136029823094=="

--===============0515499136029823094==
Content-Type: multipart/alternative; boundary="00000000000009c51f05d3aa4836"

--00000000000009c51f05d3aa4836
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for explaining all that details about how a snapshot is formatted on
the COW device.
I already know that part.

I am more interested in how the disk containing the COW data can be merged
back to an LV volume.
The second part only mentioned that it is possible, but not which steps are
involved.

As documented in the manual.
To split a snapshot from its origin (our words detach) one can use:
lvconvert --splitsnapshot vg/s1
Right?

To reverse that process, according to the manual; one can use:
lvconvert -s vg/s1
Right?

But as I mentioned before, this requires that the vg/s1 exists as an object
in the LVM metadata.
What if you are on a new server, that does not have vg/s1?
How to create that object or whatever you like to call this on the server?
The only way I got it is to use the
vgextend
lvcreate
lvconvert --splitsnapshot

And now reattach it, so that the actual merge can happen.
The object should exist now, so that the command: lvconvert -s vg/s1 can
work

Or how can the object vg/s1 be created so that it can be referenced to by
the lvconvert command?
The disk is formated as a COW device, and contains all of the data.
So how hard can it be to just reattach that volume to an empty or existing
LV volume on the server?

If it works on same server, why can't it work on any other new servers, as
the COW device contains ALL the data needed (we make sure it contains all
the data)

If you want to give it a try, just create a snapshot on a specific device
And change all the blocks on the origin, there you are, you now have a cow
device containing all data needed.
How to move this snapshot device to another server, reattach it to an empty
lv volume as a snapshot.
lvconvert -s, command requires an argument of an existing snapshot volume
name.
But there is no snapshot on the new server, so it can't re-attach the
volume.
So what procedures should be invoked to create just the detached references
in LVM, so that the lvconver -s command can work?

Regards Tomas

Den tis 21 dec. 2021 kl 16:30 skrev Zdenek Kabelac <zdenek.kabelac@gmail.co=
m
>:

> Dne 21. 12. 21 v 15:44 Tomas Dalebj=C3=B6rk napsal(a):
> > hi
> >
> > I think I didn=E2=80=99t explain this clear enough
> > Allthe lvm data is present in the snapshot that I provision from our
> backup system
> > I can guarantee that!
> >
> > If I just mount that snapshot from our backup system, it works perfectl=
y
> well
> >
> > so we don=E2=80=99t need the origin volumes in other way than copying b=
ack to it
> > we just need to reanimate it as a cow volume
> > mentioning that all data has been changed
> > the cow is just referencing to the origin location, so no problem there
> > All our data is in the cow volume, not just the changes
> >
> > just to compare
> > if you change just 1 byte on every chunksize in the origin volume, than
> the snapshot will contain all data, plus some meta data etc.
> > That is what I talk about here.
> > So how do I retach this volume to a new server?
> >
> > as the only argument acceptable argument by the lvconvert is vg/s1 ?
> >
> > That assumes that vg/s1 is present
> > so how to make it present?
>
> Hi
>
> As said in my previous post - the 'format' of data stored on COW storage
> (which is the 'real' meaning of snapshot LV) does NOT in any way resemble=
s
> the
> 'normal' LV.
>
> So the COW LV could be really ONLY use together with 'snapshot' target.
>
> The easiest way how to 'copy' this snapshot to normal LV is like this:
>
>
> lvcreate -L size  -n newLV  vg
>
> dd if=3D/dev/vg/snapshotLV  of=3D/dev/vg/newLV  bs=3D512K
>
>
> (so with 'DD' you copy data in 'correct' format)
>
> You cannot convert snapshot LV to 'normal' LV in any other way then to
> merge
> this snapshot LV into your origin LV  (so origin is gone)
> (lvconvert --merge....)
>
> You can also  'split' snapshot COW LV and 'reattach' such snapshot to
> other LV
> - but this requires rather good knowledge about whole functioning of this
> snapshotting - so you know what can you do and what can you expect. But
> I'd
> likely recommend  'dd'.
> You cannot use 'splitted' COW LV for i.e. filesystem - as it contains
> 'mixed'
> snapshot metadata and snapshot blocks.
>
> Old snapshot meaning was - to take 'time consistent' snapshot of LV which
> then
> you can use for i.e. taking backup....
>
> Regards
>
> Zdenek
>

--00000000000009c51f05d3aa4836
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for explaining all that details about how a snapsho=
t is formatted=C2=A0on the COW device.<div>I already know that part.</div><=
div><br></div><div>I am more interested in how the disk containing the COW =
data can be merged back to an LV volume.</div><div>The second part only men=
tioned that it is possible, but not which steps are involved.</div><div><br=
></div><div>As documented in the manual.</div><div>To split a snapshot from=
 its origin (our words detach) one can use:</div><div>lvconvert --splitsnap=
shot=C2=A0vg/s1</div><div>Right?</div><div><br></div><div>To reverse that p=
rocess, according to the manual; one can use:</div><div>lvconvert -s vg/s1<=
/div><div>Right?</div><div><br></div><div>But as I mentioned before, this r=
equires that the vg/s1 exists as an object in the LVM metadata.</div><div>W=
hat=C2=A0if you are on a new server, that does not have vg/s1?</div><div>Ho=
w to create that object or whatever you like to call this on the server?</d=
iv><div>The only way I got it is to use the=C2=A0</div><div>vgextend</div><=
div>lvcreate=C2=A0</div><div>lvconvert --splitsnapshot</div><div><br></div>=
<div>And now reattach it, so that the actual merge can happen.</div><div>Th=
e object should exist now, so that the command: lvconvert -s vg/s1 can work=
</div><div><br></div><div>Or how can the object vg/s1 be created so that it=
 can be referenced to by the lvconvert command?</div><div>The disk is forma=
ted=C2=A0as a COW device, and contains all of the data.</div><div>So how ha=
rd can it be to just reattach that volume to an empty or existing LV volume=
 on the server?</div><div><br></div><div>If it works on same server, why ca=
n&#39;t it work on any other new servers, as the COW device contains ALL th=
e data needed (we make sure it contains all the data)</div><div><br></div><=
div>If you want to give it a try, just create a snapshot on a specific devi=
ce</div><div>And change all the blocks on the origin, there you are, you no=
w have a cow device containing all data needed.</div><div>How to move this =
snapshot device to another server, reattach it to an empty lv volume as a s=
napshot.</div><div>lvconvert -s, command requires an argument of an existin=
g snapshot volume name.</div><div>But there is no snapshot on the new serve=
r, so it can&#39;t re-attach the volume.</div><div>So what procedures shoul=
d be invoked to create just the detached references in LVM, so that the lvc=
onver -s command can work?</div><div><br></div><div>Regards Tomas</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den =
tis 21 dec. 2021 kl 16:30 skrev Zdenek Kabelac &lt;<a href=3D"mailto:zdenek=
.kabelac@gmail.com">zdenek.kabelac@gmail.com</a>&gt;:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Dne 21. 12. 21 v 15:44 Tomas Dalebj=
=C3=B6rk napsal(a):<br>
&gt; hi<br>
&gt; <br>
&gt; I think I didn=E2=80=99t explain this clear enough<br>
&gt; Allthe lvm data is present in the snapshot that I provision from our b=
ackup system<br>
&gt; I can guarantee that!<br>
&gt; <br>
&gt; If I just mount that snapshot from our backup system, it works perfect=
ly well<br>
&gt; <br>
&gt; so we don=E2=80=99t need the origin volumes in other way than copying =
back to it<br>
&gt; we just need to reanimate it as a cow volume<br>
&gt; mentioning that all data has been changed<br>
&gt; the cow is just referencing to the origin location, so no problem ther=
e<br>
&gt; All our data is in the cow volume, not just the changes<br>
&gt; <br>
&gt; just to compare<br>
&gt; if you change just 1 byte on every chunksize in the origin volume, tha=
n the snapshot will contain all data, plus some meta data etc.<br>
&gt; That is what I talk about here.<br>
&gt; So how do I retach this volume to a new server?<br>
&gt; <br>
&gt; as the only argument acceptable argument by the lvconvert is vg/s1 ?<b=
r>
&gt; <br>
&gt; That assumes that vg/s1 is present<br>
&gt; so how to make it present?<br>
<br>
Hi<br>
<br>
As said in my previous post - the &#39;format&#39; of data stored on COW st=
orage <br>
(which is the &#39;real&#39; meaning of snapshot LV) does NOT in any way re=
sembles the <br>
&#39;normal&#39; LV.<br>
<br>
So the COW LV could be really ONLY use together with &#39;snapshot&#39; tar=
get.<br>
<br>
The easiest way how to &#39;copy&#39; this snapshot to normal LV is like th=
is:<br>
<br>
<br>
lvcreate -L size=C2=A0 -n newLV=C2=A0 vg<br>
<br>
dd if=3D/dev/vg/snapshotLV=C2=A0 of=3D/dev/vg/newLV=C2=A0 bs=3D512K<br>
<br>
<br>
(so with &#39;DD&#39; you copy data in &#39;correct&#39; format)<br>
<br>
You cannot convert snapshot LV to &#39;normal&#39; LV in any other way then=
 to merge <br>
this snapshot LV into your origin LV=C2=A0 (so origin is gone)<br>
(lvconvert --merge....)<br>
<br>
You can also=C2=A0 &#39;split&#39; snapshot COW LV and &#39;reattach&#39; s=
uch snapshot to other LV <br>
- but this requires rather good knowledge about whole functioning of this <=
br>
snapshotting - so you know what can you do and what can you expect. But I&#=
39;d <br>
likely recommend=C2=A0 &#39;dd&#39;.<br>
You cannot use &#39;splitted&#39; COW LV for i.e. filesystem - as it contai=
ns &#39;mixed&#39; <br>
snapshot metadata and snapshot blocks.<br>
<br>
Old snapshot meaning was - to take &#39;time consistent&#39; snapshot of LV=
 which then <br>
you can use for i.e. taking backup....<br>
<br>
Regards<br>
<br>
Zdenek<br>
</blockquote></div>

--00000000000009c51f05d3aa4836--

--===============0515499136029823094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============0515499136029823094==--

