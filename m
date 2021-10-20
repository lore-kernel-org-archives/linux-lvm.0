Return-Path: <SRS0=7RWj=PJ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B792FC433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 21 Oct 2021 06:07:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1576560ED5
	for <linux-lvm@archiver.kernel.org>; Thu, 21 Oct 2021 06:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1576560ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-xltrdl8nP36tBFR9TaQKng-1; Thu, 21 Oct 2021 02:07:23 -0400
X-MC-Unique: xltrdl8nP36tBFR9TaQKng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2064B8030D2;
	Thu, 21 Oct 2021 06:07:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 021EC17C58;
	Thu, 21 Oct 2021 06:07:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AFE21819AC2;
	Thu, 21 Oct 2021 06:07:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KI1kB3027806 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 14:01:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D13440C1257; Wed, 20 Oct 2021 18:01:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38CDD400F3E5
	for <linux-lvm@redhat.com>; Wed, 20 Oct 2021 18:01:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 110D5185A79C
	for <linux-lvm@redhat.com>; Wed, 20 Oct 2021 18:01:46 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-15--joaRmeLMeCCaZVPrXgRrA-1; Wed, 20 Oct 2021 14:01:43 -0400
X-MC-Unique: -joaRmeLMeCCaZVPrXgRrA-1
Received: by mail-qk1-f181.google.com with SMTP id n66so3989571qkn.0
	for <linux-lvm@redhat.com>; Wed, 20 Oct 2021 11:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=uHefR/YTF5ydp7Jk27/zO+iES9uF5dZxiz04ufgq7Nk=;
	b=CaGwO9VFXIEcNElcZJx/FY1jHbnQfaNFBiL0VGEiNVCQ14Prr8Z/KivxmeNaPsVfqa
	840M0UbmPVpdNPkO/s497Lmv/Vl5uVRyPHCJFGv4xY6py8PtbY7Kx5VlYH3l3yNIlrmF
	sew1BHh58o153KBZ1yiiYPOjT36rZkZ3gWB/89qIsX3hjuTAFzq8jSSRT55uLCUjAyRT
	/5/dtO6QE4o6sg2prEzLfs4eVyVZNy3zTYb7A/ZtLX9vw1Qi+lVIroOIDLe7KxbsSXCF
	2mQw3fLWUzPHeldfMDBKjxKACPRSl1oUO1senE6ElM7xl5jgEhYi4JG4WE1peh69BoUq
	ujFg==
X-Gm-Message-State: AOAM531KSW6sndIclGHiO8IHfDGN5NBG0jyNDclgJQTULDrLV5PdvUoj
	1KAehQKvDX7UxmWSWXRpm8Wk3NyA1LG1VI7Oepg6iWE+
X-Google-Smtp-Source: ABdhPJzEuO7sE+aYIZ5xm/w5aFXVPyDcrDX+NpOoMtZZIL+h2Z4ccWumY56isgz810LrixnGLVU8GYPQ+r3Z7xYCnC4=
X-Received: by 2002:a37:aa0f:: with SMTP id t15mr452678qke.427.1634752901706; 
	Wed, 20 Oct 2021 11:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211018021719.GA16936@bdmcc-us.com>
	<CAAMCDedrphwa+RRr1PHLD0SXi8fEDM87zV82302T=twRa5qBZA@mail.gmail.com>
	<20211018194508.GC28815@bdmcc-us.com>
	<CAAMCDeeTwESRvs5jPNuTXn-q7Fse1xqAc+yd-0swjc7NrAyqAw@mail.gmail.com>
	<20211020133828.GE9096@bdmcc-us.com>
In-Reply-To: <20211020133828.GE9096@bdmcc-us.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Wed, 20 Oct 2021 13:01:30 -0500
Message-ID: <CAAMCDec9HehohCFxCXDd7d+5DVW1DuJ4KVY7Vu1J0x+6ZxUW=w@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 21 Oct 2021 02:06:26 -0400
Subject: Re: [linux-lvm] Recovering "broken" disk ( 17th )
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============4468917945705563584=="

--===============4468917945705563584==
Content-Type: multipart/alternative; boundary="0000000000000076b305cecc92b5"

--0000000000000076b305cecc92b5
Content-Type: text/plain; charset="UTF-8"

is the pv in the root device vg?  if not changing fstab to not mount the
missing  fs(es) should get it bootable.   I have a practice of putting
",nofail" on all non-root filesystems (ie defaults,nofail) since priority
#1 is getting the machine up and on the network after a reboot such that it
can be ssh'ed to and fixed as needed.

If it is not the root device then on the root device there should be
several prior archive copy in /etc/lvm/archive/<vgname>*, and maybe some
copies in /etc/lvm/backup.

In the vg backup file there will be a bunch of uuids, you want the specific
pv uuid and not the vg/lv uuids.  Each pv has a uuid and each lv has a uuid
and the vg has a uuid.

On Wed, Oct 20, 2021 at 8:39 AM Brian McCullough <bdmc@bdmcc-us.com> wrote:

