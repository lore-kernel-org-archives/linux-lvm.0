Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i57IFl000317
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 14:15:47 -0400
Received: from p15141853.pureserver.info ([217.160.223.157])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i57IFji5002100
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 14:15:45 -0400
Received: from [217.231.15.135] (pD9E70F87.dip0.t-ipconnect.de
	[217.231.15.135])
	by p15141853.pureserver.info (Postfix) with ESMTP id DE98E4843C7
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2004 20:16:24 +0200 (CEST)
Message-ID: <40C4B0AF.9030007@blocked.name>
Date: Mon, 07 Jun 2004 20:15:11 +0200
From: philip <mail@blocked.name>
MIME-Version: 1.0
Subject: Re: [linux-lvm] software raid or lvm?
References: <40C48905.80608@blocked.name> <20040607153809.GM31405@kluge.net>
In-Reply-To: <20040607153809.GM31405@kluge.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

hi,
i'm sorry that i wasn't more clear. i used to have raid0 with the siimage binary 
driver, but that is only for 2.4 kernels. so i've to use software raid and i 
didn't find the way how to put lvm on top of software raid. or how can i do it?
however, in suse admin guide is written about lvm: 'several hard disks can be 
used with improved performance in the raid0 (striping) mode.' any idea? can i 
use lvm as raid0? course, the best is raid and lvm on top, but if i can use only 
lvm, how fast it would be? can i check the speed?
thank you
philip


Theo Van Dinter wrote:
> On Mon, Jun 07, 2004 at 05:25:57PM +0200, philip wrote:
> 
>>like to install suse91, which doesn't support siimage chipset, so i've to 
>>use software raid or lvm.
>>what would be better/faster?
> 
> 
> Well, what are you trying to do?  If you want redundancy, go with RAID.
> If you want volume management, go with LVM.  I'd say you should do both
> (RAID the disks then use LVM on top), but without more data there is no
> answer for "better/faster".
