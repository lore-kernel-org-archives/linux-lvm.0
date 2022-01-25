Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67A5C2BA4C
	for <linux-lvm@archiver.kernel.org>; Wed, 26 Jan 2022 04:43:15 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-BLQ7QM5kPkmt6YATKg2n-Q-1; Tue, 25 Jan 2022 23:43:11 -0500
X-MC-Unique: BLQ7QM5kPkmt6YATKg2n-Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8507E10199BE;
	Wed, 26 Jan 2022 04:43:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 948B961082;
	Wed, 26 Jan 2022 04:42:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 993BD1809CB8;
	Wed, 26 Jan 2022 04:42:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20PIiH5W015499 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 25 Jan 2022 13:44:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 22240141DEE0; Tue, 25 Jan 2022 18:44:17 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DEB8141DEDB
	for <linux-lvm@redhat.com>; Tue, 25 Jan 2022 18:44:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFDFA8011A5
	for <linux-lvm@redhat.com>; Tue, 25 Jan 2022 18:44:16 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
	[209.85.222.51]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-365-J-_CStm4NZ-aNy9js-2PTw-1; Tue, 25 Jan 2022 13:44:14 -0500
X-MC-Unique: J-_CStm4NZ-aNy9js-2PTw-1
Received: by mail-ua1-f51.google.com with SMTP id b37so21400905uad.12
	for <linux-lvm@redhat.com>; Tue, 25 Jan 2022 10:44:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=DFjh85WJ2OsZmqX7N+y37wA1a6uYjZWaNpJWK3pjufc=;
	b=sKqz5LhhCyJ0zzHtbOLNntqQCu+gn2JOTfev1AifxHD+yXtdMTjSYpR+7o8b7yHZsf
	+QvgL34YHjlvykq4B+F7XapTqYbxmkSRe3Aydpf4joikvHB0trmF6dWChADj1X9S6YUX
	yQF9o9Nbv0wKMYXWaCwTXLt5UWdDobr0ywClw9wLX0LcCaAS9j67Eb5r2EZElpxwMeyd
	zQiCeh6nUpf+Q8Z4/UGbEOkYF7WSEVDThoN87t44yxzvOdn0llypwJCfm+giWIVa5qdL
	2fYFjWKSwHH3pLmxyIiGQ05WAtb2DME51XTdoalYtAOaSaRteVOleCaOAH1C5rQf3eZq
	kRFQ==
X-Gm-Message-State: AOAM533JZE9XlyBUDu9zGZEv2luZ66SQkk1VapLuTCVRye4zY38lO07U
	gv9TXyF/s3KS6Cfj+y9PveEYWcWBkFyMd4LiwOkq/fib8OI=
X-Google-Smtp-Source: ABdhPJwBqZhnlYkTWU/VPQ5xzKlmyT71B6G0cpYB7Qnmpen4Lr9q0NEeu4E3GA0SDgOEhNVpdlEZjmit778XUN8Q0qI=
X-Received: by 2002:a67:d101:: with SMTP id u1mr7747096vsi.50.1643136253736;
	Tue, 25 Jan 2022 10:44:13 -0800 (PST)
MIME-Version: 1.0
From: Andrei Rodionov <andrei.rodionov@gmail.com>
Date: Tue, 25 Jan 2022 11:44:01 -0700
Message-ID: <CAFm9EY-Fve6wbfNG_y9zEu4iMBLSnSZR4_S9QpO_y53xL51A4Q@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 25 Jan 2022 23:36:08 -0500
Subject: [linux-lvm] LVM RAID behavior after losing physical disk
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
Content-Type: multipart/mixed; boundary="===============8182588633962132785=="

--===============8182588633962132785==
Content-Type: multipart/alternative; boundary="000000000000b8bd0f05d66c7831"

--000000000000b8bd0f05d66c7831
Content-Type: text/plain; charset="UTF-8"

Hello,

I've provisioned an LVM RAID 6 across 4 physical disks. I'm trying to
understand the RAID behavior after injecting the failure - removing
physical disk /dev/sdc.

pvcreate /dev/sdc /dev/sdd /dev/sde /dev/sdf
vgcreate pool_vg /dev/sdc /dev/sdd /dev/sde /dev/sdf /dev/sdg
lvcreate -l +100%FREE -n pool_lv --type raid6 pool_vg
mkfs.xfs /dev/pool_vg/pool_lv
echo "/dev/mapper/pool_vg-pool_lv /mnt xfs
defaults,x-systemd.mount-timeout=30 0 0" >> /etc/fstab

