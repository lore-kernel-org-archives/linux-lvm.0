Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2Q4qpLp012501
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 00:52:51 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2Q4qkQT022733
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 00:52:46 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p2Q4qjQZ024856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 00:52:45 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p2Q4qiGw026067
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 00:52:44 -0400
Date: Sat, 26 Mar 2011 00:52:44 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D8D6EAF.8050403@cox.net>
Message-ID: <alpine.LRH.2.00.1103260047590.26023@bmsred.bmsi.com>
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>
	<4D8D6EAF.8050403@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Powerfailure and snapshot consistency
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 25 Mar 2011, Ron Johnson wrote:

> On 03/25/2011 11:24 PM, Stuart D. Gathman wrote:
> [snip]
>> 
>> 2) make sure important LVs do not span multiple PVs (except for LVM
>> mirroring) - you could be unhappy in the event of a system crash.
>> 
>
> But isn't "volumes larger than physical devices" (one of) the raison d'etre 
> of LVM?

Yes, but a power failure can then mess up the ordering of write completions
distributed between 2 or more PVs, which could defeat the assumptions made
by your file system journaling.

and

No, YMMV, but I generally have a number of smaller LVs (for virtual machines)
and it is nice to have a larger pool of PVs from which they are allocated.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
