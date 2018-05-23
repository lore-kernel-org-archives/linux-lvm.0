Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEE77308BDA1
	for <linux-lvm@redhat.com>; Wed, 23 May 2018 15:53:47 +0000 (UTC)
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72B723002089
	for <linux-lvm@redhat.com>; Wed, 23 May 2018 15:53:36 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id j1-v6so16459845wrm.1
	for <linux-lvm@redhat.com>; Wed, 23 May 2018 08:53:36 -0700 (PDT)
MIME-Version: 1.0
From: Wyllys Ingersoll <wyllys.ingersoll@keepertech.com>
Date: Wed, 23 May 2018 11:53:34 -0400
Message-ID: <CAGbvivL=9LQJJ=D9j_uJgrZ_Sv=h=C2Th1-=bQARoxwvyC_afQ@mail.gmail.com>
Subject: [linux-lvm] Device XXX excluded by a filter - why??
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

Using the following lvm2 version on Ubuntu 16.04.3 running kernel 4.16.03
  LVM version:     2.02.176(2) (2017-11-03)
  Library version: 1.02.145 (2017-11-03)
  Driver version:  4.37.0

ceph-volume attempts to create a VG on a raw block device to use as a
bluestore OSD.  The command it uses looks like this:

vgcreate --force --yes ceph-a637b0e7-e54f-4fe9-8afc-a74671d94f6e /dev/sdi

The disk (/dev/sdi) in this case is a blank (no partition table) GPT
label 3.7T drive.

vgcreate complains and fails:
     stderr: Device /dev/sdi excluded by a filter.

I cannot figure out what "filter" is causing this.  The global_filter
in lvm.conf is wide open:
filter = [ "a|.*/|" ]

Turning up debug logging does not show any additional reasons.
Repeatedly running pvscan or vgscan to update the cache does not fix
it either.

What could be blocking this device from being used?

thanks,
   Wyllys Ingersoll
   Keeper Technology, LLC