Everything appears to be working fine:
# pvs --segments -o
pv_name,pv_size,seg_size,vg_name,lv_name,lv_attr,lv_size,seg_pe_ranges
  PV         PSize    SSize   VG        LV                 Attr       LSize
  PE Ranges
  /dev/sda3   <49.00g <24.50g ubuntu-vg ubuntu-lv          -wi-ao----
<24.50g /dev/sda3:0-6270
  /dev/sda3   <49.00g  24.50g ubuntu-vg                                    0
  /dev/sdc   <100.00g   4.00m pool_vg   [pool_lv_rmeta_0]  ewi-aor---
4.00m /dev/sdc:0-0
  /dev/sdc   <100.00g  99.99g pool_vg   [pool_lv_rimage_0] iwi-aor---
 99.99g /dev/sdc:1-25598
  /dev/sdd   <100.00g   4.00m pool_vg   [pool_lv_rmeta_1]  ewi-aor---
4.00m /dev/sdd:0-0
  /dev/sdd   <100.00g  99.99g pool_vg   [pool_lv_rimage_1] iwi-aor---
 99.99g /dev/sdd:1-25598
  /dev/sde   <100.00g   4.00m pool_vg   [pool_lv_rmeta_2]  ewi-aor---
4.00m /dev/sde:0-0
  /dev/sde   <100.00g  99.99g pool_vg   [pool_lv_rimage_2] iwi-aor---
 99.99g /dev/sde:1-25598
  /dev/sdf   <100.00g   4.00m pool_vg   [pool_lv_rmeta_3]  ewi-aor---
4.00m /dev/sdf:0-0
  /dev/sdf   <100.00g  99.99g pool_vg   [pool_lv_rimage_3] iwi-aor---
 99.99g /dev/sdf:1-25598
  /dev/sdg   <100.00g   4.00m pool_vg   [pool_lv_rmeta_4]  ewi-aor---
4.00m /dev/sdg:0-0
  /dev/sdg   <100.00g  99.99g pool_vg   [pool_lv_rimage_4] iwi-aor---
 99.99g /dev/sdg:1-25598
# lvs -a -o name,lv_attr,copy_percent,health_status,devices pool_vg
  LV                 Attr       Cpy%Sync Health          Devices
  pool_lv            rwi-aor--- 100.00
pool_lv_rimage_0(0),pool_lv_rimage_1(0),pool_lv_rimage_2(0),pool_lv_rimage_3(0),pool_lv_rimage_4(0)
  [pool_lv_rimage_0] iwi-aor---                          /dev/sdc(1)
  [pool_lv_rimage_1] iwi-aor---                          /dev/sdd(1)
  [pool_lv_rimage_2] iwi-aor---                          /dev/sde(1)
  [pool_lv_rimage_3] iwi-aor---                          /dev/sdf(1)
  [pool_lv_rimage_4] iwi-aor---                          /dev/sdg(1)
  [pool_lv_rmeta_0]  ewi-aor---                          /dev/sdc(0)
  [pool_lv_rmeta_1]  ewi-aor---                          /dev/sdd(0)
  [pool_lv_rmeta_2]  ewi-aor---                          /dev/sde(0)
  [pool_lv_rmeta_3]  ewi-aor---                          /dev/sdf(0)
  [pool_lv_rmeta_4]  ewi-aor---                          /dev/sdg(0)

After the /dev/sdc is removed and the system is rebooted, the RAID goes
into "partial" health state and is no longer accessible.

# lvs -a -o name,lv_attr,copy_percent,health_status,devices pool_vg
  WARNING: Couldn't find device with uuid
03KtEG-cJ5S-cMAD-RlL8-yBXM-jCav-EyD9I3.
  WARNING: VG pool_vg is missing PV 03KtEG-cJ5S-cMAD-RlL8-yBXM-jCav-EyD9I3
(last written to /dev/sdc).
  LV                 Attr       Cpy%Sync Health          Devices
  pool_lv            rwi---r-p-          partial
