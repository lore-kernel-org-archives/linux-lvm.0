Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8L3ve9P003557
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 23:57:41 -0400
Received: from postalmail-a5.dreamhost.com (sd-green-bigip-83.dreamhost.com
	[208.97.132.83])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8L3vbuY028216
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 23:57:37 -0400
Received: from [10.0.1.102]
	(216-164-51-168.c3-0.slvr-ubr2.lnh-slvr.md.cable.rcn.com
	[216.164.51.168])
	by postalmail-a5.dreamhost.com (Postfix) with ESMTP id 93589131984
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 20:57:36 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v752.2)
In-Reply-To: <Pine.LNX.4.63.0609200939510.20726@zeus.itg.uiuc.edu>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<1158608557.19905.37.camel@bounty.rider.geekspirit.net>
	<1158609135.7182.21.camel@localhost.localdomain>
	<1158609477.19905.38.camel@bounty.rider.geekspirit.net>
	<Pine.LNX.4.63.0609191650560.1397@zeus.itg.uiuc.edu>
	<1158760524.26653.4.camel@merlin.Mines.EDU>
	<Pine.LNX.4.63.0609200939510.20726@zeus.itg.uiuc.edu>
Message-Id: <FD81E903-EC2D-477D-908C-ECE4F4711378@boyko.net>
Content-Transfer-Encoding: 7bit
From: Andrew Boyko <andy@boyko.net>
Subject: Re: [linux-lvm] LVM on RAID
Date: Wed, 20 Sep 2006 23:19:58 -0400
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

We do this: we have, connected to an amd64 server via a QLogic  
QLA-2340 to an FC switch, several RAID devices (XServe RAID, Nexsan  
SATABeast) totalling 15 PVs in a single 27TB VG, with various XFS  
filesystems, several of which approach 8-10TB.  These filesystems are  
then exported to a small lab of NFS clients.  The vgdisplay:

   --- Volume group ---
   VG Name               Storage2
   System ID
   Format                lvm2
   Metadata Areas        15
   Metadata Sequence No  39
   VG Access             read/write
   VG Status             resizable
   MAX LV                256
   Cur LV                8
   Open LV               7
   Max PV                256
   Cur PV                15
   Act PV                15
   VG Size               27.74 TB
   PE Size               32.00 MB
   Total PE              909076
   Alloc PE / Size       905658 / 27.64 TB
   Free  PE / Size       3418 / 106.81 GB

I'm only mostly (rather than completely) convinced of the  
righteousness of this approach, but it's been working for us, give or  
take a dramatic episode that we never managed to completely diagnose  
(the SCSI layer blew up in a way that acted like a hardware failure,  
but with ultimately no clear evidence that the heart of the fault  
wasn't an XFS corruption and no real device problem).  We have lost  
and replaced drives in the RAID arrays, though it is a little heart- 
stopping.

We're doing no meaningful fail-over, other than having a second  
server configured and ready to replace the primary one in the case of  
server catastrophe (which has happened).  No multipathing, no  
clustering.

Any commentary on the appropriateness of this approach?  Occasionally  
I look over at ZFS and the way it collapses the software stack to a  
single component, and get a little jealous...

Regards,
Andy Boyko    andy@boyko.net


On Sep 20, 2006, at 10:48 AM, Alexander Lazarevich wrote:

> I should have been more clear. I'm not worried about LVM on one  
> RAID. My questions is specifically about creating an LVM volume  
> group ACROSS two RAID's.
>
> For example, we have a 64bit linux server, with two different RAID  
> devices attached to the host via Fiber. These RAID's are each 4TB  
> volumes. The RAID is attached as /dev/sda and /dev/sdb. What I'm  
> asking about is creating a LVM volume group, and joining /dev/sda  
> AND /dev/sdb to that same volume group, creating the lv of 8TB  
> (minus overhead of course), and then creating a filesystem on that  
> lv. A 8TB filesystem, which is spanned (via LVM) across both RAID's.
>
> Does anyone here do that? Reading all the reply's I realize I  
> wasn't clear enough about that, and neither was anyone's responses.
>
> Alex
>
> On Wed, 20 Sep 2006, Matthew B. Brookover wrote:
>
>> I have used LVM on top of software raid and ISCSI.  It works  
>> well.  It
>> also helps keep track of what device is where.  ISCSI does not export
>> its targets in the same order, some times sdb shows up as  
>> sdc....   LVM
>> will keep track of what is what.
>>
>> Matt
>>
>> On Tue, 2006-09-19 at 16:53 -0500, Alexander Lazarevich wrote:
>>
>>> We have several RAID devices (16-24 drive Fiber/SCSI attached  
>>> RAID) which
>>> are currently single devices on our 64bit linux servers (RHEL-4,  
>>> core5).
>>> We are considering LVM'ing 2 or more of the RAID's into a LVM  
>>> group. I
>>> don't doubt the reliability and robustness of LVM2 on single  
>>> drives, but I
>>> worry about it on top of RAID devices.
>>>
>>> Does anyone have any experience with LVM on to of RAID volumes,  
>>> positive
>>> or negative?
>>>
>>> Thanks,
>>>
>>> Alex
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
