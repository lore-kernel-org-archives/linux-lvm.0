Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0SHcbtT002562
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 12:38:37 -0500
Received: from scidubsmtp03.stercomm.com (scidubsmtp03.stercomm.com
	[209.95.244.153])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0SHcGxe029483
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 12:38:16 -0500
Received: from IWDUBCORMSG002.sci.local (iwdubcormsg002.sci.local
	[10.105.142.32])
	by boamail2.stercomm.com (Postfix) with ESMTP id 51DFF33CE2
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 12:39:04 -0500 (EST)
Subject: Re: [linux-lvm] LVM limits?
From: Chris Cox <chris_cox@stercomm.com>
In-Reply-To: <479E2BEF.1090703@cesca.es>
References: <479DAD35.1080209@cesca.es>  <479E2BEF.1090703@cesca.es>
Content-Transfer-Encoding: 7bit
Date: Mon, 28 Jan 2008 11:38:14 -0600
Message-Id: <1201541894.30560.24.camel@behemoth.csg.stercomm.com>
Mime-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 2008-01-28 at 20:24 +0100, Jordi Prats wrote:
> Hi all,
> I found on a webpage this two sentences:
> 
> - The combination of 32-bit CPU and Linux kernel version 2.6.x, the
> limit of logical volume size is maximized at 16TB.
> 
> - For Linux kernel 2.6.x running on 64-bit CPU, the maximum LV size is
> 8EB (extremely terrible big storage for this time being!)
> 
> Are they right?

Ok.  But it's really impractical to have large multi-terabyte
single filesystem today.  What are you wanting to do?  Ever fsck a
2TB filesystem?  Consider yourself warned.

Or... were you just curious about the maximums?