pool_lv_rimage_0(0),pool_lv_rimage_1(0),pool_lv_rimage_2(0),pool_lv_rimage_3(0),pool_lv_rimage_4(0)
  [pool_lv_rimage_0] Iwi---r-p-          partial         [unknown](1)
  [pool_lv_rimage_1] Iwi---r---                          /dev/sdd(1)
  [pool_lv_rimage_2] Iwi---r---                          /dev/sde(1)
  [pool_lv_rimage_3] Iwi---r---                          /dev/sdf(1)
  [pool_lv_rimage_4] Iwi---r---                          /dev/sdg(1)
  [pool_lv_rmeta_0]  ewi---r-p-          partial         [unknown](0)
  [pool_lv_rmeta_1]  ewi---r---                          /dev/sdd(0)
  [pool_lv_rmeta_2]  ewi---r---                          /dev/sde(0)
  [pool_lv_rmeta_3]  ewi---r---                          /dev/sdf(0)
  [pool_lv_rmeta_4]  ewi---r---                          /dev/sdg(0)


>From what I understand, the RAID should be able to continue with a physical
disk loss and be in a "degraded" state, not "partial", because the data is
fully present on the surviving disks.

>From /etc/lvm/lvm.conf:
        #   degraded
        #     Like complete, but additionally RAID LVs of segment type
raid1,
        #     raid4, raid5, radid6 and raid10 will be activated if there is
no
        #     data loss, i.e. they have sufficient redundancy to present the
        #     entire addressable range of the Logical Volume.
        #   partial
        #     Allows the activation of any LV even if a missing or failed PV
        #     could cause data loss with a portion of the LV inaccessible.
        #     This setting should not normally be used, but may sometimes
        #     assist with data recovery.

From
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_logical_volumes/assembly_configure-mange-raid-configuring-and-managing-logical-volumes
:

"RAID is not like traditional LVM mirroring. LVM mirroring required failed
devices to be removed or the mirrored logical volume would hang. RAID
arrays can keep on running with failed devices. In fact, for RAID types
other than RAID1, removing a device would mean converting to a lower level
RAID (for example, from RAID6 to RAID5, or from RAID4 or RAID5 to RAID0).

However, in my case, the RAID is not converted, it's simply not available.

This is running in a virtual machine on VMware ESXi 7,  LVM version:
2.03.07(2) (2019-11-30).

Am I missing something obvious? Appreciate any insights.

Thanks,

Andrei

--000000000000b8bd0f05d66c7831
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I&#39;ve provisioned =
an LVM RAID 6 across 4 physical disks.=20
I&#39;m trying to understand the RAID behavior after injecting the failure =
- removing physical disk /dev/sdc.

</div><div><br></div><div>pvcreate /dev/sdc /dev/sdd /dev/sde /dev/sdf<br>v=
gcreate pool_vg /dev/sdc /dev/sdd /dev/sde /dev/sdf /dev/sdg<br>lvcreate -l=
 +100%FREE -n pool_lv --type raid6 pool_vg<br>mkfs.xfs /dev/pool_vg/pool_lv=
