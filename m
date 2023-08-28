Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D804C71153
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Aug 2023 15:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693236872;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=NVhDQKhHyBuASN6O2RXDJFjBciuAAUaPrqup57wIQiQ=;
	b=FIlLch3gVbkUvAwACOlcISVsuQknOKXxz9ZacikeLgdAKoYKlncP0UqpRevXMGAVyj9C0M
	QXVtGlixwybevEGKtvidnBQGPQAIB9n3MkAzu6S8vGPK+ejdLiB3rwCZQFpCZmy2y2gETr
	HkzLk7JUeWBkuzvhqJUDF3M/9CWU9WI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-khBqFsf7OvWeSkvyrQanpA-1; Mon, 28 Aug 2023 11:34:28 -0400
X-MC-Unique: khBqFsf7OvWeSkvyrQanpA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9E382A5956A;
	Mon, 28 Aug 2023 15:34:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72C55492C13;
	Mon, 28 Aug 2023 15:34:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1A51019465A8;
	Mon, 28 Aug 2023 15:34:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3B3DA1946587
 for <linux-lvm@listman.corp.redhat.com>; Mon, 28 Aug 2023 15:34:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0A0D72026D2A; Mon, 28 Aug 2023 15:34:17 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 017132026D68
 for <linux-lvm@redhat.com>; Mon, 28 Aug 2023 15:34:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC6128D40A6
 for <linux-lvm@redhat.com>; Mon, 28 Aug 2023 15:34:16 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-7ySeEcxTOZCStd1OEW1vzA-1; Mon, 28 Aug 2023 11:34:14 -0400
X-MC-Unique: 7ySeEcxTOZCStd1OEW1vzA-1
Received: from mail.gathman.org (wiki.gathman.org [IPv6:2001:470:8:809::1010])
 (authenticated bits=0)
 by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 37SErr31031707
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <linux-lvm@redhat.com>; Mon, 28 Aug 2023 10:53:57 -0400
Date: Mon, 28 Aug 2023 10:53:53 -0400 (EDT)
From: Stuart D Gathman <stuart@gathman.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CABh+8g5708fk_yJ_P-9Ne20ir+qjFV8BHj7tj6_HWamUdi55=Q@mail.gmail.com>
Message-ID: <f96fd13d-8fe5-cf49-82f-78186d1f6349@gathman.org>
References: <CABh+8g5708fk_yJ_P-9Ne20ir+qjFV8BHj7tj6_HWamUdi55=Q@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [linux-lvm] Swapping LLVM drive
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gathman.org
Content-Type: multipart/mixed;
 boundary="-1203360521-1342613128-1693234437=:31600"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1203360521-1342613128-1693234437=:31600
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.gathman.org id 37SErr31031707

On Sun, 27 Aug 2023, Roska Postit wrote:

> What is the most proper way to swap my 500GB SSD drive to the bigger 2TB =
SSD
> drive in the following LLVM configuration ?
>=20
> nvme0n1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0259:0 =C2=A0 =C2=A00 465=
,8G =C2=A00 disk =C2=A0
> =E2=94=9C=E2=94=80nvme0n1p1 =C2=A0 =C2=A0 =C2=A0 =C2=A0259:1 =C2=A0 =C2=
=A00 =C2=A0 512M =C2=A00 part =C2=A0/boot/efi
> =E2=94=9C=E2=94=80nvme0n1p2 =C2=A0 =C2=A0 =C2=A0 =C2=A0259:2 =C2=A0 =C2=
=A00 =C2=A0 488M =C2=A00 part =C2=A0/boot
> =E2=94=94=E2=94=80nvme0n1p3 =C2=A0 =C2=A0 =C2=A0 =C2=A0259:3 =C2=A0 =C2=
=A00 464,8G =C2=A00 part =C2=A0
> =C2=A0 =E2=94=9C=E2=94=80pc3--vg-root =C2=A0 254:0 =C2=A0 =C2=A00 463,8G =
=C2=A00 lvm =C2=A0 /
> =C2=A0 =E2=94=94=E2=94=80pc3--vg-swap_1 254:1 =C2=A0 =C2=A00 =C2=A0 980M =
=C2=A00 lvm =C2=A0 [SWAP]

Since you are not mirroring, just add the new drive.

If this is a laptop, and you can only have one drive, then I suggest
you mount the new drive via USB (note there are at least 2 kinds of
nvme interface and you have to get a matching USB enclosure).

Use dd to copy the partition table (this also often contains boot code)
to the new disk on USB.
Then use dd to copy the smaller partitions (efi,boot).=20
Now use cfdisk to delete the 3rd partition.=20
Expand the boot partition to 1G (you'll thank me later).
Allocate the entire rest of the disk to p3.
Create a new vg with a different name.  Allocate root and swap on
new VG the same sizes.
Take a snapshot of current root (delete swap on old drive since you
didn't leave yourself any room), and use partclone to efficiently
copy the filesystem over to new root.

Either a) edit grub and fstab on new drive to use new vg name  or
        b) boot from a live media to rename old and new vg or
        c) rename vg just before shutting down to remove drive -
           I think LVM can operate with dup VG name, but I've never
           navigated the details.

Swap drives after powerdown.

A modern filesystem like ext2, xfs, btrfs, etc can expand as you expand
the root LV.  Leave yourself some working room in the VG.
---1203360521-1342613128-1693234437=:31600
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

---1203360521-1342613128-1693234437=:31600--

