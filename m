Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tANMXePq021480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 23 Nov 2015 17:33:40 -0500
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mx1.redhat.com (Postfix) with ESMTPS id CB8458C1A5
	for <linux-lvm@redhat.com>; Mon, 23 Nov 2015 22:33:39 +0000 (UTC)
Received: by vkfr145 with SMTP id r145so48894329vkf.0
	for <linux-lvm@redhat.com>; Mon, 23 Nov 2015 14:33:39 -0800 (PST)
MIME-Version: 1.0
From: shankha <shankhabanerjee@gmail.com>
Date: Mon, 23 Nov 2015 11:47:04 -0500
Message-ID: <CAO_L6qELj-F7Z3-MqM=_mhwmTnHEA1ZYe=Cc72cRGNCZ=h3K4A@mail.gmail.com>
Subject: [linux-lvm] Request for Feature: Disk space usage by a LVM snapshot
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

Hi,

Goal: We are trying to calculate actual disk usage of  LVM Snapshots
created from a thin logical volume.

Method:
Currently we use thin_dump to dump metadata information of all the LVM
snapshots and logical volumes.

Check what are the blocks unique to the snapshot and that gives you
the size of the snapshot.

The problem is while one is dumping data on the snapshot the metadata
information which you get from thin dump is incorrect. That is what I noticed.
Sometimes the tool will fail and it will ask you to repair your lvm metadata.

---
Is there a way we can have a separate tool which will give us the disk
usage of a LVM Snapshot.


Thanks for all your help.
