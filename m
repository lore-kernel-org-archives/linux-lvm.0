Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CB2C433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 28 Feb 2022 06:26:08 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-oIvNBYjrORW6EXzXpoauiA-1; Mon, 28 Feb 2022 01:26:03 -0500
X-MC-Unique: oIvNBYjrORW6EXzXpoauiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 831431006AA8;
	Mon, 28 Feb 2022 06:25:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD4A478C12;
	Mon, 28 Feb 2022 06:25:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9111846F9A;
	Mon, 28 Feb 2022 06:25:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21RFHY4A020807 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 27 Feb 2022 10:17:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D3D8A2026D4D; Sun, 27 Feb 2022 15:17:34 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEFEF2026D4C
	for <linux-lvm@redhat.com>; Sun, 27 Feb 2022 15:17:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B583785A5A8
	for <linux-lvm@redhat.com>; Sun, 27 Feb 2022 15:17:31 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
	[209.85.166.52]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-79-1CjSQqjsN_CChFMwtL6hIw-1; Sun, 27 Feb 2022 10:17:26 -0500
X-MC-Unique: 1CjSQqjsN_CChFMwtL6hIw-1
Received: by mail-io1-f52.google.com with SMTP id c23so12188466ioi.4
	for <linux-lvm@redhat.com>; Sun, 27 Feb 2022 07:17:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=NTGmomhNEywPBsXgIP+ELgBAvdcAvyn4ZWDYRZBWml0=;
	b=w/k3LCdQ7YpzBg0/vl/rn+RZp26shz7ddLCx1Szum4eBBfLckoS+kyTJElKQ0o2469
	G4K8aYY3FOsU7fvY0WJK27R3l4hDfFYOyfcDniOrjHQY4EH8T5Q/ka5Y9aDTiw+0jOu+
	cNYy/ymJCBvew7xFM5ipxbf1OH0waE/ekSa3JPlKJrlOp3K1zjUnBk/3U7NF8UIeJkXc
	t9xphEMBo/XfxjkHxV5yNqb7qw8ZAT1YH82FbDqrkH+yBPxiYsEU9FbbUslMKiPXClnf
	V+k+4t1nYw8IKGCs8qPYzBUf05kihd0ziWT5dm+0fKvmLruESwkYqzbKO+S551T1X96V
	sSjA==
X-Gm-Message-State: AOAM533tQxCIZSKg+IunSvxZ7VQ47FgUjvce1LjG7ZyivBpbCpyeqmt1
	3bJo9VKhO+MkH3kK3BP5sZbywr5MOwZnIOYg29JHyOpMGrEcpg==
X-Google-Smtp-Source: ABdhPJwM7SW4FvKxzKStK8GVwFLsbbq/gdG5SyIaQO6BPKXIkrA+En95OMhRNLFSKZmwVNkE9wg4gtBPxxmK47DZR30=
X-Received: by 2002:a05:6638:bc1:b0:311:905f:790c with SMTP id
	g1-20020a0566380bc100b00311905f790cmr13864027jad.74.1645975045269;
	Sun, 27 Feb 2022 07:17:25 -0800 (PST)
MIME-Version: 1.0
From: Viktor Trojanovic <viktor@troja.ch>
Date: Sun, 27 Feb 2022 16:17:14 +0100
Message-ID: <CAL=ybPDkuRjbCmdvO8uVoxeYuc6j38XsjSWwPTkgH3KXKxJUBQ@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 28 Feb 2022 01:25:24 -0500
Subject: [linux-lvm] Cannot manage FS of thin volume
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
Content-Type: multipart/mixed; boundary="===============4331653981533426460=="

--===============4331653981533426460==
Content-Type: multipart/alternative; boundary="000000000000e200ab05d9016dfe"

--000000000000e200ab05d9016dfe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi there,

I seem to have some problems involving my LVM setup and hope I can get some
advice on this list.

I have a rather simple setup. One PV (on a RAID1-MD-Device), one VG, 3 LVs
and one thin pool that holds my Linux Containers (LXD). These container
volumes are created directly by LXD.

Yesterday, I noticed that my backups are no longer working. In order to
backup the containers, I used to do the following:

1. Make a snapshot of the container using LXD. This creates a LV snapshot.
2. Mount the snapshot.
3. Use the mount for backing up all files
4. Unmount, delete snapshot.

I remember this used to work fine. So I tried doing this step by step and
already failed at the second step. I could not mount the snapshot because
it never got even created as a device in /dev/mapper.

I thought that maybe something changed in LXD and that I had to forcefully
activate the snapshot. I then tried something with the -Ky flag but nothing
really worked. And after I rebooted the server, all of a sudden all volumes
were inactive.

With the help of a couple of internet guides, in particular this one: LVM
Transaction ID mismatch and metadata resize error =E2=80=93 Monotok
<https://blog.monotok.org/lvm-transaction-id-mismatch-and-metadata-resize-e=
rror/>,
I managed to get everything working again. So the system is booting fine,
the containers too. I can even mount the containers fine.