> On Tue, Oct 19, 2021 at 05:06:37AM -0500, Roger Heflin wrote:
> > I would edit the vgconfig you dd'ed with an editor and make sure it looks
> > reasonable for what you think you had.
>
> It turns out, comparing the information that I pulled off of the drive
> with what I find in /etc/lvm/backup, that the first part of the vgconfig
> information is missing.  As I said in one of my messages, the
> information that I retrieved from the disk starts at 0x1200.  I don't
> know whether that is correct or not.  It does not appear to be a proper
> "backup" file, which I think it should be.
>
> I rebooted ( partially ) the machine and copied the vgconfig backup file
> from that, but am somewhat concerned, because I don't seem to be able to
> match the UUIDs.  The one that I seem to see in the vgconfig data that I
> pulled off of the drive vs what I got out of /etc/lvm/backup.  Maybe I
> am just mis-reading it.  I will continue my research for a bit.
>
>
>
>
> > When you do the pvcreate --uuid it won't use anything except the uuid
> info
> > so the rest may not need to be exactly right, if you have to do a
> > vgcfgrestore to get it to read the rest of the info will be used.
>
> Oh, thank you.   I did see that things got somewhat different on the
> target drive when I did "pvcreate --uuid --restorefile."  I got paranoid
> when I saw that, and re-copied the ddrestore file back to the target
> drive before I did anything else.   Should I do "pvcreate --uuid
> --norestorefile," instead?  Then, once it is back in the machine, do the
> pvscan and vgcfgrestore, and expect good things?
>
>
>
> > I have seen some weird disk controller failures that appeared to zero out
> > the first bit of the disk (enough to get the partition table, grub, and
> the
> > pv header depending on where the first partition starts).
>
> I APPEAR to have a partition table, containing an NTFS partition, an LVM
> partiton ( the one that I am concentrating on ) and a Linux partion.  I
> would have thought that it was all LVM, but my memory could easily be
> wrong.
>
>
>
> > You will need to reinstall grub if this was the bootable disk, since
> there
> > were 384 bytes of grub in the sector with the partition table that you
> know
> > are missing.
>
> Fortunately, this is all data, nothing to do with the boot sequence,
> except that the machine will not boot with the missing PV.
>
>
>
> Thank you,
> Brian
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

--0000000000000076b305cecc92b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>is the pv in the root device vg?=C2=A0 if not changin=
g fstab to not mount the missing=C2=A0 fs(es) should get it bootable.=C2=A0=
=C2=A0 I have a practice of putting &quot;,nofail&quot; on all non-root fil=
esystems (ie defaults,nofail) since priority #1 is getting the machine up a=
nd on the network after a reboot such that it can be ssh&#39;ed to and fixe=
d as needed.<br></div><div><br></div><div>If it is not the root device then=
 on the root device there should be several prior archive copy in /etc/lvm/=
archive/&lt;vgname&gt;*, and maybe some copies in /etc/lvm/backup.<br></div=
><div><br></div><div>In the vg backup file there will be a bunch of uuids, =
you want the specific pv uuid and not the vg/lv uuids.=C2=A0 Each pv has a =
uuid and each lv has a uuid and the vg has a uuid.<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 20,=
 2021 at 8:39 AM Brian McCullough &lt;<a href=3D"mailto:bdmc@bdmcc-us.com">=
bdmc@bdmcc-us.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Tue, Oct 19, 2021 at 05:06:37AM -0500, Roger Heflin wro=
te:<br>
&gt; I would edit the vgconfig you dd&#39;ed with an editor and make sure i=
t looks<br>
&gt; reasonable for what you think you had.<br>
<br>
It turns out, comparing the information that I pulled off of the drive<br>
with what I find in /etc/lvm/backup, that the first part of the vgconfig<br=
>
information is missing.=C2=A0 As I said in one of my messages, the<br>
information that I retrieved from the disk starts at 0x1200.=C2=A0 I don&#3=
9;t<br>
know whether that is correct or not.=C2=A0 It does not appear to be a prope=
r<br>
&quot;backup&quot; file, which I think it should be.<br>
<br>
I rebooted ( partially ) the machine and copied the vgconfig backup file<br=
>
from that, but am somewhat concerned, because I don&#39;t seem to be able t=
o<br>
match the UUIDs.=C2=A0 The one that I seem to see in the vgconfig data that=
 I<br>
pulled off of the drive vs what I got out of /etc/lvm/backup.=C2=A0 Maybe I=
<br>
am just mis-reading it.=C2=A0 I will continue my research for a bit.<br>
<br>
<br>
<br>
<br>
&gt; When you do the pvcreate --uuid it won&#39;t use anything except the u=
uid info<br>
&gt; so the rest may not need to be exactly right, if you have to do a<br>
&gt; vgcfgrestore to get it to read the rest of the info will be used.<br>
<br>
Oh, thank you.=C2=A0 =C2=A0I did see that things got somewhat different on =
the<br>
target drive when I did &quot;pvcreate --uuid --restorefile.&quot;=C2=A0 I =
got paranoid<br>
when I saw that, and re-copied the ddrestore file back to the target<br>
drive before I did anything else.=C2=A0 =C2=A0Should I do &quot;pvcreate --=
uuid<br>
--norestorefile,&quot; instead?=C2=A0 Then, once it is back in the machine,=
 do the<br>
pvscan and vgcfgrestore, and expect good things?<br>
<br>
<br>
<br>
&gt; I have seen some weird disk controller failures that appeared to zero =
out<br>
&gt; the first bit of the disk (enough to get the partition table, grub, an=
d the<br>
&gt; pv header depending on where the first partition starts).<br>
<br>
I APPEAR to have a partition table, containing an NTFS partition, an LVM<br=
>
partiton ( the one that I am concentrating on ) and a Linux partion.=C2=A0 =
I<br>
would have thought that it was all LVM, but my memory could easily be<br>
wrong.<br>
<br>
<br>
<br>
&gt; You will need to reinstall grub if this was the bootable disk, since t=
here<br>
&gt; were 384 bytes of grub in the sector with the partition table that you=
 know<br>
&gt; are missing.<br>
<br>
Fortunately, this is all data, nothing to do with the boot sequence,<br>
except that the machine will not boot with the missing PV.<br>
<br>
<br>
<br>
Thank you,<br>
Brian<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br>
</blockquote></div>

--0000000000000076b305cecc92b5--

--===============4468917945705563584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============4468917945705563584==--

