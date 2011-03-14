Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2EHX5nj009132
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2011 13:33:05 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2EHWuW6018423
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2011 13:32:56 -0400
Received: from ns4.futuresource.com ([208.10.26.50])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id p2EHVwIS028271
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2011 12:31:59 -0500
Received: from [172.22.181.98] ([172.22.181.98])
	by ns4.futuresource.com (8.13.8/8.13.8) with ESMTP id p2EHWqco001307
	for <linux-lvm@redhat.com>; Mon, 14 Mar 2011 12:32:53 -0500
Message-ID: <4D7E5144.7060200@gmail.com>
Date: Mon, 14 Mar 2011 12:32:52 -0500
From: Les Mikesell <lesmikesell@gmail.com>
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

On 3/14/2011 12:17 PM, Mike Snitzer wrote:
>
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

Are there any version-level hints about when/where these changes appear 
and come together in the real world (i.e. distributions like RHEL, 
debian, Ubuntu)?

-- 
   Les Mikesell
    lesmikesell@gmail.com
