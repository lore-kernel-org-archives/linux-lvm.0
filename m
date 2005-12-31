Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBVH0e131547
	for <linux-lvm@redhat.com>; Sat, 31 Dec 2005 12:00:40 -0500
Received: from snefru.openlib.org (wuecon195.wustl.edu.wustl.edu
	[128.252.177.195])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBVH0a1m004127
	for <linux-lvm@redhat.com>; Sat, 31 Dec 2005 12:00:36 -0500
Received: from krichel by snefru.openlib.org with local (Exim 4.60)
	(envelope-from <krichel@openlib.org>) id 1Esk6C-0007Ym-Ll
	for linux-lvm@redhat.com; Sat, 31 Dec 2005 11:00:56 -0600
Date: Sat, 31 Dec 2005 11:00:56 -0600
From: Thomas Krichel <krichel@openlib.org>
Subject: Re: [linux-lvm] vg not intact after other disks are exchanged
Message-ID: <20051231170056.GB8049@openlib.org>
References: <20051230181808.GA15333@openlib.org>
	<20051231144230.GA8019@openlib.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20051231144230.GA8019@openlib.org>
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

> It is strange that the scan does not find the /dev/hdd volume,
> but the display manually finds the same data. If anyone wants
> to have a look I would be happy to have them access the machine.
 
  Actually, I found that using lvm.conf, I can tell it to 
  scan for the disk, and then the disk is found, and the 
  vg1 is created. This closes my problem. But it is still
  bad that pvscan can't find the disk after other disks
  have been exchanged. Maybe this is a bios problem.


  Cheers,

  Thomas Krichel                             mailto:krichel@openlib.org
                                        http://openlib.org/home/krichel
                                    RePEc:per:1965-06-05:thomas_krichel
