Return-Path: <SRS0=W8c5=HE=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D433C433DB
	for <linux-lvm@archiver.kernel.org>; Tue,  2 Feb 2021 18:03:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35AA264E56
	for <linux-lvm@archiver.kernel.org>; Tue,  2 Feb 2021 18:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35AA264E56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stoffel.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-wD2jqqDIP2-PO8SIEf4mHA-1; Tue, 02 Feb 2021 13:03:08 -0500
X-MC-Unique: wD2jqqDIP2-PO8SIEf4mHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F9B2801AAF;
	Tue,  2 Feb 2021 18:03:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54B0F60C66;
	Tue,  2 Feb 2021 18:02:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FFA018095CB;
	Tue,  2 Feb 2021 18:02:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 112I2eYk022867 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 13:02:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 02E6B2166B2E; Tue,  2 Feb 2021 18:02:40 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1EE32166B2A
	for <linux-lvm@redhat.com>; Tue,  2 Feb 2021 18:02:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76ACD101A53F
	for <linux-lvm@redhat.com>; Tue,  2 Feb 2021 18:02:35 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
	[172.104.24.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-206-SVPOsRd5P4m6C1-nCMiwrA-1; Tue, 02 Feb 2021 13:02:33 -0500
X-MC-Unique: SVPOsRd5P4m6C1-nCMiwrA-1
Received: from quad.stoffel.org (068-116-170-226.res.spectrum.com
	[68.116.170.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id C45D1287B2;
	Tue,  2 Feb 2021 13:02:32 -0500 (EST)
Received: by quad.stoffel.org (Postfix, from userid 1000)
	id 1AC20A6C1A; Tue,  2 Feb 2021 13:02:32 -0500 (EST)
MIME-Version: 1.0
Message-ID: <24601.37816.31387.379244@quad.stoffel.home>
Date: Tue, 2 Feb 2021 13:02:32 -0500
From: "John Stoffel" <john@stoffel.org>
To: jlpoole56@gmail.com
In-Reply-To: <a3c43bd8-391b-cc7f-0ead-2e29dad11b3d@gmail.com>
References: <cb4d46f7-2c0c-330d-51bf-48c3b706b2d2@gmail.com>
	<24599.16785.592980.828790@quad.stoffel.home>
	<a3c43bd8-391b-cc7f-0ead-2e29dad11b3d@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 112I2eYk022867
X-loop: linux-lvm@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>>>>> "John" =3D=3D John L Poole <jlpoole56@gmail.com> writes:

John> Thank you, John Stoffel, for your kind offer to help.=A0 I am
John> faced with several alternatives at this juncture and feel that
John> enlisting general help would be counter-productive.=A0 I don't
John> want you to spend your time on an approach only to have me
John> change the whole paradigm, i.e. installing Gentoo as Dom0 (and
John> wrestling wieh EUFI) so there is no disparity between lvm
John> versions.=A0 I've invested several hours building out my guest
John> Gentoo, so I hate to risk having to do it over again, or trying
John> to archive and copy it to an attached drive and then back into a
John> partition using fdisk or parted.

Have you checked that your initramfs image built with your Gentoo VM
has the correct LVM drivers installed?

But since you haven't posted any error messages or logs, no one is
going to be able to help you. =20

John> I asked the question below hoping a developer familiar with the
John> specifications of the mapping schema for lvm might answer.=A0 Are
John> you one of the developers at Redhat?

Nope, I don't work at RedHat.

John> Since I posted, I changed my client's lvm to 2.0.3.=A0 This
John> upgrade and near match to the host ("Dom0") version ought to
John> negate any disparity issues between versions -- I would hope.

Should.

John> Even with my Gentoo client having 2.0.3 trying to discover the
John> lvm shares created by the Debian host is failing at the start of
John> the kernel.=A0 I think my problem is the initramfs is not properly
John> mapping to the lvm system.=A0 This may be a Xen issue or something
John> missing in my guest kernel and/or initramfs.

Correct, I suspect your initramfs of your client doesn't have the
properl LVM modules installed.  Did you compile your kernel with LVM
support as well? =20

John> The question I posed:

John>  =A0=A0 should tools of lvm v. 2.02.187 be able to read and access
John>  =A0=A0 a volume created by 2.03.02?

Yes, it should be able to do so.  You could test this by booting an
older Debian netboot image in your environment and making sure that it
can see the volumes. =20

John> raises the question of whether a previous version at 2.02 can
John> read a mapped system created by a version at 2.03.=A0 An answer
John> could be helpful for others working with Virtual Machines so I
John> hope someone who might know the answers responds.

Again, you need to post logs, or even the screenshot of the console as
your client VM boots up so we can see what's really happening.
Details matter, and trying to look for help from a core developer
isn't going to help since they will just ask what I'm asking here.

Post logs.  Post the output of your console on client bootup.  Ideally
bootup your client with a serial console.  Try booting the basic
gentoo image they provide and see if that works.  Make sure you have
the LVM kernel interfaces either compiled into your kernel, or that
the modules are present in the initramfs so they can be found on
bootup.


John> I could not find a description of posting etiquette for this forum.

You're doing fine!  Don't sweat it. =20

John> On 1/31/2021 3:47 PM, John Stoffel wrote:
>>>>>>> "John" =3D=3D John L Poole <jlpoole56@gmail.com> writes:
John> I am having problems with a kernel and/or initial ram file
John> system booting up in a Xen environment.
>>=20
>> Do you have any logs of the error(s) when booting up?
>>=20
>> Can you show us the configuration of your Xen guest and it's LVM
>> volumes, VG and PVs as well?  The more details the better.
>>=20
>> I personally don't do Gentoo or Xen, so I can't help there.  But I can
>> ask you to post more details.  A boot log would be very helpful.
>>=20
>>=20
John> The guest virtual machine's root file system is on an lvm volume crea=
ted
John> in Debian.=A0 Dom0 is Debian.
John> lvm on Debian is: 2.03.02(2).
>>=20
John> The guest virtual machine is in Gentoo and I have lvm=A0 2.02.187-r2
John> installed therein.=A0 I built my
John> kernel and initramfs against the 2.02 version of lvm.
>>=20
John> My question: should tools of lvm v. 2.02.187 be able to read and acce=
ss
John> a volume created by 2.03.02?
>>=20
John> Does the version change between 2.02 and 2.03 mean that the file syst=
em
John> created by 2.03 tools
John> may not be readable or accessible by 2.02 tools and libraries?=A0 I'm
John> doubting it, but asking.
>>=20
John> Gentoo's highest version of lvm is 2.02.187-r2; Gentoo developers hav=
e
John> lvm 2.03 masked with the note:
>>=20
John> =A0=A0=A0=A0 [2.03] Needs LOTS of testing, broke boot on my laptop
John> =A0=A0=A0=A0 in early attempts, maybe needs matching genkernel work?
>>=20
John> source: https://packages.gentoo.org/packages/sys-fs/lvm2
>>=20
John> Thank you,
>>=20
John> John Poole
>>=20
John> _______________________________________________
John> linux-lvm mailing list
John> linux-lvm@redhat.com
John> https://www.redhat.com/mailman/listinfo/linux-lvm
John> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
John> --=20
John> Email Rider

John> John Laurence Poole
John> 1566 Court ST NE
John> Salem OR 97301-4241
John> 707-812-1323 office


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

