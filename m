Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q22ElX4Z027700
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2012 09:47:33 -0500
Received: from msxedgnsprd01.gw.upmc.edu (msxedgnsprd01.gw.upmc.edu
	[128.147.248.16])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q22ElWt5016473
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2012 09:47:32 -0500
From: "Alheid, Gregory" <alheidgj@upmc.edu>
Date: Fri, 2 Mar 2012 14:47:30 +0000
Message-ID: <DD9E6E5052F0734AB045432B7A42A12D12B8AAD4@MSXMBXNSPRD07.acct.upmchs.net>
References: <mailman.12397.1330695867.10029.linux-lvm@redhat.com>
In-Reply-To: <mailman.12397.1330695867.10029.linux-lvm@redhat.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [Linux-lvm] Need help in understanding the logical
	to
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>


> . . . I want to see the entire sequence of address translation from 
> a logical address given by the application to the physical address . . .

Don't do any RAID5 since it is done in hardware . . .

But running  "lvdisplay -m <a_vg>"  does give a mapping  
of logical volume extents to physical extents 

# echo ; lvdisplay -m datavg | 
   egrep "LV Name|Logical extent|Physical [volume|extents]"

  LV Name                /dev/datavg/u01
  Logical extent 0 to 5119:
    Physical volume	/dev/sdb
    Physical extents	0 to 5119
  LV Name                /dev/datavg/u02
  Logical extent 0 to 1279:
    Physical volume	/dev/sdb
    Physical extents	5120 to 6399
  LV Name                /dev/datavg/arch01
  Logical extent 0 to 9982:
    Physical volume	/dev/sdb
    Physical extents	6400 to 16382
