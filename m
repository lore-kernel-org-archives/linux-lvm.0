Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2EI9ulD017336
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2011 14:09:56 -0400
Received: from eastrmfepo102.cox.net (eastrmfepo102.cox.net [68.230.241.214])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2EI9kHQ003423
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2011 14:09:47 -0400
Received: from eastrmimpo02.cox.net ([68.1.16.120]) by eastrmfepo102.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP id
	<20110314180944.QBPI32426.eastrmfepo102.cox.net@eastrmimpo02.cox.net>
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2011 14:09:44 -0400
Message-ID: <4D7E59E7.3090203@cox.net>
Date: Mon, 14 Mar 2011 13:09:43 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
References: <4D7E4689.9060300@cox.net>
	<20110314171726.GA18249@redhat.com>	<4D7E5144.7060200@gmail.com>
	<20110314180250.GA18622@redhat.com>
In-Reply-To: <20110314180250.GA18622@redhat.com>
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

On 03/14/2011 01:02 PM, Mike Snitzer wrote:
> On Mon, Mar 14 2011 at  1:32pm -0400,
> Les Mikesell<lesmikesell@gmail.com>  wrote:
>
>> On 3/14/2011 12:17 PM, Mike Snitzer wrote:
>>>
>>>> Is there any concern with mixing 4KB-sector drives with 512-byte
>>>> sector drives in the same LV?
>>>
>>> Both LVM2 and Device Mapper have been updated to accommodate stacking
>>> such a mix of drives.
>>>
>>> See this for a bit more detail:
>>> http://people.redhat.com/msnitzer/docs/io-limits.txt
>>>
>>> Particularly, the "Stacking I/O Limits" section.
>>>
>>> The concern raised for partial (4k) writes to the 512b drive was
>>> discussed a bit more here: http://lkml.org/lkml/2010/2/22/295
>>
>> Are there any version-level hints about when/where these changes
>> appear and come together in the real world (i.e. distributions like
>> RHEL, debian, Ubuntu)?
>
> For the kernel, the bulk of associated infrastructure (ata, scsi, block,
> dm, md, etc) went in 2.6.31, 2.6.32 saw some improvements, and 2.6.33
> and 2.6.34 saw a few bug fixes.
>
> v2.6.32.11 saw a backport of the 2.6.33 and 2.6.34 bug fixes via commit
> 9b2ff97
>
> RHEL6 has all this.  I cannot speak for debian and/or Ubuntu.
>
> As for LVM2, you'd want>= 2.02.62.
>

Thanks...

$ cat /etc/debian_version
wheezy/sid

$ /sbin/lvm version
   LVM version:     2.02.84(2) (2011-02-09)
   Library version: 1.02.63 (2011-02-09)

$ uname -r
2.6.37-2-amd64

-- 
I prefer banana-flavored energy bars made from tofu.
