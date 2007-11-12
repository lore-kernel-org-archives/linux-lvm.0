Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lACMs9SQ020242
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 17:54:09 -0500
Received: from fmailhost02.isp.att.net (fmailhost02.isp.att.net
	[207.115.11.52])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lACMs2n1008191
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 17:54:02 -0500
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id 17EEE17FB07
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 17:53:56 -0500 (EST)
Received: from bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-maia, port 10024)
	with LMTP id 13517-03 for <linux-lvm@redhat.com>;
	Mon, 12 Nov 2007 17:53:55 -0500 (EST)
Date: Mon, 12 Nov 2007 17:53:55 -0500
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [linux-lvm] Beginner Questions
Message-ID: <20071112225355.GA13538@bdmcc-us.com>
References: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88A@an-ex.ActiveNetwerx.int>
	<20071112215854.GU22843@agk.fab.redhat.com>
	<1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88C@an-ex.ActiveNetwerx.int>
	<20071112223338.GV22843@agk.fab.redhat.com>
	<1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88D@an-ex.ActiveNetwerx.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88D@an-ex.ActiveNetwerx.int>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 12, 2007 at 03:48:27PM -0700, Joseph L. Casale wrote:
> Pvs -v
>   /dev/sdb1  iSCSI_dvr  lvm2 a-   744.99G 744.99G 745.00G yQyVCe-tiS4-Ma1E-hilJ-niuG-KXL9-jkKVIk
>   /dev/sdc1  iSCSI_dvr  lvm2 a-     1.36T   1.36T   1.36T PURHhY-Lo1T-5bif-HjGP-dP3o-NVTs-71ZKUm
> 
> Still baffling me is that fdisk -l shows:
> Disk /dev/sdc: 1499.9 GB, 1499998453760 bytes
> 255 heads, 63 sectors/track, 182364 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> 
>    Device Boot      Start         End      Blocks   Id  System
> /dev/sdc1               1      182364  1464838798+  8e  Linux LVM
> 
> And 1499.9 GB = ~1.46 terabytes


This is an old, and easy, one to answer.  You will notice in your first
line of fdisk output, the 14xxx bytes value, which matches the "1499.9
GB" value just before it.

What you are seeing is the difference between GigaBytes that are made up
of 1000 * 1000 * 1000 and gigabytes that are made up of 1024 * 1024 *
1024 bytes.



Hope that helps,
Brian
