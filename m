Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9SIsfr06818
	for <linux-lvm@redhat.com>; Thu, 28 Oct 2004 14:54:41 -0400
Received: from nexredback-216-168-119-94.nexicom.net
	(nexredback-216-168-119-94.nexicom.net [216.168.119.94])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id i9SIsYwn020536
	for <linux-lvm@redhat.com>; Thu, 28 Oct 2004 14:54:35 -0400
Message-ID: <41814060.4040400@mikebabcock.ca>
Date: Thu, 28 Oct 2004 14:54:24 -0400
From: "Michael T. Babcock" <mike@mikebabcock.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Software raid on top of lvm logical volume
References: <41801ADE.6030308@monjoin.net> <20041028011738.GD13737@kluge.net>
In-Reply-To: <20041028011738.GD13737@kluge.net>
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

Theo Van Dinter wrote:

>On Thu, Oct 28, 2004 at 12:02:06AM +0200, Eric Monjoin wrote:
>  
>
>>I would like to know if it's possible (works perfectly) to create a 
>>software mirror (md0) on top of  2 LVM logical volumes :
>>    
>>
>
>You'd usually want to make your raid devices first, then put LVM on
>top of it.  I can't really think of any benefits of doing it the other
>way around.
>  
>

I've thought about this numerous times -- there is the distinct resizing 
advantage.  Namely, if I create a software RAID partition, I can't 
resize it afterward without destroying it.  I have for example, on 
occasion, had three disks set up where 1/3 of each was devoted to a 
RAID-0 very fast striping set for data transfers that had to be fast but 
if they were lost it wasn't critical, and 2/3 was set up as RAID-5 for 
reliability of another set of data.

I understand this may not be optimal in some situations, but some of us 
don't have thousands of dollars for SCSI HW RAID controllers.
-- 
Michael T. Babcock
