Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAQI7Fr16815
	for <linux-lvm@redhat.com>; Fri, 26 Nov 2004 13:07:15 -0500
Received: from languor.static.net (lethargy.static.net [66.92.70.19])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAQI6w0l027578
	for <linux-lvm@redhat.com>; Fri, 26 Nov 2004 13:07:14 -0500
Received: from syndrome.static.net ([66.92.109.119] helo=[192.168.1.103])
	by languor.static.net with asmtp (Exim 3.35 #1) id 1CXkXm-0002dp-00
	for linux-lvm@redhat.com; Fri, 26 Nov 2004 13:10:06 -0500
Mime-Version: 1.0 (Apple Message framework v619)
In-Reply-To: <41A76E48.3060308@backtobasicsmgmt.com>
References: <6E9EA468-3F7D-11D9-8E13-003065F94C4C@static.net>
	<41A76E48.3060308@backtobasicsmgmt.com>
Message-Id: <144246D1-3FD6-11D9-8E13-003065F94C4C@static.net>
Content-Transfer-Encoding: 7bit
From: Armen Babikyan <armenb@static.net>
Subject: Re: [linux-lvm] problem with LVM and fstab...bug?
Date: Fri, 26 Nov 2004 13:07:47 -0500
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Kevin,

Absolutely right.  I accidently made /dev/vg0/www an ext2 drive.  
Thanks!

   - Armen

On Nov 26, 2004, at 12:56 PM, Kevin P. Fleming wrote:

> Armen Babikyan wrote:
>
>> After this, both drives are mounted:
>> # df
>> Filesystem           1K-blocks      Used Available Use% Mounted on
>> [my other partitions]
>> /dev/mapper/vg0-www   30237648  10572760  18128888  37% /www
>> /dev/mapper/vg0-uml   10079084    945240   8621844  10% /uml
>
> Please show us the contents of your /proc/mounts after successfully 
> mounting them... I suspect your vg0-www does not contain an ext3 
> filesystem (but is instead ext2 or some other type), even though you 
> think it does.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
