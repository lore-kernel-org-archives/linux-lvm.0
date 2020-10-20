Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57A182166B27
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 16:44:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2348A85828F
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 16:44:03 +0000 (UTC)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id BE2EF920702
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 16:33:54 +0000 (UTC)
Received: from pdx1-sub0-mail-a88.g.dreamhost.com
	(100-96-8-79.trex.outbound.svc.cluster.local [100.96.8.79])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 55846920A5A
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 16:33:54 +0000 (UTC)
Received: from pdx1-sub0-mail-a88.g.dreamhost.com (localhost [127.0.0.1])
	by pdx1-sub0-mail-a88.g.dreamhost.com (Postfix) with ESMTP id
	753977E315
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 09:33:53 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
	[209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: relay@brickies.net)
	by pdx1-sub0-mail-a88.g.dreamhost.com (Postfix) with ESMTPSA id
	5D8857EF21
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 09:33:53 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id c129so2441154yba.8
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2020 09:33:52 -0700 (PDT)
MIME-Version: 1.0
From: Scott Moser <smoser@brickies.net>
Date: Tue, 20 Oct 2020 12:33:41 -0400
Message-ID: <CAKxE60zw4MvD58ds-71yQdyxFkrujCm1XHNfbF=yYRqMRHF63w@mail.gmail.com>
Subject: [linux-lvm] Why does thinpool take 2*poolmetadatasize space?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

When I create an lvmthinpool with size S and poolmetadatasize P,
it reduces the available freespace by S+2P. I expected that to
be S+P. Where did the extra poolmetadatasize get used?

See below for example.
before lvcreate we had 255868 free, after we had 254588.
The difference is 1280.  (1024 + 2*128).

# lvm vgcreate --metadatasize=128m myvg0 /dev/vda
  Physical volume "/dev/vda" successfully created.
  Volume group "myvg0" successfully created

# pvs --unit=m
  PV         VG    Fmt  Attr PSize      PFree
  /dev/vda   myvg0 lvm2 a--  255868.00m 255868.00m

# vgs --unit=m
  VG    #PV #LV #SN Attr   VSize      VFree
  myvg0   1   0   0 wz--n- 255868.00m 255868.00m

# lvm lvcreate --ignoremonitoring --yes --activate=y \
   --setactivationskip=n --size=1024m --poolmetadatasize=128m \
   --thinpool=mythinpool myvg0
  Thin pool volume with chunk size 64.00 KiB can address at most 15.81 TiB of da
ta.
  Logical volume "mythinpool" created.

# vgs --unit=m
  VG    #PV #LV #SN Attr   VSize      VFree
  myvg0   1   1   0 wz--n- 255868.00m 254588.00m

# lvs --all --unit=m
  LV                 VG    Attr       LSize    Pool Origin Data%
Meta%  Move Log Cpy%Sync Convert
  [lvol0_pmspare]    myvg0 ewi-------  128.00m
  mythinpool         myvg0 twi-a-tz-- 1024.00m             0.00   10.03
  [mythinpool_tdata] myvg0 Twi-ao---- 1024.00m
  [mythinpool_tmeta] myvg0 ewi-ao----  128.00m
