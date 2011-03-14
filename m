Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2EJEBJv004980
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2011 15:14:11 -0400
Received: from eastrmfepo201.cox.net (eastrmfepo201.cox.net [68.230.241.216])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2EJE2qH020070
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2011 15:14:02 -0400
Received: from eastrmimpo02.cox.net ([68.1.16.120]) by eastrmfepo201.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP id
	<20110314191401.RVSC32549.eastrmfepo201.cox.net@eastrmimpo02.cox.net>
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2011 15:14:01 -0400
Message-ID: <4D7E68F6.5040700@cox.net>
Date: Mon, 14 Mar 2011 14:13:58 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
References: <4D7E4689.9060300@cox.net> <20110314171726.GA18249@redhat.com>
In-Reply-To: <20110314171726.GA18249@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Advanced Format disks mixed with regular disks?
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

On 03/14/2011 12:17 PM, Mike Snitzer wrote:
> On Mon, Mar 14 2011 at 12:47pm -0400,
> Ron Johnson<ron.l.johnson@cox.net>  wrote:
>
>> Hi,
>>
>> Is there any concern with mixing 4KB-sector drives with 512-byte
>> sector drives in the same LV?
>
> Both LVM2 and Device Mapper have been updated to accommodate stacking
> such a mix of drives.
>
> See this for a bit more detail:
> http://people.redhat.com/msnitzer/docs/io-limits.txt
>
> Particularly, the "Stacking I/O Limits" section.
>
> The concern raised for partial (4k) writes to the 512b drive was
> discussed a bit more here: http://lkml.org/lkml/2010/2/22/295
>

Does this mean that util-linux v2.17.1 fdisk correctly handle AF 
disks?  (Note that I will *not* be booting off an AF device.)

ftp://ftp.kernel.org/pub/linux/utils/util-linux/v2.17/v2.17.1-ReleaseNotes

fdisk:
    - cleanup alignment, default to 1MiB offset  [Karel Zak]
    - don't check alignment_offset against geometry  [Karel Zak]
    - fallback for topology values  [Karel Zak]
    - fix ALIGN_UP  [Karel Zak]
    - fix check_alignment()  [Karel Zak]
    - fix default first sector  [Karel Zak]
    - use "optimal I/O size" in warnings  [Karel Zak]
    - use 1MiB offset and grain always when possible  [Karel Zak]
    - use more elegant way to count and check alignment  [Karel Zak]
    - use optimal_io_size  [Karel Zak]

-- 
I prefer banana-flavored energy bars made from tofu.
