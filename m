Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8G9ZLr06684
	for <linux-lvm@redhat.com>; Thu, 16 Sep 2004 05:35:21 -0400
Received: from homer.hilling.de (homer.hilling.de [62.8.210.228])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8G9ZEgI031982
	for <linux-lvm@redhat.com>; Thu, 16 Sep 2004 05:35:15 -0400
Subject: Re: [linux-lvm] snapshot on 6.8.5/FC development
From: Gunnar Hilling <gunnar@hilling.de>
In-Reply-To: <20040916072317.GA29048@server.klaube.net>
References: <1095296187.4750.12.camel@nelson.hilling.de>
	<20040916072317.GA29048@server.klaube.net>
Date: Thu, 16 Sep 2004 11:35:09 +0200
Message-Id: <1095327310.4750.14.camel@nelson.hilling.de>
Mime-Version: 1.0
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
To: Thomas Klaube <t.klaube@efm.de>, LVM-Mailinglist <linux-lvm@redhat.com>


Thanks,

But no, it's not my root filesystem. Seems that the snapshot feature
ist, well, not quite ready for use.

-Gunnar


> On Thu, Sep 16, 2004 at 02:56:27AM +0200, Gunnar Hilling wrote:
> > Hello,
> 
> Hi,
> 
> > 
> > I just tried the lvm2/dm-snapshot feature and failed miserably...
> > After reading some older postings in this and the dm-devel mailing lists
> > I'm not sure what to do:
> > 
> 
> [...]
> 
> > 
> > lvcreate --snapshot --size 100m --name snap /dev/TestMirrorGroup/OnlineVol
> > 
> > will block forever. I have to reboot the computer. After
> > that /dev/TestMirrorGroup/snap is there...
> 
> /dev/TestMirrorGroup/OnlineVol is your root filesystem? I have the same
> problem. Snapshots on other (non root fs) work for me. 
> 
> AFAIK snapshots and pvmove do not work on the filesystem where the lvm-tools
> reside. I hope this will change in the (not so distant) future as I 
> need snapshots on root-fs. 
> 
> regards
> Thomas 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
