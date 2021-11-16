Return-Path: <SRS0=Ks00=QF=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACC8C433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 18 Nov 2021 07:30:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 468D661269
	for <linux-lvm@archiver.kernel.org>; Thu, 18 Nov 2021 07:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 468D661269
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637220613;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=XH8ap8bOKnmPflplXfX/ipPgbPIYxUUaPj5XUa8r4ns=;
	b=JdClV/1TNObNu3o/IA/nr+dGiomAO+rN2msVrcKuD4rrFc87H20VONndbVLZmIjBheXm6s
	jkiTeDMCNjcYGktrOJ2hZBHVzh4w86Y1H7xVtqCq8iA47byttMlCJosT7BfakGPHpTd2FR
	/A2nT0NXl63MKkL+MCtZTWsReS+d2nU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-x72hOT5NNmCOuz48O8zPhg-1; Thu, 18 Nov 2021 02:30:09 -0500
X-MC-Unique: x72hOT5NNmCOuz48O8zPhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E8951006AA1;
	Thu, 18 Nov 2021 07:30:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3FD360BF1;
	Thu, 18 Nov 2021 07:29:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 733CE180BAD1;
	Thu, 18 Nov 2021 07:29:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AGHfPKW024506 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 16 Nov 2021 12:41:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 679C340CFD10; Tue, 16 Nov 2021 17:41:25 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 620FD40CFD0A
	for <linux-lvm@redhat.com>; Tue, 16 Nov 2021 17:41:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 416FD802A5E
	for <linux-lvm@redhat.com>; Tue, 16 Nov 2021 17:41:25 +0000 (UTC)
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
	[209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-252-5tESXuSTOqmAUNOURJFa6g-1; Tue, 16 Nov 2021 12:41:23 -0500
X-MC-Unique: 5tESXuSTOqmAUNOURJFa6g-1
Received: by mail-yb1-f200.google.com with SMTP id
	v7-20020a25ab87000000b005c2130838beso33344461ybi.0
	for <linux-lvm@redhat.com>; Tue, 16 Nov 2021 09:41:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=UrlmwaVUpmv0tZ6XCRrznSVHB6EazPH9SGgH26+BhE4=;
	b=QIlWTXqyGsoyklvASfpLh+jLSTEfTQX22yRhFwH0yNCNsCnIdz9wwXrcgK8kayAN1k
	bJRPUGCPZnLBo98dSrXORHwf6Ijrn0jW8eVy0kk44o26Ugf+R8XYdXWiZWajdsqa0S/Z
	87rEvCL43aNSMmGuluHa91v69knrQiKLYWmcJ/ZKm53mF9bclviF92BwkUIJRMy/emth
	TeT7cBYHRVwVA0ak90i5Y4Zl6QczYUvZHWR+jVHSjLBQhVBSzIMwKs6LqmzF4nsauvYY
	tvUZ2keAyWFdlydLmE5zIGfAW9aZbOCYfwciBNLf5hsVt05y2RdacSSu/szEdaMhaAg3
	ALKA==
X-Gm-Message-State: AOAM533StfJT2dX3cWBSmTlAlrqFmKbLt1HH8O64CS5iBXejy3LcokhR
	O/Dk8RjW8s3gyJisTp2e724zJXKICkcLRk7x8tV68awNzC90IOv05d39pKeGBlVnZ+s+ZKcMY/S
	RURzTzmB27Zo+swFD0JOs1CTF3VrX/gMf
X-Received: by 2002:a25:e752:: with SMTP id e79mr9876540ybh.193.1637084482912; 
	Tue, 16 Nov 2021 09:41:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvoMT8nYydWql45rqn1QJK+HK9YZXC0hPtDhkJx+6J2tiuG9dupBp+t80gNsweTAO/SRI6KG1/AU2+amKtYK0=
X-Received: by 2002:a25:e752:: with SMTP id e79mr9876493ybh.193.1637084482623; 
	Tue, 16 Nov 2021 09:41:22 -0800 (PST)
MIME-Version: 1.0
References: <1495660C-B6EF-4315-8599-F79F7B6CCF73@icloud.com>
	<20211103152558.7670fa10@desk>
	<530F35A9-87FD-4850-BB9E-0E22857F178C@icloud.com>
	<446C99D5-736F-405A-A75C-7F37F746CE51@icloud.com>
In-Reply-To: <446C99D5-736F-405A-A75C-7F37F746CE51@icloud.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Date: Tue, 16 Nov 2021 18:41:11 +0100
Message-ID: <CAM23VxrzaV6KULRM3CqrZxXvHKPc08wsyRvPJ7Pf_xOT13pwqg@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 18 Nov 2021 02:28:37 -0500
Subject: Re: [linux-lvm] Replace Drive in RAID6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0721924016072025201=="

--===============0721924016072025201==
Content-Type: multipart/alternative; boundary="0000000000000df2e405d0eb6fce"

--0000000000000df2e405d0eb6fce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 8, 2021 at 8:08 AM Adam Puleo <adam.puleo@icloud.com> wrote:

> Hello Everyone,
>

Hi,
for starters, which kernel/distro is this?

Also, all layout changes on RaidLVs require activated ones.



>
> Since the sub-LV #0 has errored, LVM will not let me activate the logical
> volume.
>
> Is there a way to remap the #0 sub-LV to the replaced disk or resizing th=
e
> RAID6 to one less disk?
>

Each of the RAID6 SubLV pairs has an internal id and all data and parity
(P+Q syndromes) have been stored in a rotating pattern  >  no to the
remapping part.

Also no to the resize, as it'd need a fully operational radi6, thus
repairing the RaidLV is needed.

As mentioned, '"lvchange --rebuild ..." is inadequate to repair RaidLVs
with broken/lost PVs, "lvchange --repair $RaidLV" is.

In order to diagnose why your raid6 LV now fails to activate via "lvchange
-ay --activationmode degraded $RaidLV" which is the proper way to go about
it,
can you please describe any/all updating steps you took after the drive
failed rendering your raid6 LV degraded?  Please don't change anything
until you made
that transparent so that we keep chances to fix this...

FYI:
"lvconvert --(repair|replace) ..." difference is the former repairing
RaidLVs with failed PVs by allocating space on different, accessible PVs
hence causing the RaidLV to become fully operational after rebuilding all
missing block content by using parity stored on the remaining rimage SubLVs
vs. the latter allowing to replace mappings to intact PVs by remapping the
RAID SubLV pair to different ones (e.g. faster or less contended PVs).

Thanks,
Heinz



>
> Thank you,
> -Adam
>
>
> On Nov 4, 2021, at 7:21 PM, Adam Puleo <adam.puleo@icloud.com> wrote:
>
> Hello Andreas,
>
> After deactivating each of the individual rmage and rmeta volumes I
> receive this error:
> # lvchange -a y --activationmode degraded vg_data/lv_data
>  device-mapper: reload ioctl on  (253:12) failed: Invalid argument
>
> In messages I see the following errors:
> Nov  4 19:19:43 nas kernel: device-mapper: raid: Failed to read superbloc=
k
> of device at position 0
> Nov  4 19:19:43 nas kernel: device-mapper: raid: New device injected into
> existing raid set without 'delta_disks' or 'rebuild' parameter specified
> Nov  4 19:19:43 nas kernel: device-mapper: table: 253:12: raid: Unable to
> assemble array: Invalid superblocks
> Nov  4 19:19:43 nas kernel: device-mapper: ioctl: error adding target to
> table
>
> Am I not adding the new drive to the RAID correctly? I first did a
> pvcreate and then a vgextend.
>
> I was using the =E2=80=94rebuild option because I know which physical dri=
ve is
> bad. In the lvmraid man page it says =E2=80=94repair might not know which=
 is the
> correct block to use so to use =E2=80=94rebuild.
>
> Thank you,
> -Adam
>
>
>
> On Nov 3, 2021, at 7:25 AM, Andreas Schr=C3=A4gle <linux-lvm@ajs124.de> w=
rote:
>
> On Tue, 2 Nov 2021 22:56:18 -0700
> Adam Puleo <adam.puleo@icloud.com> wrote:
>
> > Hello,
> >
> > One of my drives failed in my RAID6 and I=E2=80=99m trying to replace i=
t without
> success.
> >
> > I=E2=80=99m trying to rebuild the failed drive (/dev/sda): lvchange --r=
ebuild
> /dev/sda vg_data
> >
> > But I=E2=80=99m receiving the error: vg_data/lv_data must be active to =
perform
> this operation.
> >
> > I have tried to activate the logical volume without success.
> >
> > How do I go about activating the volume so that I can rebuild the faile=
d
> drive?
> >
> > Thanks,
> > -Adam
> >
> > # lvs -a -o name,segtype,devices
> > LV                       Type   Devices
>
> > lv_data                  raid6
> lv_data_rimage_0(0),lv_data_rimage_1(0),lv_data_rimage_2(0),lv_data_rimag=
e_3(0),lv_data_rimage_4(0)
> > [lv_data_rimage_0]       error
>
> > [lv_data_rimage_1]       linear /dev/sdc1(1)
>
> > [lv_data_rimage_2]       linear /dev/sdb1(1)
>
> > [lv_data_rimage_3]       linear /dev/sdf1(1)
>
> > [lv_data_rimage_4]       linear /dev/sde1(2)
>
> > [lv_data_rmeta_0]        error
>
> > [lv_data_rmeta_1]        linear /dev/sdc1(0)
>
> > [lv_data_rmeta_2]        linear /dev/sdb1(0)
>
> > [lv_data_rmeta_3]        linear /dev/sdf1(0)
>
> > [lv_data_rmeta_4]        linear /dev/sde1(0)
>
> >
> > # lvs -a
> > LV                       VG            Attr       LSize   Pool Origin
> Data%  Meta%  Move Log Cpy%Sync Convert
> > lv_data                  vg_data       rwi---r--- 990.00g
>
> > [lv_data_rimage_0]       vg_data       vwi-a-r-r- 330.00g
>
> > [lv_data_rimage_1]       vg_data       Iwi-a-r-r- 330.00g
>
> > [lv_data_rimage_2]       vg_data       Iwi-a-r-r- 330.00g
>
> > [lv_data_rimage_3]       vg_data       Iwi-a-r-r- 330.00g
>
> > [lv_data_rimage_4]       vg_data       Iwi-a-r-r- 330.00g
>
> > [lv_data_rmeta_0]        vg_data       ewi-a-r-r-   4.00m
>
> > [lv_data_rmeta_1]        vg_data       ewi-a-r-r-   4.00m
>
> > [lv_data_rmeta_2]        vg_data       ewi-a-r-r-   4.00m
>
> > [lv_data_rmeta_3]        vg_data       ewi-a-r-r-   4.00m
>
> > [lv_data_rmeta_4]        vg_data       ewi-a-r-r-   4.00m
>
> >
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://listman.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> Hello Adam,
>
> how exactly have you tried to activate the LV so far?
>
> lvchange with --activationmode degraded should work, no?
>
> Also, are you sure that --rebuild is the correct operation?
>
> man 7 lvmraid suggest you might want --repair or --replace instead.
>
> Best Regards
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--0000000000000df2e405d0eb6fce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T24gTW9uLCBOb3YgOCwgMjAyMSBhdCA4OjA4
IEFNIEFkYW0gUHVsZW8gJmx0OzxhIGhyZWY9Im1haWx0bzphZGFtLnB1bGVvQGljbG91ZC5jb20i
PmFkYW0ucHVsZW9AaWNsb3VkLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48ZGl2IGNsYXNz
PSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFy
Z2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwy
MDQpO3BhZGRpbmctbGVmdDoxZXgiPkhlbGxvIEV2ZXJ5b25lLDxicj48L2Jsb2NrcXVvdGU+PGRp
dj48YnI+PC9kaXY+PGRpdj5IaSw8L2Rpdj48ZGl2PmZvciBzdGFydGVycywgd2hpY2jCoGtlcm5l
bC9kaXN0cm8gaXMgdGhpcz88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFsc28sIGFsbCBsYXlv
dXQgY2hhbmdlc8Kgb24gUmFpZExWcyByZXF1aXJlIGFjdGl2YXRlZCBvbmVzLjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigy
MDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+DQo8YnI+DQpTaW5jZSB0aGUgc3ViLUxWICMw
IGhhcyBlcnJvcmVkLCBMVk0gd2lsbCBub3QgbGV0IG1lIGFjdGl2YXRlIHRoZSBsb2dpY2FsIHZv
bHVtZS48YnI+DQo8YnI+DQpJcyB0aGVyZSBhIHdheSB0byByZW1hcCB0aGUgIzAgc3ViLUxWIHRv
IHRoZSByZXBsYWNlZCBkaXNrIG9yIHJlc2l6aW5nIHRoZSBSQUlENiB0byBvbmUgbGVzcyBkaXNr
Pzxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5FYWNoIG9mIHRoZSBSQUlENiBT
dWJMViBwYWlyc8KgaGFzIGFuIGludGVybmFsIGlkIGFuZCBhbGwgZGF0YSBhbmQgcGFyaXR5IChQ
K1Egc3luZHJvbWVzKSBoYXZlIGJlZW4gc3RvcmVkIGluIGEgcm90YXRpbmcgcGF0dGVybsKgICZn
dDvCoCBubyB0byB0aGUgcmVtYXBwaW5nIHBhcnQuPGJyPjxicj5BbHNvIG5vIHRvwqB0aGUgcmVz
aXplLCBhcyBpdCYjMzk7ZCBuZWVkIGEgZnVsbHkgb3BlcmF0aW9uYWwgcmFkaTYsIHRodXMgcmVw
YWlyaW5nIHRoZSBSYWlkTFYgaXMgbmVlZGVkLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QXMg
bWVudGlvbmVkLCAmIzM5OyZxdW90O2x2Y2hhbmdlIC0tcmVidWlsZCAuLi4mcXVvdDsgaXMgaW5h
ZGVxdWF0ZSB0byByZXBhaXIgUmFpZExWcyB3aXRoIGJyb2tlbi9sb3N0IFBWcywgJnF1b3Q7bHZj
aGFuZ2UgLS1yZXBhaXIgJFJhaWRMViZxdW90OyBpcy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PkluIG9yZGVyIHRvIGRpYWdub3NlwqB3aHkgeW91ciByYWlkNiBMViBub3cgZmFpbHMgdG8gYWN0
aXZhdGUgdmlhICZxdW90O2x2Y2hhbmdlIC1heSAtLWFjdGl2YXRpb25tb2RlIGRlZ3JhZGVkICRS
YWlkTFYmcXVvdDsgd2hpY2ggaXMgdGhlIHByb3BlciB3YXkgdG8gZ28gYWJvdXQgaXQsPGJyPmNh
biB5b3UgcGxlYXNlIGRlc2NyaWJlIGFueS9hbGwgdXBkYXRpbmcgc3RlcHMgeW91IHRvb2sgYWZ0
ZXIgdGhlIGRyaXZlIGZhaWxlZCByZW5kZXJpbmcgeW91ciByYWlkNiBMViBkZWdyYWRlZD/CoCBQ
bGVhc2UgZG9uJiMzOTt0IGNoYW5nZSBhbnl0aGluZyB1bnRpbCB5b3UgbWFkZTxicj50aGF0IHRy
YW5zcGFyZW50wqBzbyB0aGF0IHdlIGtlZXAgY2hhbmNlcyB0byBmaXggdGhpcy4uLsKgPC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5GWUk6PGJyPiZxdW90O2x2Y29udmVydCAtLShyZXBhaXJ8cmVw
bGFjZSkgLi4uJnF1b3Q7IGRpZmZlcmVuY2UgaXMgdGhlIGZvcm1lciByZXBhaXJpbmcgUmFpZExW
cyB3aXRoIGZhaWxlZCBQVnMgYnkgYWxsb2NhdGluZyBzcGFjZSBvbiBkaWZmZXJlbnQsIGFjY2Vz
c2libGUgUFZzIGhlbmNlIGNhdXNpbmcgdGhlIFJhaWRMViB0byBiZWNvbWUgZnVsbHkgb3BlcmF0
aW9uYWwgYWZ0ZXIgcmVidWlsZGluZyBhbGwgbWlzc2luZyBibG9jayBjb250ZW50IGJ5IHVzaW5n
IHBhcml0eSBzdG9yZWQgb24gdGhlIHJlbWFpbmluZyByaW1hZ2UgU3ViTFZzIHZzLiB0aGUgbGF0
dGVyIGFsbG93aW5nIHRvIHJlcGxhY2UgbWFwcGluZ3MgdG8gaW50YWN0IFBWcyBieSByZW1hcHBp
bmcgdGhlIFJBSUQgU3ViTFYgcGFpciB0byBkaWZmZXJlbnQgb25lcyAoZS5nLiBmYXN0ZXIgb3Ig
bGVzcyBjb250ZW5kZWQgUFZzKS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rcyw8L2Rp
dj48ZGl2PkhlaW56PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj7CoDwvZGl2PjxibG9ja3F1b3Rl
IGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3Jk
ZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxi
cj4NClRoYW5rIHlvdSw8YnI+DQotQWRhbTxicj4NCjxicj4NCjxicj4NCk9uIE5vdiA0LCAyMDIx
LCBhdCA3OjIxIFBNLCBBZGFtIFB1bGVvICZsdDs8YSBocmVmPSJtYWlsdG86YWRhbS5wdWxlb0Bp
Y2xvdWQuY29tIiB0YXJnZXQ9Il9ibGFuayI+YWRhbS5wdWxlb0BpY2xvdWQuY29tPC9hPiZndDsg
d3JvdGU6PGJyPg0KPGJyPg0KSGVsbG8gQW5kcmVhcyw8YnI+DQo8YnI+DQpBZnRlciBkZWFjdGl2
YXRpbmcgZWFjaCBvZiB0aGUgaW5kaXZpZHVhbCBybWFnZSBhbmQgcm1ldGEgdm9sdW1lcyBJIHJl
Y2VpdmUgdGhpcyBlcnJvcjo8YnI+DQojIGx2Y2hhbmdlIC1hIHkgLS1hY3RpdmF0aW9ubW9kZSBk
ZWdyYWRlZCB2Z19kYXRhL2x2X2RhdGE8YnI+DQrCoGRldmljZS1tYXBwZXI6IHJlbG9hZCBpb2N0
bCBvbsKgICgyNTM6MTIpIGZhaWxlZDogSW52YWxpZCBhcmd1bWVudDxicj4NCjxicj4NCkluIG1l
c3NhZ2VzIEkgc2VlIHRoZSBmb2xsb3dpbmcgZXJyb3JzOjxicj4NCk5vdsKgIDQgMTk6MTk6NDMg
bmFzIGtlcm5lbDogZGV2aWNlLW1hcHBlcjogcmFpZDogRmFpbGVkIHRvIHJlYWQgc3VwZXJibG9j
ayBvZiBkZXZpY2UgYXQgcG9zaXRpb24gMDxicj4NCk5vdsKgIDQgMTk6MTk6NDMgbmFzIGtlcm5l
bDogZGV2aWNlLW1hcHBlcjogcmFpZDogTmV3IGRldmljZSBpbmplY3RlZCBpbnRvIGV4aXN0aW5n
IHJhaWQgc2V0IHdpdGhvdXQgJiMzOTtkZWx0YV9kaXNrcyYjMzk7IG9yICYjMzk7cmVidWlsZCYj
Mzk7IHBhcmFtZXRlciBzcGVjaWZpZWQ8YnI+DQpOb3bCoCA0IDE5OjE5OjQzIG5hcyBrZXJuZWw6
IGRldmljZS1tYXBwZXI6IHRhYmxlOiAyNTM6MTI6IHJhaWQ6IFVuYWJsZSB0byBhc3NlbWJsZSBh
cnJheTogSW52YWxpZCBzdXBlcmJsb2Nrczxicj4NCk5vdsKgIDQgMTk6MTk6NDMgbmFzIGtlcm5l
bDogZGV2aWNlLW1hcHBlcjogaW9jdGw6IGVycm9yIGFkZGluZyB0YXJnZXQgdG8gdGFibGU8YnI+
DQo8YnI+DQpBbSBJIG5vdCBhZGRpbmcgdGhlIG5ldyBkcml2ZSB0byB0aGUgUkFJRCBjb3JyZWN0
bHk/IEkgZmlyc3QgZGlkIGEgcHZjcmVhdGUgYW5kIHRoZW4gYSB2Z2V4dGVuZC48YnI+DQo8YnI+
DQpJIHdhcyB1c2luZyB0aGUg4oCUcmVidWlsZCBvcHRpb24gYmVjYXVzZSBJIGtub3cgd2hpY2gg
cGh5c2ljYWwgZHJpdmUgaXMgYmFkLiBJbiB0aGUgbHZtcmFpZCBtYW4gcGFnZSBpdCBzYXlzIOKA
lHJlcGFpciBtaWdodCBub3Qga25vdyB3aGljaCBpcyB0aGUgY29ycmVjdCBibG9jayB0byB1c2Ug
c28gdG8gdXNlIOKAlHJlYnVpbGQuPGJyPg0KPGJyPg0KVGhhbmsgeW91LDxicj4NCi1BZGFtPGJy
Pg0KPGJyPg0KPGJyPg0KPGJyPg0KT24gTm92IDMsIDIwMjEsIGF0IDc6MjUgQU0sIEFuZHJlYXMg
U2NocsOkZ2xlICZsdDs8YSBocmVmPSJtYWlsdG86bGludXgtbHZtQGFqczEyNC5kZSIgdGFyZ2V0
PSJfYmxhbmsiPmxpbnV4LWx2bUBhanMxMjQuZGU8L2E+Jmd0OyB3cm90ZTo8YnI+DQo8YnI+DQpP
biBUdWUsIDIgTm92IDIwMjEgMjI6NTY6MTggLTA3MDA8YnI+DQpBZGFtIFB1bGVvICZsdDs8YSBo
cmVmPSJtYWlsdG86YWRhbS5wdWxlb0BpY2xvdWQuY29tIiB0YXJnZXQ9Il9ibGFuayI+YWRhbS5w
dWxlb0BpY2xvdWQuY29tPC9hPiZndDsgd3JvdGU6PGJyPg0KPGJyPg0KJmd0OyBIZWxsbyw8YnI+
DQomZ3Q7IDxicj4NCiZndDsgT25lIG9mIG15IGRyaXZlcyBmYWlsZWQgaW4gbXkgUkFJRDYgYW5k
IEnigJltIHRyeWluZyB0byByZXBsYWNlIGl0IHdpdGhvdXQgc3VjY2Vzcy48YnI+DQomZ3Q7IDxi
cj4NCiZndDsgSeKAmW0gdHJ5aW5nIHRvIHJlYnVpbGQgdGhlIGZhaWxlZCBkcml2ZSAoL2Rldi9z
ZGEpOiBsdmNoYW5nZSAtLXJlYnVpbGQgL2Rldi9zZGEgdmdfZGF0YTxicj4NCiZndDsgPGJyPg0K
Jmd0OyBCdXQgSeKAmW0gcmVjZWl2aW5nIHRoZSBlcnJvcjogdmdfZGF0YS9sdl9kYXRhIG11c3Qg
YmUgYWN0aXZlIHRvIHBlcmZvcm0gdGhpcyBvcGVyYXRpb24uPGJyPg0KJmd0OyA8YnI+DQomZ3Q7
IEkgaGF2ZSB0cmllZCB0byBhY3RpdmF0ZSB0aGUgbG9naWNhbCB2b2x1bWUgd2l0aG91dCBzdWNj
ZXNzLjxicj4NCiZndDsgPGJyPg0KJmd0OyBIb3cgZG8gSSBnbyBhYm91dCBhY3RpdmF0aW5nIHRo
ZSB2b2x1bWUgc28gdGhhdCBJIGNhbiByZWJ1aWxkIHRoZSBmYWlsZWQgZHJpdmU/PGJyPg0KJmd0
OyA8YnI+DQomZ3Q7IFRoYW5rcyw8YnI+DQomZ3Q7IC1BZGFtPGJyPg0KJmd0OyA8YnI+DQomZ3Q7
ICMgbHZzIC1hIC1vIG5hbWUsc2VndHlwZSxkZXZpY2VzPGJyPg0KJmd0OyBMVsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVHlwZcKgIMKgRGV2aWNlc8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIDxicj4NCiZndDsgbHZfZGF0YcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJhaWQ2
wqAgbHZfZGF0YV9yaW1hZ2VfMCgwKSxsdl9kYXRhX3JpbWFnZV8xKDApLGx2X2RhdGFfcmltYWdl
XzIoMCksbHZfZGF0YV9yaW1hZ2VfMygwKSxsdl9kYXRhX3JpbWFnZV80KDApPGJyPg0KJmd0OyBb
bHZfZGF0YV9yaW1hZ2VfMF3CoCDCoCDCoCDCoGVycm9ywqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7IFtsdl9kYXRhX3JpbWFnZV8xXcKgIMKgIMKgIMKgbGlu
ZWFyIC9kZXYvc2RjMSgxKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0OyBbbHZfZGF0YV9yaW1h
Z2VfMl3CoCDCoCDCoCDCoGxpbmVhciAvZGV2L3NkYjEoMSnCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4N
CiZndDsgW2x2X2RhdGFfcmltYWdlXzNdwqAgwqAgwqAgwqBsaW5lYXIgL2Rldi9zZGYxKDEpwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqA8YnI+DQomZ3Q7IFtsdl9kYXRhX3JpbWFnZV80XcKgIMKgIMKgIMKgbGlu
ZWFyIC9kZXYvc2RlMSgyKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0OyBbbHZfZGF0YV9ybWV0
YV8wXcKgIMKgIMKgIMKgIGVycm9ywqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqA8YnI+DQomZ3Q7IFtsdl9kYXRhX3JtZXRhXzFdwqAgwqAgwqAgwqAgbGluZWFyIC9kZXYvc2Rj
MSgwKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0OyBbbHZfZGF0YV9ybWV0YV8yXcKgIMKgIMKg
IMKgIGxpbmVhciAvZGV2L3NkYjEoMCnCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj4NCiZndDsgW2x2X2Rh
dGFfcm1ldGFfM13CoCDCoCDCoCDCoCBsaW5lYXIgL2Rldi9zZGYxKDApwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqA8YnI+DQomZ3Q7IFtsdl9kYXRhX3JtZXRhXzRdwqAgwqAgwqAgwqAgbGluZWFyIC9kZXYvc2Rl
MSgwKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7ICMgbHZzIC1hPGJyPg0K
Jmd0OyBMVsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgVkfCoCDCoCDCoCDCoCDC
oCDCoCBBdHRywqAgwqAgwqAgwqBMU2l6ZcKgIMKgUG9vbCBPcmlnaW4gRGF0YSXCoCBNZXRhJcKg
IE1vdmUgTG9nIENweSVTeW5jIENvbnZlcnQ8YnI+DQomZ3Q7IGx2X2RhdGHCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB2Z19kYXRhwqAgwqAgwqAgwqByd2ktLS1yLS0tIDk5MC4wMGfCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCA8YnI+DQomZ3Q7IFtsdl9kYXRhX3JpbWFnZV8wXcKgIMKgIMKgIMKgdmdf
ZGF0YcKgIMKgIMKgIMKgdndpLWEtci1yLSAzMzAuMDBnwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJy
Pg0KJmd0OyBbbHZfZGF0YV9yaW1hZ2VfMV3CoCDCoCDCoCDCoHZnX2RhdGHCoCDCoCDCoCDCoEl3
aS1hLXItci0gMzMwLjAwZ8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj4NCiZndDsgW2x2X2RhdGFf
cmltYWdlXzJdwqAgwqAgwqAgwqB2Z19kYXRhwqAgwqAgwqAgwqBJd2ktYS1yLXItIDMzMC4wMGfC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+DQomZ3Q7IFtsdl9kYXRhX3JpbWFnZV8zXcKgIMKgIMKg
IMKgdmdfZGF0YcKgIMKgIMKgIMKgSXdpLWEtci1yLSAzMzAuMDBnwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgPGJyPg0KJmd0OyBbbHZfZGF0YV9yaW1hZ2VfNF3CoCDCoCDCoCDCoHZnX2RhdGHCoCDCoCDC
oCDCoEl3aS1hLXItci0gMzMwLjAwZ8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj4NCiZndDsgW2x2
X2RhdGFfcm1ldGFfMF3CoCDCoCDCoCDCoCB2Z19kYXRhwqAgwqAgwqAgwqBld2ktYS1yLXItwqAg
wqA0LjAwbcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj4NCiZndDsgW2x2X2RhdGFfcm1ldGFfMV3C
oCDCoCDCoCDCoCB2Z19kYXRhwqAgwqAgwqAgwqBld2ktYS1yLXItwqAgwqA0LjAwbcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIDxicj4NCiZndDsgW2x2X2RhdGFfcm1ldGFfMl3CoCDCoCDCoCDCoCB2Z19k
YXRhwqAgwqAgwqAgwqBld2ktYS1yLXItwqAgwqA0LjAwbcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxi
cj4NCiZndDsgW2x2X2RhdGFfcm1ldGFfM13CoCDCoCDCoCDCoCB2Z19kYXRhwqAgwqAgwqAgwqBl
d2ktYS1yLXItwqAgwqA0LjAwbcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj4NCiZndDsgW2x2X2Rh
dGFfcm1ldGFfNF3CoCDCoCDCoCDCoCB2Z19kYXRhwqAgwqAgwqAgwqBld2ktYS1yLXItwqAgwqA0
LjAwbcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7
IDxicj4NCiZndDsgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X188YnI+DQomZ3Q7IGxpbnV4LWx2bSBtYWlsaW5nIGxpc3Q8YnI+DQomZ3Q7IDxhIGhyZWY9Im1h
aWx0bzpsaW51eC1sdm1AcmVkaGF0LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmxpbnV4LWx2bUByZWRo
YXQuY29tPC9hPjxicj4NCiZndDsgPGEgaHJlZj0iaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtbHZt
PC9hPjxicj4NCiZndDsgcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCA8YSBocmVmPSJodHRwOi8vdGxk
cC5vcmcvSE9XVE8vTFZNLUhPV1RPLyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy88L2E+PGJyPg0KPGJyPg0KSGVsbG8gQWRh
bSw8YnI+DQo8YnI+DQpob3cgZXhhY3RseSBoYXZlIHlvdSB0cmllZCB0byBhY3RpdmF0ZSB0aGUg
TFYgc28gZmFyPzxicj4NCjxicj4NCmx2Y2hhbmdlIHdpdGggLS1hY3RpdmF0aW9ubW9kZSBkZWdy
YWRlZCBzaG91bGQgd29yaywgbm8/PGJyPg0KPGJyPg0KQWxzbywgYXJlIHlvdSBzdXJlIHRoYXQg
LS1yZWJ1aWxkIGlzIHRoZSBjb3JyZWN0IG9wZXJhdGlvbj88YnI+DQo8YnI+DQptYW4gNyBsdm1y
YWlkIHN1Z2dlc3QgeW91IG1pZ2h0IHdhbnQgLS1yZXBhaXIgb3IgLS1yZXBsYWNlIGluc3RlYWQu
PGJyPg0KPGJyPg0KQmVzdCBSZWdhcmRzPGJyPg0KPGJyPg0KPGJyPg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+DQpsaW51eC1sdm0gbWFpbGluZyBs
aXN0PGJyPg0KPGEgaHJlZj0ibWFpbHRvOmxpbnV4LWx2bUByZWRoYXQuY29tIiB0YXJnZXQ9Il9i
bGFuayI+bGludXgtbHZtQHJlZGhhdC5jb208L2E+PGJyPg0KPGEgaHJlZj0iaHR0cHM6Ly9saXN0
bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1sdm0iIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtbHZtPC9hPjxicj4NCnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgPGEgaHJlZj0i
aHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy8iIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0
PSJfYmxhbmsiPmh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vPC9hPjxicj4NCjxicj4N
Cjxicj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJy
Pg0KbGludXgtbHZtIG1haWxpbmcgbGlzdDxicj4NCjxhIGhyZWY9Im1haWx0bzpsaW51eC1sdm1A
cmVkaGF0LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmxpbnV4LWx2bUByZWRoYXQuY29tPC9hPjxicj4N
CjxhIGhyZWY9Imh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbHZtIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3RtYW4u
cmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bTwvYT48YnI+DQpyZWFkIHRoZSBM
Vk0gSE9XLVRPIGF0IDxhIGhyZWY9Imh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vIiBy
ZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZN
LUhPV1RPLzwvYT48YnI+DQo8YnI+DQo8YnI+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXzxicj4NCmxpbnV4LWx2bSBtYWlsaW5nIGxpc3Q8YnI+DQo8YSBo
cmVmPSJtYWlsdG86bGludXgtbHZtQHJlZGhhdC5jb20iIHRhcmdldD0iX2JsYW5rIj5saW51eC1s
dm1AcmVkaGF0LmNvbTwvYT48YnI+DQo8YSBocmVmPSJodHRwczovL2xpc3RtYW4ucmVkaGF0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWx2bSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1s
dm08L2E+PGJyPg0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCA8YSBocmVmPSJodHRwOi8vdGxkcC5v
cmcvSE9XVE8vTFZNLUhPV1RPLyIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy88L2E+PC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2
Pg0K
--0000000000000df2e405d0eb6fce--

--===============0721924016072025201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============0721924016072025201==--

