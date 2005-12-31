Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBVEgC107213
	for <linux-lvm@redhat.com>; Sat, 31 Dec 2005 09:42:12 -0500
Received: from snefru.openlib.org (wuecon195.wustl.edu.wustl.edu
	[128.252.177.195])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBVEgB9c008472
	for <linux-lvm@redhat.com>; Sat, 31 Dec 2005 09:42:11 -0500
Received: from krichel by snefru.openlib.org with local (Exim 4.60)
	(envelope-from <krichel@openlib.org>) id 1EshwE-00025j-7l
	for linux-lvm@redhat.com; Sat, 31 Dec 2005 08:42:30 -0600
Date: Sat, 31 Dec 2005 08:42:30 -0600
From: Thomas Krichel <krichel@openlib.org>
Subject: Re: [linux-lvm] vg not intact after other disks are exchanged
Message-ID: <20051231144230.GA8019@openlib.org>
References: <20051230181808.GA15333@openlib.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20051230181808.GA15333@openlib.org>
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
Content-Transfer-Encoding: 7bit
To: Linux LVM <linux-lvm@redhat.com>



  Thomas Krichel writes

> fasolt:~# pvscan
>   Couldn't find device with uuid 'N0i9f3-0xqW-iPyq-7EG9-e4kI-Oa3F-jPfRpC'.
>   Couldn't find device with uuid 'N0i9f3-0xqW-iPyq-7EG9-e4kI-Oa3F-jPfRpC'.
>   PV /dev/hdc         VG vg1   lvm2 [186.30 GB / 0    free]
>   PV unknown device   VG vg1   lvm2 [167.68 GB / 0    free]
>   PV /dev/hdb1        VG vg1   lvm2 [372.61 GB / 0    free]
>   Total: 3 [726.59 GB] / in use: 3 [726.59 GB] / in no VG: 0 [0   ]
> 
> But hdd is still there, it is just not recogized as 
> part of vg1. 

  I have no response to my problem. I have been poking around more.
  Actually

fasolt:~# pvdisplay /dev/hdd
  --- Physical volume ---
  PV Name               /dev/hdd
  VG Name               vg1
  PV Size               167.68 GB / not usable 0   
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              42925
  Free PE               0
  Allocated PE          42925
  PV UUID               N0i9f3-0xqW-iPyq-7EG9-e4kI-Oa3F-jPfRpC
   
  This is exactly the sume uudi 'N0i9f3-0xqW-iPyq-7EG9-e4kI-Oa3F-jPfRpC'.
  that pvscan can not find.

  It is strange that the scan does not find the /dev/hdd volume,
  but the display manually finds the same data. If anyone wants
  to have a look I would be happy to have them access the machine.


  Cheers,

  Thomas Krichel                             mailto:krichel@openlib.org
                                        http://openlib.org/home/krichel
                                    RePEc:per:1965-06-05:thomas_krichel
