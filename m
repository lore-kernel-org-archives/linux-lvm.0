Received: from ns3.rdu.redhat.com (ns3.rdu.redhat.com [10.11.255.199])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8CIjD42001853
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 14:45:13 -0400
Received: from [10.32.4.65] (vpn-4-65.str.redhat.com [10.32.4.65])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m8CIjCNf023594
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 14:45:13 -0400
Message-ID: <48CAB8B9.60407@redhat.com>
Date: Fri, 12 Sep 2008 20:45:13 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Cannot create a logical volume
References: <fbe022af0809120016l13bee5ak957d8e3084dcdac2@mail.gmail.com>
	<48CA9EC1.1070701@redhat.com>
In-Reply-To: <48CA9EC1.1070701@redhat.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Jaroslav Stava wrote:
>> [root@localhost ~]# pvscan
>>   PV /dev/md3   VG gt_vg   lvm2 [909.91 GB / 909.91 GB free]
>>   Total: 1 [909.91 GB] / in use: 1 [909.91 GB] / in no VG: 0 [0   ]

...
>> [root@localhost ~]# lvcreate -L 5G -n data gt_vg
>>   Not enough PVs with free space available for parallel allocation.
>>   Consider --alloc anywhere if desperate.
>>
>> Any feedback would be very much appreciated,
>>
>> Thanks for your time,
>>
>>   
> AFAIK this message should be seen only when trying to create a mirrored
> or striped lv.
There is another possible problem:

Is the PV allowed to allocate any extents?

Please check "pvdisplay /dev/md3" - there should be
  Allocatable           yes

If not, allow allocation on the PV: "pvchange -x y /dev/md3"
and try lvcreate again.

That error message is misleading it this situation...

Milan
--
mbroz@redhat.com
