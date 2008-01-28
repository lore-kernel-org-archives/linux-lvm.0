Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0SHQFK2025810
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 12:26:15 -0500
Received: from carlit.cesca.es (carlit.cesca.es [84.88.0.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0SHPXtp019591
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 12:25:34 -0500
Received: from carlit.cesca.es (localhost [127.0.0.1])
	by carlit.cesca.es (Postfix) with ESMTP id 6ACCC3321DE
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 18:25:28 +0100 (CET)
Received: from [213.97.212.36] (36.Red-213-97-212.staticIP.rima-tde.net
	[213.97.212.36])
	by carlit.cesca.es (Postfix) with ESMTP id 1D3D6331DB4
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 18:25:28 +0100 (CET)
Message-ID: <479E2BEF.1090703@cesca.es>
Date: Mon, 28 Jan 2008 20:24:31 +0100
From: Jordi Prats <jprats@cesca.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM limits?
References: <479DAD35.1080209@cesca.es>
In-Reply-To: <479DAD35.1080209@cesca.es>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,
I found on a webpage this two sentences:

- The combination of 32-bit CPU and Linux kernel version 2.6.x, the
limit of logical volume size is maximized at 16TB.

- For Linux kernel 2.6.x running on 64-bit CPU, the maximum LV size is
8EB (extremely terrible big storage for this time being!)

Are they right?

Thanks,
Jordi


Jordi Prats wrote:
> Hi all,
> I've been browsing LVM's wikis but I found no reference to LVM's limits.
> 
> How large can I create a VG? And a LV?
> 
> Thanks,
> Jordi
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
