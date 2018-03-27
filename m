Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A33B60471
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 10:39:09 +0000 (UTC)
Received: from hetzner.fladi.at (hetzner.fladi.at [144.76.17.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 185AE3D96B
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 10:39:06 +0000 (UTC)
Received: from [2a01:4f8:191:4a4:7ce0:55ff:fe3b:6350] (port=52218 helo=bespin)
	by hetzner.fladi.at with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
	(envelope-from <michael@fladi.at>) id 1f0m0J-0007QY-EE
	for linux-lvm@redhat.com; Tue, 27 Mar 2018 12:39:04 +0200
Message-ID: <5efc943a1039bda80e77469afbfffd3d323c9a8f.camel@fladi.at>
From: Michael Fladischer <michael@fladi.at>
Date: Tue, 27 Mar 2018 12:38:57 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Cannot create PV on /dev/dm-NN (/dev/dm-N works)
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
To: linux-lvm@redhat.com

Hi,

I'm unable to create PVs on Multipath-Volumes that are available at
/dev/dm-NN where N~[0-9] but I can create them on single digit devices
like /dev/dm-9:

# pvcreate /dev/dm-6
  Physical volume "/dev/dm-6" successfully created.

# pvcreate /dev/dm-16
  Device /dev/dm-16 not found (or ignored by filtering).

My Version of LVM is 2.02.168 from Debian 9.
The filter ist set to a permissive value:
  filter = [ "a|.*|" ]
  global_filter = [ "a|.*|" ]

Any ideas why two or more digits in the device path can cause it to be
filtered by pvcreate?

Cheers,

-- 
Michael Fladischer
Fladi.at