<br>echo &quot;/dev/mapper/pool_vg-pool_lv /mnt xfs defaults,x-systemd.moun=
t-timeout=3D30 0 0&quot; &gt;&gt; /etc/fstab</div><div><br></div><div>Every=
thing appears to be working fine:</div><div># pvs --segments -o pv_name,pv_=
size,seg_size,vg_name,lv_name,lv_attr,lv_size,seg_pe_ranges<br>=C2=A0 PV =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PSize =C2=A0 =C2=A0SSize =C2=A0 VG =C2=A0 =C2=
=A0 =C2=A0 =C2=A0LV =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Attr =C2=A0 =C2=A0 =C2=A0 LSize =C2=A0 PE Ranges<br>=C2=A0 /dev/sda3 =C2=
=A0 &lt;49.00g &lt;24.50g ubuntu-vg ubuntu-lv =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0-wi-ao---- &lt;24.50g /dev/sda3:0-6270<br>=C2=A0 /dev/sda3 =C2=A0 &lt=
;49.00g =C2=A024.50g ubuntu-vg =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00<br>=C2=A0 /dev/sdc =C2=A0 &lt;100.00g =C2=A0 4.00m pool_vg =C2=
=A0 [pool_lv_rmeta_0] =C2=A0ewi-aor--- =C2=A0 4.00m /dev/sdc:0-0<br>=C2=A0 =
/dev/sdc =C2=A0 &lt;100.00g =C2=A099.99g pool_vg =C2=A0 [pool_lv_rimage_0] =
iwi-aor--- =C2=A099.99g /dev/sdc:1-25598<br>=C2=A0 /dev/sdd =C2=A0 &lt;100.=
00g =C2=A0 4.00m pool_vg =C2=A0 [pool_lv_rmeta_1] =C2=A0ewi-aor--- =C2=A0 4=
.00m /dev/sdd:0-0<br>=C2=A0 /dev/sdd =C2=A0 &lt;100.00g =C2=A099.99g pool_v=
g =C2=A0 [pool_lv_rimage_1] iwi-aor--- =C2=A099.99g /dev/sdd:1-25598<br>=C2=
=A0 /dev/sde =C2=A0 &lt;100.00g =C2=A0 4.00m pool_vg =C2=A0 [pool_lv_rmeta_=
2] =C2=A0ewi-aor--- =C2=A0 4.00m /dev/sde:0-0<br>=C2=A0 /dev/sde =C2=A0 &lt=
;100.00g =C2=A099.99g pool_vg =C2=A0 [pool_lv_rimage_2] iwi-aor--- =C2=A099=
.99g /dev/sde:1-25598<br>=C2=A0 /dev/sdf =C2=A0 &lt;100.00g =C2=A0 4.00m po=
ol_vg =C2=A0 [pool_lv_rmeta_3] =C2=A0ewi-aor--- =C2=A0 4.00m /dev/sdf:0-0<b=
r>=C2=A0 /dev/sdf =C2=A0 &lt;100.00g =C2=A099.99g pool_vg =C2=A0 [pool_lv_r=
image_3] iwi-aor--- =C2=A099.99g /dev/sdf:1-25598<br>=C2=A0 /dev/sdg =C2=A0=
 &lt;100.00g =C2=A0 4.00m pool_vg =C2=A0 [pool_lv_rmeta_4] =C2=A0ewi-aor---=
 =C2=A0 4.00m /dev/sdg:0-0<br>=C2=A0 /dev/sdg =C2=A0 &lt;100.00g =C2=A099.9=
9g pool_vg =C2=A0 [pool_lv_rimage_4] iwi-aor--- =C2=A099.99g /dev/sdg:1-255=
98<br></div><div># lvs -a -o name,lv_attr,copy_percent,health_status,device=
s pool_vg<br>=C2=A0 LV =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Attr =C2=A0 =C2=A0 =C2=A0 Cpy%Sync Health =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Devices<br>=C2=A0 pool_lv =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rw=
i-aor--- 100.00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pool_lv_rimage_0(0),pool_lv_rimage_1(0),pool_lv_rimage_2(0),pool_lv_rim=
age_3(0),pool_lv_rimage_4(0)<br>=C2=A0 [pool_lv_rimage_0] iwi-aor--- =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/dev/sdc(1)<br>=C2=A0 [pool_lv_rimage_1] iwi-aor--- =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/dev/sdd(1)<br>=C2=A0 [pool_lv_rimage_2] iwi-aor--- =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/=
sde(1)<br>=C2=A0 [pool_lv_rimage_3] iwi-aor--- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sdf(1)<b=
r>=C2=A0 [pool_lv_rimage_4] iwi-aor--- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sdg(1)<br>=C2=
=A0 [pool_lv_rmeta_0] =C2=A0ewi-aor--- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sdc(0)<br>=C2=
=A0 [pool_lv_rmeta_1] =C2=A0ewi-aor--- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sdd(0)<br>=C2=
=A0 [pool_lv_rmeta_2] =C2=A0ewi-aor--- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sde(0)<br>=C2=
=A0 [pool_lv_rmeta_3] =C2=A0ewi-aor--- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sdf(0)<br>=C2=
=A0 [pool_lv_rmeta_4] =C2=A0ewi-aor--- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sdg(0)<br></div=
><div><br></div><div>After the /dev/sdc is removed and the system is reboot=
ed, the RAID goes into &quot;partial&quot; health state and is no longer ac=
cessible.<br></div><div><br></div><div># lvs -a -o name,lv_attr,copy_percen=
t,health_status,devices pool_vg<br>=C2=A0 WARNING: Couldn&#39;t find device=
 with uuid 03KtEG-cJ5S-cMAD-RlL8-yBXM-jCav-EyD9I3.<br>=C2=A0 WARNING: VG po=
