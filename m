Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i68AR1001881
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2004 06:27:01 -0400
Received: from e6.ny.us.ibm.com (e6.ny.us.ibm.com [32.97.182.106])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i68AR0e1016707
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2004 06:27:00 -0400
Received: from northrelay04.pok.ibm.com (northrelay04.pok.ibm.com
	[9.56.224.206])
	by e6.ny.us.ibm.com (8.12.10/8.12.2) with ESMTP id i68AQsdu535482
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2004 06:26:54 -0400
Received: from in.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by northrelay04.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i68ARiWm098306
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2004 06:27:46 -0400
Message-ID: <40ED2239.D6F23803@in.ibm.com>
Date: Thu, 08 Jul 2004 16:00:17 +0530
From: Sachin Sant <sachinp@in.ibm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm problem..
References: <40EA7997.73FF330@in.ibm.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com


Never mind .. i got it...

Sachin Sant wrote:
> 
> Steps to Reproduce:
>    configure logical volume
> vgscan
> pvcreate /dev/hdc1
> vgcreate vg1 /dev/hdc1
> lvcreate -n lv001 -L 1000G vg1
> 
> After a reboot  when the machine comes up i see these messages
> 
> Remounting root filesystem in read-write mode:  [  OK  ]
> Setting up Logical Volume Management: modprobe: modprobe: Can't locate
> module
> block-major-43
> modprobe: modprobe: Can't locate module block-major-43
> modprobe: modprobe: Can't locate module block-major-43
> modprobe: modprobe: Can't locate module block-major-43
> 
> After adding the line " alias block-major-43 off" i can turn off these
> messages.
> 
> Question :
>    Why is lvm looking for this block major 43 device [ nbd ]. Does it
> scan all the block major devices to locate pv's.
> 
> I am using LVM 1.0.8 on RHEL 3.
> 
> --
> Thanks
> -Sachin
> -----------------------------------
> Sachin Sant
> Linux Technology Center
> IBM Software Lab
> Bangalore, INDIA.
> 
> sachinp@in.ibm.com
> Ph: 91-80-5044647
> -----------------------------------
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Thanks
-Sachin
-----------------------------------
Sachin Sant
Linux Technology Center
IBM Software Lab
Bangalore, INDIA.

sachinp@in.ibm.com
Ph: 91-80-5044647
-----------------------------------
