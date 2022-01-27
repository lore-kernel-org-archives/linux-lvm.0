Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90D6C433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 27 Jan 2022 13:27:53 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-J_ZDqHZTP9KMGOuNPARLpQ-1; Thu, 27 Jan 2022 08:27:49 -0500
X-MC-Unique: J_ZDqHZTP9KMGOuNPARLpQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74F648144E5;
	Thu, 27 Jan 2022 13:27:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49F976E215;
	Thu, 27 Jan 2022 13:27:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66EDE4BB7C;
	Thu, 27 Jan 2022 13:27:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20RDOK43002101 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 27 Jan 2022 08:24:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7997E1120AC3; Thu, 27 Jan 2022 13:24:20 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 749031121321
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2022 13:24:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D7D318F0240
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2022 13:24:17 +0000 (UTC)
Received: from mail.stoffel.org (li1843-175.members.linode.com
	[172.104.24.175]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-517-AsQt95kSMcylGRktdbv17w-1; Thu, 27 Jan 2022 08:24:15 -0500
X-MC-Unique: AsQt95kSMcylGRktdbv17w-1
Received: from quad.stoffel.org (068-116-170-226.res.spectrum.com
	[68.116.170.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 09B6D27B62
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2022 08:16:40 -0500 (EST)
Received: by quad.stoffel.org (Postfix, from userid 1000)
	id 87089A7884; Thu, 27 Jan 2022 08:16:39 -0500 (EST)
MIME-Version: 1.0
Message-ID: <25074.39735.467505.223732@quad.stoffel.home>
Date: Thu, 27 Jan 2022 08:16:39 -0500
From: "John Stoffel" <john@stoffel.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <CAFm9EY-Fve6wbfNG_y9zEu4iMBLSnSZR4_S9QpO_y53xL51A4Q@mail.gmail.com>
References: <CAFm9EY-Fve6wbfNG_y9zEu4iMBLSnSZR4_S9QpO_y53xL51A4Q@mail.gmail.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20RDOK43002101
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] LVM RAID behavior after losing physical disk
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>>>>> "Andrei" =3D=3D Andrei Rodionov <andrei.rodionov@gmail.com> writes:

Andrei> I've provisioned an LVM RAID 6 across 4 physical disks. I'm
Andrei> trying to understand the RAID behavior after injecting the
Andrei> failure - removing physical disk /dev/sdc.

The docs state you need to use 5 devices for RAID6 under LVM, not
four.  And you do show 5 disks in your vgcreate, but not your lvcreate
command.

Maybe you could post a test script you use to do your testing to make
sure you're calling it correctly? =20


Andrei> pvcreate /dev/sdc /dev/sdd /dev/sde /dev/sdf
Andrei> vgcreate pool_vg /dev/sdc /dev/sdd /dev/sde /dev/sdf /dev/sdg
Andrei> lvcreate -l +100%FREE -n pool_lv --type raid6 pool_vg
Andrei> mkfs.xfs /dev/pool_vg/pool_lv
Andrei> echo "/dev/mapper/pool_vg-pool_lv /mnt xfs defaults,x-systemd.mount=
-timeout=3D30 0 0" >> /etc/fstab

This looks ok, but maybe you need to specify the explicit stripe count
and size?

  lvcreate --type raid6 -l 100%FREE --stripes 3 --stripesize 1 -n pool_lv p=
ool_vg

Andrei> Everything appears to be working fine:
Andrei> # pvs --segments -o pv_name,pv_size,seg_size,vg_name,lv_name,lv_att=
r,lv_size,seg_pe_ranges
Andrei> =A0 PV =A0 =A0 =A0 =A0 PSize =A0 =A0SSize =A0 VG =A0 =A0 =A0 =A0LV =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Attr =A0 =A0 =A0 LSize =A0 PE Ranges
Andrei> =A0 /dev/sda3 =A0 <49.00g <24.50g ubuntu-vg ubuntu-lv =A0 =A0 =A0 =
=A0 =A0-wi-ao---- <24.50g /dev/sda3:0-6270
Andrei> =A0 /dev/sda3 =A0 <49.00g =A024.50g ubuntu-vg =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00
Andrei> =A0 /dev/sdc =A0 <100.00g =A0 4.00m pool_vg =A0 [pool_lv_rmeta_0] =
=A0ewi-aor--- =A0 4.00m /dev/sdc:0-0
Andrei> =A0 /dev/sdc =A0 <100.00g =A099.99g pool_vg =A0 [pool_lv_rimage_0] =
iwi-aor--- =A099.99g /dev/sdc:1-25598
Andrei> =A0 /dev/sdd =A0 <100.00g =A0 4.00m pool_vg =A0 [pool_lv_rmeta_1] =
=A0ewi-aor--- =A0 4.00m /dev/sdd:0-0
Andrei> =A0 /dev/sdd =A0 <100.00g =A099.99g pool_vg =A0 [pool_lv_rimage_1] =
iwi-aor--- =A099.99g /dev/sdd:1-25598
Andrei> =A0 /dev/sde =A0 <100.00g =A0 4.00m pool_vg =A0 [pool_lv_rmeta_2] =
=A0ewi-aor--- =A0 4.00m /dev/sde:0-0
Andrei> =A0 /dev/sde =A0 <100.00g =A099.99g pool_vg =A0 [pool_lv_rimage_2] =
iwi-aor--- =A099.99g /dev/sde:1-25598
Andrei> =A0 /dev/sdf =A0 <100.00g =A0 4.00m pool_vg =A0 [pool_lv_rmeta_3] =
=A0ewi-aor--- =A0 4.00m /dev/sdf:0-0
Andrei> =A0 /dev/sdf =A0 <100.00g =A099.99g pool_vg =A0 [pool_lv_rimage_3] =
iwi-aor--- =A099.99g /dev/sdf:1-25598
Andrei> =A0 /dev/sdg =A0 <100.00g =A0 4.00m pool_vg =A0 [pool_lv_rmeta_4] =
=A0ewi-aor--- =A0 4.00m /dev/sdg:0-0
Andrei> =A0 /dev/sdg =A0 <100.00g =A099.99g pool_vg =A0 [pool_lv_rimage_4] =
iwi-aor--- =A099.99g /dev/sdg:1-25598
Andrei> # lvs -a -o name,lv_attr,copy_percent,health_status,devices pool_vg
Andrei> =A0 LV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Attr =A0 =A0 =A0 Cpy%Sync He=
alth =A0 =A0 =A0 =A0 =A0Devices
Andrei> =A0 pool_lv =A0 =A0 =A0 =A0 =A0 =A0rwi-aor--- 100.00 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 pool_lv_rimage_0(0),pool_lv_rimage_1
Andrei> (0),pool_lv_rimage_2(0),pool_lv_rimage_3(0),pool_lv_rimage_4(0)
Andrei> =A0 [pool_lv_rimage_0] iwi-aor--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/dev/sdc(1)
Andrei> =A0 [pool_lv_rimage_1] iwi-aor--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/dev/sdd(1)
Andrei> =A0 [pool_lv_rimage_2] iwi-aor--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/dev/sde(1)
Andrei> =A0 [pool_lv_rimage_3] iwi-aor--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/dev/sdf(1)
Andrei> =A0 [pool_lv_rimage_4] iwi-aor--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/dev/sdg(1)
Andrei> =A0 [pool_lv_rmeta_0] =A0ewi-aor--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0/dev/sdc(0)
Andrei> =A0 [pool_lv_rmeta_1] =A0ewi-aor--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0/dev/sdd(0)
Andrei> =A0 [pool_lv_rmeta_2] =A0ewi-aor--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0/dev/sde(0)
Andrei> =A0 [pool_lv_rmeta_3] =A0ewi-aor--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0/dev/sdf(0)
Andrei> =A0 [pool_lv_rmeta_4] =A0ewi-aor--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0/dev/sdg(0)

Andrei> After the /dev/sdc is removed and the system is rebooted, the
Andrei> RAID goes into "partial" health state and is no longer
Andrei> accessible.

Just for grins, what happens if you re-add the sdc and then reboot?
Does it re-find the array? =20

Andrei> # lvs -a -o name,lv_attr,copy_percent,health_status,devices pool_vg
Andrei> =A0 WARNING: Couldn't find device with uuid 03KtEG-cJ5S-cMAD-RlL8-y=
BXM-jCav-EyD9I3.
Andrei> =A0 WARNING: VG pool_vg is missing PV 03KtEG-cJ5S-cMAD-RlL8-yBXM-jC=
av-EyD9I3 (last written to /dev/
Andrei> sdc).
Andrei> =A0 LV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Attr =A0 =A0 =A0 Cpy%Sync He=
alth =A0 =A0 =A0 =A0 =A0Devices
Andrei> =A0 pool_lv =A0 =A0 =A0 =A0 =A0 =A0rwi---r-p- =A0 =A0 =A0 =A0 =A0pa=
rtial =A0 =A0 =A0 =A0 pool_lv_rimage_0(0),pool_lv_rimage_1
Andrei> (0),pool_lv_rimage_2(0),pool_lv_rimage_3(0),pool_lv_rimage_4(0)
Andrei> =A0 [pool_lv_rimage_0] Iwi---r-p- =A0 =A0 =A0 =A0 =A0partial =A0 =
=A0 =A0 =A0 [unknown](1)
Andrei> =A0 [pool_lv_rimage_1] Iwi---r--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/dev/sdd(1)
Andrei> =A0 [pool_lv_rimage_2] Iwi---r--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/dev/sde(1)
Andrei> =A0 [pool_lv_rimage_3] Iwi---r--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/dev/sdf(1)
Andrei> =A0 [pool_lv_rimage_4] Iwi---r--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/dev/sdg(1)
Andrei> =A0 [pool_lv_rmeta_0] =A0ewi---r-p- =A0 =A0 =A0 =A0 =A0partial =A0 =
=A0 =A0 =A0 [unknown](0)
Andrei> =A0 [pool_lv_rmeta_1] =A0ewi---r--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0/dev/sdd(0)
Andrei> =A0 [pool_lv_rmeta_2] =A0ewi---r--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0/dev/sde(0)
Andrei> =A0 [pool_lv_rmeta_3] =A0ewi---r--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0/dev/sdf(0)
Andrei> =A0 [pool_lv_rmeta_4] =A0ewi---r--- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0/dev/sdg(0)

Andrei> From what I understand, the RAID should be able to continue
Andrei> with a physical disk loss and be in a "degraded" state, not
Andrei> "partial", because the data is fully present on the surviving
Andrei> disks.

Andrei> From /etc/lvm/lvm.conf:
Andrei> =A0 =A0 =A0 =A0 # =A0 degraded
Andrei> =A0 =A0 =A0 =A0 # =A0 =A0 Like complete, but additionally RAID LVs =
of segment type raid1,
Andrei> =A0 =A0 =A0 =A0 # =A0 =A0 raid4, raid5, radid6 and raid10 will be a=
ctivated if there is no
Andrei> =A0 =A0 =A0 =A0 # =A0 =A0 data loss, i.e. they have sufficient redu=
ndancy to present the
Andrei> =A0 =A0 =A0 =A0 # =A0 =A0 entire addressable range of the Logical V=
olume.
Andrei> =A0 =A0 =A0 =A0 # =A0 partial
Andrei> =A0 =A0 =A0 =A0 # =A0 =A0 Allows the activation of any LV even if a=
 missing or failed PV
Andrei> =A0 =A0 =A0 =A0 # =A0 =A0 could cause data loss with a portion of t=
he LV inaccessible.
Andrei> =A0 =A0 =A0 =A0 # =A0 =A0 This setting should not normally be used,=
 but may sometimes
Andrei> =A0 =A0 =A0 =A0 # =A0 =A0 assist with data recovery.

What is your actual setting in /etc/lvm/lvm.conf for the block:

   activation {
     ...
     activation_mode =3D "degraded"
     ...
   }

I'm on debian, and not on RHEL8 and I haven't tested this myself, but
I wonder if you needed to really apply the '--stripes 3' value when
you built it?

John


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