ol_vg is missing PV 03KtEG-cJ5S-cMAD-RlL8-yBXM-jCav-EyD9I3 (last written to=
 /dev/sdc).<br>=C2=A0 LV =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Attr =C2=A0 =C2=A0 =C2=A0 Cpy%Sync Health =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Devices<br>=C2=A0 pool_lv =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0rwi---r-p- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partial =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pool_lv_rimage_0(0),pool_lv_rimage_1(0),pool_lv_rimage_2(0),pool=
_lv_rimage_3(0),pool_lv_rimage_4(0)<br>=C2=A0 [pool_lv_rimage_0] Iwi---r-p-=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partial =C2=A0 =C2=A0 =C2=A0 =C2=A0 [unk=
nown](1)<br>=C2=A0 [pool_lv_rimage_1] Iwi---r--- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sdd(=
1)<br>=C2=A0 [pool_lv_rimage_2] Iwi---r--- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sde(1)<br>=
=C2=A0 [pool_lv_rimage_3] Iwi---r--- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sdf(1)<br>=C2=A0 [=
pool_lv_rimage_4] Iwi---r--- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/sdg(1)<br>=C2=A0 [pool_lv=
_rmeta_0] =C2=A0ewi---r-p- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partial =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 [unknown](0)<br>=C2=A0 [pool_lv_rmeta_1] =C2=A0ewi---=
r--- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/dev/sdd(0)<br>=C2=A0 [pool_lv_rmeta_2] =C2=A0ewi---r--=
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/dev/sde(0)<br>=C2=A0 [pool_lv_rmeta_3] =C2=A0ewi---r--- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/dev/sdf(0)<br>=C2=A0 [pool_lv_rmeta_4] =C2=A0ewi---r--- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/dev/sdg(0)</div><div><br></div><div><br></div><div>From w=
hat I understand, the RAID should be able to continue with a physical disk =
loss and be in a &quot;degraded&quot; state, not &quot;partial&quot;, becau=
se the data is fully present on the surviving disks.</div><div><br></div><d=
iv></div><div>From /etc/lvm/lvm.conf:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 # =C2=A0 degraded<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # =C2=A0 =C2=A0 Like comp=
lete, but additionally RAID LVs of segment type raid1,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # =C2=A0 =C2=A0 raid4, raid5, radid6 and raid10 will be activate=
d if there is no<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # =C2=A0 =C2=A0 data loss, =
i.e. they have sufficient redundancy to present the<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 # =C2=A0 =C2=A0 entire addressable range of the Logical Volume.<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # =C2=A0 partial<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 # =C2=A0 =C2=A0 Allows the activation of any LV even if a missing or faile=
d PV<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # =C2=A0 =C2=A0 could cause data loss w=
ith a portion of the LV inaccessible.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # =C2=
=A0 =C2=A0 This setting should not normally be used, but may sometimes<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # =C2=A0 =C2=A0 assist with data recovery.</div=
><div><br></div><div>From <a href=3D"https://access.redhat.com/documentatio=
n/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_logical_vo=
lumes/assembly_configure-mange-raid-configuring-and-managing-logical-volume=
s">https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8=
/html/configuring_and_managing_logical_volumes/assembly_configure-mange-rai=
d-configuring-and-managing-logical-volumes</a>:</div><div><br></div><div>&q=
uot;RAID is not like traditional LVM mirroring. LVM mirroring required=20
failed devices to be removed or the mirrored logical volume would hang.=20
RAID arrays can keep on running with failed devices. In fact, for RAID=20
types other than RAID1, removing a device would mean converting to a=20
lower level RAID (for example, from RAID6 to RAID5, or from RAID4 or=20
RAID5 to RAID0).</div><div><br></div><div>However, in my case, the RAID is =
not converted, it&#39;s simply not available.</div><div><br></div><div>This=
 is running in a virtual machine on VMware ESXi 7,=C2=A0 LVM version: =C2=
=A0 =C2=A0 2.03.07(2) (2019-11-30).</div><div><br></div><div>Am I missing s=
omething obvious? Appreciate any insights.</div><div><br></div><div>Thanks,=
</div><div><br></div><div>Andrei<br>
=09=09=09=09

</div></div>

--000000000000b8bd0f05d66c7831--

--===============8182588633962132785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============8182588633962132785==--

