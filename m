Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA00E5D9CB
	for <linux-lvm@redhat.com>; Fri, 22 Sep 2017 08:30:25 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AC6013A53
	for <linux-lvm@redhat.com>; Fri, 22 Sep 2017 08:30:17 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.signet.nl (Postfix) with ESMTP id 1B098636BC
	for <linux-lvm@redhat.com>; Fri, 22 Sep 2017 10:30:15 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 22 Sep 2017 10:30:15 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <CAHEKYV68yfVGbTCeC4=4J6mde=WBkgwtuQX+GY8otPm6fW9Sfw@mail.gmail.com>
References: <CAHEKYV68yfVGbTCeC4=4J6mde=WBkgwtuQX+GY8otPm6fW9Sfw@mail.gmail.com>
Message-ID: <38eaacbdb4572351072f91de19ee8413@xenhideout.nl>
Subject: Re: [linux-lvm] Restoring snapshot gone bad
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
To: linux-lvm@redhat.com

Mauricio Tavares schreef op 22-09-2017 8:03:
> I have a lv, vmzone/desktop that I use as drive for a kvm guest;
> nothing special here. I wanted to restore its snapshot so like I have
> done many times before I shut guest down and then
> 
> lvconvert --merge vmzone/desktop_snap_20170921
>   Logical volume vmzone/desktop is used by another device.
>   Can't merge over open origin volume.
>   Merging of snapshot vmzone/desktop_snap_20170921 will occur on next 
> activation
>  of vmzone/desktop.
> 
> What is it really trying to tell me? How to find out which other
> device is using it?

Other people will have better answers but I think it will be hard to see 
unless it is used by the device mapper for some target.

I hope there is a better answer.

But obviously the "o" means open volume (ie. mounted or something else) 
and that means that if you can't find a way to close it next time you 
boot the machine it will get merged?

I hope there is a good way to get your usage information (apart from 
something like "lsof").

Regards.
