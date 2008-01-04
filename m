Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m040Voro010025
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2008 19:31:50 -0500
Received: from mailgw.soe.ucsc.edu (mailgw.cse.ucsc.edu [128.114.48.9])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m040VKrJ027320
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2008 19:31:20 -0500
Received: from [128.114.56.35] (wraith.cse.ucsc.edu [128.114.56.35])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailgw.soe.ucsc.edu (Spam Firewall) with ESMTP id 92F8741369C
	for <linux-lvm@redhat.com>; Thu,  3 Jan 2008 16:31:18 -0800 (PST)
Message-ID: <477D7E55.3050003@soe.ucsc.edu>
Date: Thu, 03 Jan 2008 16:31:17 -0800
From: Erich Weiler <weiler@soe.ucsc.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to 'copy' a volume?
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
To: linux-lvm@redhat.com

Greetings all-

I have a problem I'm trying to solve, was hoping someone would know how 
to get around it...

I have a 2TB volume group, and one 500GB volume in it.  There is a Xen 
VM in that volume group.  What I'd like to do is 'copy' the volume and 
name it something else so I can use it as a 'template' for other VMs.

I know that LVM has the 'snapshot' capability.  But this doesn't look 
like it's what I need, as I don't want my duplicate volume to have any 
affiliation with the original at all.  I actually want to duplicate VM 
to take up just as much space as the first and be completely independent 
of any changes on the first.  Is there a way of achieving this?  Could I 
maybe simply make sure the volume is unmounted and not in use, then copy 
the /dev/mapper/myvolume file to something else?  I bet it's more 
involved than that...  :)

Thanks in advance for any info!!

-erich
