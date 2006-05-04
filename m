Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k44IoReY029764
	for <linux-lvm@redhat.com>; Thu, 4 May 2006 14:50:27 -0400
Received: from rs19.luxsci.com (rs19.luxsci.com [65.61.136.23])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k44IoFZR019639
	for <linux-lvm@redhat.com>; Thu, 4 May 2006 14:50:15 -0400
Received: from dsl-201-153-94-139.prod-infinitum.com.mx
	(dsl-201-153-94-139.prod-infinitum.com.mx [201.153.94.139] (may
	be forged)) (authenticated bits=0)
	by rs19.luxsci.com (8.13.6/8.13.6) with ESMTP id k44Io8rs022928
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 4 May 2006 13:50:09 -0500
From: Edgar Luna <eald@linuxuanl.org>
Date: Thu, 04 May 2006 13:50:06 -0500
Message-Id: <1146768607.10908.21.camel@ip6-localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Two Plorilant servers (Redhat) trying to access a HP
	MSA1000
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi everyone,

I have two servers with RedHat EL3 connected to an HP MSA1000. What I
want with this servers write/read the disks from the MSA1000.

I know that LVM is unaware of simultaneous access to one device, so I
tried to divide the storage of MSA1000 in two units (created via the ACU
application), that are seen by the RedHat servers as /dev/sda
and /dev/sdb. Then I created a Physical Volume for each one a Logical
Group and finally a Logical Volume for each of this.

I want an advice about this.
What would you do in my situation?
This works? I mean with this I can workaround the LVM 'problem' of
unaware of simultaneous access?
Is possible to access the Hard Drives in the MSA1000 directly from Linux
so I can make the LVM directly on disks?

I can't use GFS or that like because I can't afford to have only one
point of failure.

Thanks anyway.

-- 
Edgar Luna <eald@linuxuanl.org>
Linux UANL
