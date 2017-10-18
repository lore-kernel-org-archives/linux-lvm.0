Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23ADBC14BC
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2017 13:33:40 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6FC75C000BBD
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2017 13:33:39 +0000 (UTC)
Received: from wiki.gathman.org (wiki.gathman.org [IPv6:2001:470:8:809::2])
	(authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id v9IDXUiZ027627
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2017 09:33:38 -0400
Date: Wed, 18 Oct 2017 09:33:30 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <b3ac5f10-c2f5-621b-71bc-151ae3114827@libertytrek.org>
Message-ID: <alpine.LRH.2.21.1710180927420.12280@fairfax.gathman.org>
References: <cdc20ea7-200b-d998-a7f5-85ed622e84e2@yahoo.co.uk>
	<23013.8606.182033.796766@quad.stoffel.home>
	<4195b442-7241-1415-64bd-c626e0e7f4ef@yahoo.co.uk>
	<alpine.LRH.2.21.1710171644400.1285@fairfax.gathman.org>
	<b3ac5f10-c2f5-621b-71bc-151ae3114827@libertytrek.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] raid10 to raid what? - convert
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 18 Oct 2017, Tanstaafl wrote:

>
>> and is not the same as raid1+0 (raid1 on top of raid0).
>
> Not according to everything I've ever read about it... for example:

https://en.wikipedia.org/wiki/Non-standard_RAID_levels#Linux_MD_RAID_10

>> But this is not certain as raid10 works perfectly well with 2 or 3
>> disks, including the redundancy.
> You must be talking about something else... RAID10 requires at least 4
> disks, and always an even number, although most RAID controllers support
> the designation of at least one hot spare (so it will auto-rebuild using
> the hot spare in the event of a failure). Been using this configuration
> in my 5 drive QNAP NAS's for along time.

Yep.  Not talking about raid1+0

Linux raid10 really ought to be a "standard" - and effectively is.
I use it whenever I can (with only 2 disks I use raid1 so I can alias
the legs as non-raid).

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flamis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