But something is still very wrong. For example, I tried to resize one of
the thin LVs from 10G to 20G with automatic resizing of the FS. While the
LV resizing seems to have worked fine, the FSresize did not.

This is how it looks when I try to run resize2fs on one of the containers

# resize2fs /dev/vg0/containers_cont1
resize2fs 1.44.1 (24-Mar-2018)
resize2fs: Device or resource busy while trying to open
/dev/vg0/containers_cont1
Couldn't find valid filesystem superblock.

Here's the output of running fdisk on the volume

# fdisk /dev/mapper/vg0-containers_cont

Welcome to fdisk (util-linux 2.31.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

The old ext4 signature will be removed by a write command.

Device does not contain a recognized partition table.
Created a new DOS disklabel with disk identifier 0x174c0f1c.

It clearly looks like something is wrong. One of the steps I had to take
when following the guide mentioned above is to backup the vg and change the
id of the thin pool to another value. Maybe this messed up something else.

Though I am confused that things overall seem to work. lsblk -f recognizes
the filesystem in the thin volumes, I can mount them, I can work with them.
But I cannot resize them and I cannot seem to create snapshots
successfully. If I do and mount them, they are empty.

Any pointers would be much appreciated.

Thanks,
Viktor

--000000000000e200ab05d9016dfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi there, <br></div><div><br></div><div>I seem to hav=
e some problems involving my LVM setup and hope I can get some advice on th=
is list. <br></div><div><br></div><div>I have a rather simple setup. One PV=
 (on a RAID1-MD-Device), one VG, 3 LVs and one thin pool that holds my Linu=
x Containers (LXD). These container volumes are created directly by LXD. <b=
r></div><div><br></div><div>Yesterday, I noticed that my backups are no lon=
ger working. In order to backup the containers, I used to do the following:=
 <br></div><div><br></div><div>1. Make a snapshot of the container using LX=
D. This creates a LV snapshot. <br></div><div>2. Mount the snapshot. <br></=
div><div>3. Use the mount for backing up all files</div><div>4. Unmount, de=
lete snapshot. <br></div><div><br></div><div>I remember this used to work f=
ine. So I tried doing this step by step and already failed at the second st=
ep. I could not mount the snapshot because it never got even created as a d=
evice in /dev/mapper. <br></div><div><br></div><div>I thought that maybe so=
mething changed in LXD and that I had to forcefully activate the snapshot. =
I then tried something with the -Ky flag but nothing really worked. And aft=
er I rebooted the server, all of a sudden all volumes were inactive. <br></=
div><div><br></div><div>With the help of a couple of internet guides, in pa=
rticular this one:=20

<a href=3D"https://blog.monotok.org/lvm-transaction-id-mismatch-and-metadat=
a-resize-error/">LVM Transaction ID mismatch and metadata resize error =E2=
=80=93 Monotok</a>, I managed to get everything working again. So the syste=
m is booting fine, the containers too. I can even mount the containers fine=
. <br></div><div><br></div><div>But something is still very wrong. For exam=
ple, I tried to resize one of the thin LVs from 10G to 20G with automatic r=
esizing of the FS. While the LV resizing seems to have worked fine, the FSr=
esize did not. <br></div><div><br></div><div>This is how it looks when I tr=
y to run resize2fs on one of the containers<br></div><div><br></div><div># =
resize2fs /dev/vg0/containers_cont1<br>resize2fs 1.44.1 (24-Mar-2018)<br>re=
size2fs: Device or resource busy while trying to open /dev/vg0/containers_c=
ont1<br>Couldn&#39;t find valid filesystem superblock.</div><div><br></div>=
<div>Here&#39;s the output of running fdisk on the volume</div><div><br></d=
iv><div># fdisk /dev/mapper/vg0-containers_cont<br><br>Welcome to fdisk (ut=
il-linux 2.31.1).<br>Changes will remain in memory only, until you decide t=
o write them.<br>Be careful before using the write command.<br><br>The old =
ext4 signature will be removed by a write command.<br><br>Device does not c=
ontain a recognized partition table.<br>Created a new DOS disklabel with di=
sk identifier 0x174c0f1c.<br><br></div><div>It clearly looks like something=
 is wrong. One of the steps I had to take when following the guide mentione=
d above is to backup the vg and change the id of the thin pool to another v=
alue. Maybe this messed up something else. <br></div><div><br></div><div>Th=
ough I am confused that things overall seem to work. lsblk -f recognizes th=
e filesystem in the thin volumes, I can mount them, I can work with them. B=
ut I cannot resize them and I cannot seem to create snapshots successfully.=
 If I do and mount them, they are empty. <br></div><div><br></div><div>Any =
pointers would be much appreciated. <br></div><div><br></div><div>Thanks, <=
br></div><div>Viktor<br></div></div>

--000000000000e200ab05d9016dfe--

--===============4331653981533426460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============4331653981533426460==--

