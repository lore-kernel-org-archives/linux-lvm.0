Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6B1OSel023058
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 21:24:28 -0400
Received: from Ishtar.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6B1ORWK002976
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 21:24:27 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p6B1ONcp009040
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 18:24:25 -0700
Message-ID: <4E1A50C7.5090006@tlinx.org>
Date: Sun, 10 Jul 2011 18:24:23 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4E19E3FD.9000805@tlinx.org>
	<20110710220815.GB7857@agk-dp.fab.redhat.com>
In-Reply-To: <20110710220815.GB7857@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Bug!  lvs shouldn't need 'root' access
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



Alasdair G Kergon wrote:
> On Sun, Jul 10, 2011 at 10:40:13AM -0700, Linda A. Walsh wrote:
>   
>> I could write to the darn things!, but all I NEED is read (hmmm
>>     
>
> I thought so too when we first began work on LVM, but - surprising 
> to me - there's been hardly any demand expressed for this feature.
>
> The proposed method of handling this was to accept dm ioctls on
> the actual devices themselves controlled by normal ioctl permissions.
>
> Currently, you need CAP_SYS_ADMIN (and access to /dev/mapper/control).
>   
----
   Why is CAP_SYS_ADMIN needed to access a disk device when device 
permissions
are already present for this?


    I can put myself for view purposes in a group disk and give an 
read-only access
to the disks as well as /dev/mapper/control.


    Being able to get status information out of the system shouldn't 
require CAP_SYS_ADMIN NOR write access -- ability t0 'read' should allow 
reading of
status.

with control by group.   CAP_SYS_ADMIN is poor control, since how do I set
CAP_SYS_ADMIN on my login and *only* have it allow reading ???

I don't.

Might as well run as root all the time.

Can this be revisited and a justification made why running "top" 
shouldn't require
sys_admin as well?
