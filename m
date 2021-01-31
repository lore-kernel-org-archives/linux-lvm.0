Return-Path: <SRS0=OZI1=HC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D694C433E0
	for <linux-lvm@archiver.kernel.org>; Sun, 31 Jan 2021 23:55:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7063164E24
	for <linux-lvm@archiver.kernel.org>; Sun, 31 Jan 2021 23:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7063164E24
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stoffel.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-PBN6yaX9NtOZMRivQc9TwQ-1; Sun, 31 Jan 2021 18:55:03 -0500
X-MC-Unique: PBN6yaX9NtOZMRivQc9TwQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2031190A7A0;
	Sun, 31 Jan 2021 23:54:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED9F35D9C2;
	Sun, 31 Jan 2021 23:54:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 38796180954D;
	Sun, 31 Jan 2021 23:54:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10VNsTTU009906 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 31 Jan 2021 18:54:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 897711111A4E; Sun, 31 Jan 2021 23:54:29 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84DAE1111A52
	for <linux-lvm@redhat.com>; Sun, 31 Jan 2021 23:54:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 971BF1875049
	for <linux-lvm@redhat.com>; Sun, 31 Jan 2021 23:54:25 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
	[172.104.24.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-346-9Vz96VEqMq-Df23mdYx1-w-1; Sun, 31 Jan 2021 18:54:22 -0500
X-MC-Unique: 9Vz96VEqMq-Df23mdYx1-w-1
Received: from quad.stoffel.org (068-116-170-226.res.spectrum.com
	[68.116.170.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 4761E20F36;
	Sun, 31 Jan 2021 18:47:30 -0500 (EST)
Received: by quad.stoffel.org (Postfix, from userid 1000)
	id A3CF6A6C0E; Sun, 31 Jan 2021 18:47:29 -0500 (EST)
MIME-Version: 1.0
Message-ID: <24599.16785.592980.828790@quad.stoffel.home>
Date: Sun, 31 Jan 2021 18:47:29 -0500
From: "John Stoffel" <john@stoffel.org>
To: jlpoole56@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <cb4d46f7-2c0c-330d-51bf-48c3b706b2d2@gmail.com>
References: <cb4d46f7-2c0c-330d-51bf-48c3b706b2d2@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10VNsTTU009906
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] 2.03 Volume readable by 2.02?
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>>>>> "John" =3D=3D John L Poole <jlpoole56@gmail.com> writes:

John> I am having problems with a kernel and/or initial ram file
John> system booting up in a Xen environment.

Do you have any logs of the error(s) when booting up?

Can you show us the configuration of your Xen guest and it's LVM
volumes, VG and PVs as well?  The more details the better.

I personally don't do Gentoo or Xen, so I can't help there.  But I can
ask you to post more details.  A boot log would be very helpful.


John> The guest virtual machine's root file system is on an lvm volume crea=
ted=20
John> in Debian.=A0 Dom0 is Debian.
John> lvm on Debian is: 2.03.02(2).

John> The guest virtual machine is in Gentoo and I have lvm=A0 2.02.187-r2=
=20
John> installed therein.=A0 I built my
John> kernel and initramfs against the 2.02 version of lvm.

John> My question: should tools of lvm v. 2.02.187 be able to read and acce=
ss=20
John> a volume created by 2.03.02?

John> Does the version change between 2.02 and 2.03 mean that the file syst=
em=20
John> created by 2.03 tools
John> may not be readable or accessible by 2.02 tools and libraries?=A0 I'm=
=20
John> doubting it, but asking.

John> Gentoo's highest version of lvm is 2.02.187-r2; Gentoo developers hav=
e=20
John> lvm 2.03 masked with the note:

John>  =A0=A0=A0=A0 [2.03] Needs LOTS of testing, broke boot on my laptop
John>  =A0=A0=A0=A0 in early attempts, maybe needs matching genkernel work?

John> source: https://packages.gentoo.org/packages/sys-fs/lvm2

John> Thank you,

John> John Poole

John> _______________________________________________
John> linux-lvm mailing list
John> linux-lvm@redhat.com
John> https://www.redhat.com/mailman/listinfo/linux-lvm
John> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

