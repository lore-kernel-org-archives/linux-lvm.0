Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA662643E7
	for <linux-lvm@redhat.com>; Wed,  3 Apr 2019 21:58:48 +0000 (UTC)
Received: from smtp-out-1.mxes.net (smtp-out-1.mxes.net [205.237.194.119])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EE093082B5A
	for <linux-lvm@redhat.com>; Wed,  3 Apr 2019 21:58:47 +0000 (UTC)
References: <819376bf-9ee7-b700-6057-6e8035c0e0e8@gmail.com>
	<23716.3863.42782.886096@quad.stoffel.home>
From: Andrew Luke Nesbit <email@andrewnesbit.org>
Message-ID: <bda0a468-0d92-22d8-fe3a-825b37e69790@andrewnesbit.org>
Date: Wed, 3 Apr 2019 22:58:43 +0100
MIME-Version: 1.0
In-Reply-To: <23716.3863.42782.886096@quad.stoffel.home>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM RAID10 busy 100%
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>, John Stoffel <john@stoffel.org>

On 03/04/2019 02:40, John Stoffel wrote:

[...]

> I'd probably re-do the RAID using RAID4 (fixed parity disk) since
> you're (probably) just doing a bunch of writing of video files, which
> are large streaming writes, so you won't pay the penalty of the
> Reade/Modify/Write cycle that RAID4/5 has with lots of small files
> being writteing.  But I'd also be using MD under-neath LVM, with XFS on
> top.  Something like this:
>
>   1.   partition each disk with a single whole disk partition
>   2.   mdadm --create /dev/md0 --level=raid4 --raid-devices=8
/dev/sd[a,b,c,e,f,g,k,l]1
>   3.   pvcreate /dev/md0
>   4.   vgcreate data /dev/md0
>   5.   lvcreate -L +12T -n data data
>   6.   mkfs.xfs /dev/mapper/data-data

Why would you explicitly use MD underneath LVM?  I have compared the two
from a user's level and a best practices perspective.  My understanding
is that LVM uses MD for its low level operations anyway.

What do we gain by using `mdadm --create` instead of using the
equivalent LVM commands to set up the RAID array?

Andrew
