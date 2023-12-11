Received: from sender4-pp-o91.zoho.com (sender4-pp-o91.zoho.com [136.143.188.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10BA1F60B
	for <linux-lvm@lists.linux.dev>; Mon, 11 Dec 2023 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zoho.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zoho.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zoho.com header.i=m.divya.mohan@zoho.com header.b="JOuU7pLn"
ARC-Seal: i=1; a=rsa-sha256; t=1702302064; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W/c1icjBYuYezTdx56gMqbtNvdNIE4Y6P/cZgv06dJ1LVzz4Dd/PMKQAw/gcFwtHZVwv2wHym+vhby7FuJBAWrPOulmTLAza3vovDzTTL3I7Hb0JnCbeawcziZqmgIc9nIakjHd13fhWsQuuvLV4+Jtgh+qWbv88mcs6G/JVbdk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1702302064; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=S3BAKbRKadFj8s8VupMfM9eQ+7jYLeYOLN8Dxfq/Wh4=; 
	b=WbolTE+IOnLVezgEEbu92vyXPGHD/fnfd8vcOsYk4Lqofbc/qHat0AOCg4QLAH81h6QWC3dw0LRt/qd/5h0irYIAlezCIGKU4AttDJRFoAGQ+VRlspl2444M9PaemUYmJS9lYnB3aT5Qb/Hy22NJiyw83uiTb5bWJfu9lazbPho=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zoho.com;
	spf=pass  smtp.mailfrom=m.divya.mohan@zoho.com;
	dmarc=pass header.from=<m.divya.mohan@zoho.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1702302064;
	s=zm2022; d=zoho.com; i=m.divya.mohan@zoho.com;
	h=MIME-Version:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To:Cc;
	bh=S3BAKbRKadFj8s8VupMfM9eQ+7jYLeYOLN8Dxfq/Wh4=;
	b=JOuU7pLnEo/YP2goe41wFOmOvqbr5VVUmn9Cvl4Hx1upmHDYtRK2aNlnlN7MXXD6
	6HuqWqYeNUrg37aXHsM/CJFLQTD2/GPhkyQVq59U2NR2RvBF1gm94U7u328QCPBV0oJ
	uNhQTIhbDiBRg68ByynU1ZiV4sNW+Re0QtKk5QM4=
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) by mx.zohomail.com
	with SMTPS id 1702302063784348.8733927988468; Mon, 11 Dec 2023 05:41:03 -0800 (PST)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2868605fa4aso3293821a91.0
        for <linux-lvm@lists.linux.dev>; Mon, 11 Dec 2023 05:41:03 -0800 (PST)
X-Gm-Message-State: AOJu0YzNBbMVJjdDHhMyvbYidaMsll6puRoef3XixMw/1CKemFBEfiqb
	5O+Mpl8Tj1MjgeZ4WNNGVuppVqU46G6DDYwj854=
X-Google-Smtp-Source: AGHT+IHKmG1CnBOFwSIfxY3i2QOzTibpBd6juRcEUTDZOILTN2tJAYYWme/Mk84xmPUK4aNbO4unZtV4dSPwJLrLcQw=
X-Received: by 2002:a17:90b:1113:b0:286:8dd6:db65 with SMTP id
 gi19-20020a17090b111300b002868dd6db65mr1414899pjb.91.1702302063448; Mon, 11
 Dec 2023 05:41:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: divya mohan <m.divya.mohan@zoho.com>
Date: Mon, 11 Dec 2023 19:10:52 +0530
X-Gmail-Original-Message-ID: <CAOZAaLAtS0ar7pvHvHXrYA10v2h=du1WW8+agrg1GGYVaqu_fA@mail.gmail.com>
Message-ID: <CAOZAaLAtS0ar7pvHvHXrYA10v2h=du1WW8+agrg1GGYVaqu_fA@mail.gmail.com>
Subject: vgcreate fails with 'already exists in filesystem' error
To: linux-lvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: rr080112278864d29c2a8384dae99b07e00000180af9adc4426a923890cfe42a10925b5a271f754eea644ed0:zu080112260f200c9279a20280e75d81130000947e0077f10b8f79a4224f9e12a28dc13201012ccbff7b4e:rf08011226deda51c933fb08b4b8d395840000442f3a22e599e3f66204a5f52c1f37356c3248734a69e575:ZohoMail
X-ZohoMailClient: External

I have an installation test environment, where occasionally an issue
is observed causing volume group creation to fail.

At the beginning of test, the disk contains four partitions.

---
# parted -l
Model: ATA Micron_5100_MTFD (scsi)
Disk /dev/sda: 480GB
Sector size (logical/physical): 512B/4096B
Partition Table: gpt
Disk Flags:

Number  Start   End     Size    File system  Name                  Flags
 1      1049kB  525MB   524MB   fat16        EFI system partition  boot, es=
p
 2      525MB   1050MB  524MB                Linux filesystem
 3      1050MB  33.3GB  32.2GB  ext4         Linux LVM             lvm
 4      33.3GB  463GB   429GB                Linux LVM             lvm
---

The intention is to create a new partition /dev/sda6 and volume group
VG_TEST. Since the volume group might have been created in earlier
tests, a pre-cleanup is done first.

When the issue hits, the vgremove command output says that group does
not exist, but the vgcreate command fails with error that it already
exists.

---

# sgdisk --new=3D6:904849408:925820927 --change-name=3D6:TEST-FS /dev/sda
Warning: The kernel is still using the old partition table.
The new table will be used at the next reboot or after you
run partprobe(8) or kpartx(8)
The operation has completed successfully.

# sleep 5

# partprobe /dev/sda

# vgremove -f VG_TEST
  Volume group "VG_TEST" not found
  Cannot process volume group VG_TEST

# rm -rf /dev/VG_TEST

# pvcreate  -ffy /dev/sda6
  Physical volume "/dev/sda6" successfully created.

# vgcreate VG_TEST /dev/sda6
  /dev/VG_TEST: already exists in filesystem
  Run `vgcreate --help' for more information.
---

(The removal of /dev/VG_TEST was added based on a suggestion found at
https://listman.redhat.com/archives/linux-lvm/2003-February/009721.html
 but it did not help anyways.)

At the end of the test, output of below commands were collected.

Here, lsblk shows this group, but it is missing in vgs output.

---

# lsblk
NAME                                                           MAJ:MIN
RM   SIZE RO TYPE MOUNTPOINTS
sda                                                              8:0
 0 447.1G  0 disk
=E2=94=9C=E2=94=80sda1                                                     =
      8:1
 0   500M  0 part
=E2=94=9C=E2=94=80sda2                                                     =
      8:2
 0   500M  0 part
=E2=94=9C=E2=94=80sda3                                                     =
      8:3
 0    30G  0 part /var/lib/docker
=E2=94=9C=E2=94=80sda4                                                     =
      8:4
 0   400G  0 part
=E2=94=82 =E2=94=9C=E2=94=80VG_System-..
=E2=94=82 ..
=E2=94=94=E2=94=80sda6                                                     =
      8:6
 0    10G  0 part
  =E2=94=94=E2=94=80VG_TEST-sysimg                                         =
    252:23
 0     9G  0 lvm
sr0                                                             11:0
 1  1024M  0 rom
sr1                                                             11:1
 1  1024M  0 rom


# vgs

  VG        #PV #LV #SN Attr   VSize    VFree
  VG_System   1  23   0 wz--n- <400.00g 138.87g

# pvs
  PV         VG        Fmt  Attr PSize    PFree
  /dev/sda4  VG_System lvm2 a--  <400.00g 138.87g
  /dev/sda6            lvm2 ---    10.00g  10.00g
---

What could be causing this issue? How to correctly cleanup the volume group=
?
