Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kADExpJP018693
	for <linux-lvm@redhat.com>; Mon, 13 Nov 2006 09:59:51 -0500
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kADExjce032497
	for <linux-lvm@redhat.com>; Mon, 13 Nov 2006 09:59:49 -0500
Received: from wolverine (unknown [192.168.1.127])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id 2C1CA12EDE
	for <linux-lvm@redhat.com>; Mon, 13 Nov 2006 14:59:16 +0000 (GMT)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] Contents of read-only LVM snapshot change
Date: Mon, 13 Nov 2006 15:01:11 -0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20061111130342.D3F6F12EE1@bluewhale.planbit.co.uk>
Message-Id: <20061113145916.2C1CA12EDE@bluewhale.planbit.co.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

More information...

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Roger Lucas
> Sent: 11 November 2006 13:06
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] Contents of read-only LVM snapshot change
> 
> Hi,
> 
> I am seeing the (very) unexpected behaviour where the contents of a read-only snapshot change.
> 
> I am running a Debian-based system, mostly Sarge, but with an updated Kernel and LVM as below:
> 
> dromedary:~# lvm version
>   LVM version:     2.02.07 (2006-07-17)
>   Library version: 1.02.08 (2006-07-17)
>   Driver version:  4.5.0
> dromedary:~# uname -a
> Linux dromedary 2.6.16.20.rwl2 #1 Wed Jul 26 12:52:43 BST 2006 i686 GNU/Linux
> dromedary:~#
> 

I have tried updating to the 2.02.14 LVM and the 1.02.12 device mapper (compiled from source from the FTP site).  The first couple
of tests have run correctly so it looks like this may have resolved the issue, but I am continuing to run tests to confirm this.

Can anyone shed some light on what may be going on?  I have checked the changelogs for the LVM/DM code and there doesn't seem to be
any change that is a strong candidate as the fix of the problem.

Thanks,

Roger
