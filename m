Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k55MxDRW021541
	for <linux-lvm@redhat.com>; Mon, 5 Jun 2006 18:59:13 -0400
Received: from amsfep12-int.chello.nl (amsfep17-int.chello.nl [213.46.243.15])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k55Mx1Xt028751
	for <linux-lvm@redhat.com>; Mon, 5 Jun 2006 18:59:02 -0400
Received: from laguna.nwhq.nl ([213.46.145.128]) by amsfep12-int.chello.nl
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP
	id <20060605225850.BIZF15576.amsfep12-int.chello.nl@laguna.nwhq.nl>
	for <linux-lvm@redhat.com>; Tue, 6 Jun 2006 00:58:50 +0200
Received: from [127.0.0.1] (velsatis.nwhq.nl [192.168.100.33])
	by laguna.nwhq.nl (8.13.6/8.13.4) with ESMTP id k55Mwn8B027564
	for <linux-lvm@redhat.com>; Tue, 6 Jun 2006 00:58:50 +0200
Message-ID: <4484B715.5040707@neuroweave.nl>
Date: Tue, 06 Jun 2006 00:58:29 +0200
From: Joep Blom <jlblom@neuroweave.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Is it better to use partitions or entire disk for LVM?
References: <1cbd6f830606040746j5af7c102y75d13748e4d2c627@mail.gmail.com>	<20060605223153.GA21795@redhat.com>
	<1149547428.14842.502.camel@server.ak.quickcircuit.co.nz>
In-Reply-To: <1149547428.14842.502.camel@server.ak.quickcircuit.co.nz>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Mario Becroft (mailing list) wrote:

>On Tue, 2006-06-06 at 00:31 +0200, Heinz Mauelshagen wrote:
>  
>
>>On Sun, Jun 04, 2006 at 10:46:45AM -0400, Mag Gam wrote:
>>    
>>
>>>Is it better to create 1 partition on a disk, and use that into the LVM, or
>>>have a blank disk, and use that in the LVM (if possible)?
>>>      
>>>
>>As long as we still need to live with partition tables, the advantage
>>of having 1 partition to create a PV on it is, that all related tools
>>(e.g. parted) *show* that there's an LVM partition.
>>    
>>
>
>Another reason for creating a partition (perhaps a silly one, but I have
>found it useful) is that discs from different vendors (or even the same
>vendor) that are supposedly the same size often vary slightly, so I find
>it useful to create a partition slightly smaller than the total size of
>the disc. This is a little wasteful of space, but means that if I need
>to drop in a replacement disc that is slightly smaller than the original
>one, I can just copy an image of the old disc and it will generally
>work--otherwise I would have to fiddle around with whatever was near the
>end of the old disc.
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>  
>
At least one partition of ~100 Mb is necessary as boot partition (grub 
cannot boot from an LVM and LILO is questionable). If you don't have to 
boot from the disk it's a question of taste. If I have a disk and fdisk 
tells me nothing is on it I try pvdisplay.
Joep
