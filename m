Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAOG3wcc000754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2015 11:03:58 -0500
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45]) by mx1.redhat.com (Postfix) with ESMTPS id 33A85689
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2015 16:03:58 +0000 (UTC)
Received: by vkbs1 with SMTP id s1so14645672vkb.1
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2015 08:03:57 -0800 (PST)
MIME-Version: 1.0
From: shankha <shankhabanerjee@gmail.com>
Date: Tue, 24 Nov 2015 11:03:17 -0500
Message-ID: <CAO_L6qEsB6Na7GXeCEHH2yKJwueRqwptYDHwCS3fwEzzM3DTow@mail.gmail.com>
Subject: [linux-lvm] Thin dump errors on snapshot of lvm metadata
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

I am trying to run thin dump on the snapshot of lvm thin pool metadata.

The commands used to generate the snapshot and take the thin dump output are:

dmsetup message /dev/mapper/VG-POOL-tpool 0 reserve_metadata_snap
block_no=`dmsetup status /dev/mapper/VG-POOL-tpool | cut -f 7 -d " "`

thin_dump -f xml /dev/mapper/VG-POOL_tmeta -m $block_no

dmsetup message /dev/mapper/VG-POOL-tpool 0 release_metadata_snap

While creating the snapshot I am dumping data to the thin volume.

The error message I get is:
"metadata contains errors (run thin_check for details).
perhaps you wanted to run with --repair"

Is there something wrong with the way I am using the commands ?

Thanks
