Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9DHkZqg005135
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 13:46:35 -0400
Received: from mta4.adelphia.net (mta4.adelphia.net [68.168.78.184])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9DHkOJx014012
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 13:46:25 -0400
Received: from mail.waldo.home ([69.175.168.186]) by mta11.adelphia.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20061013174608.KSPJ2152.mta11.adelphia.net@mail.waldo.home>
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 13:46:08 -0400
Received: from [127.0.0.1] (mail.waldo.home [10.0.0.4])
	by mail.waldo.home (Postfix) with ESMTP id 075F9EBC2C
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 13:46:03 -0400 (EDT)
Message-ID: <452FD0DC.5030904@waldoware.com>
Date: Fri, 13 Oct 2006 13:46:04 -0400
From: Paul Waldo <pwaldo@waldoware.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Unable to add new drive to LV
References: <200610130827.42040.pwaldo@waldoware.com>	<452FB129.7020208@gmx.net>
	<452FBCAA.4080000@redhat.com>
In-Reply-To: <452FBCAA.4080000@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Bryn M. Reeves wrote:
[snip]
> 
> The problem here is that the LV is using striped allocation across 3 PVs:
[snip]
> 
> So, in order to extend it and maintain that allocation, you need to have
> 3 PVs with sufficient space to allocate three parallel stripes.
> 
> Cheers,
> 
> Bryn.
Thanks for the reply, Bryn.

OK, I'm confused.

The LVM Howto says "In LVM 2, striped LVs can be extended by concatenating 
another set of devices onto the end of the first set. So you can get into a 
situation where your LV is a 2 stripe set concatenated with a linear set 
concatenated with a 4 stripe set. Are you confused yet?"

I interpret the above to mean that I can concatenate the single drive after 
the existing stripped array.  Is that an incorrect interpretation?

Being as this LV stores backups, I don't really care too much that it is 
stripped--my goal is to have lots of disk space.  Is my only option trashing 
the existing LV and making it contiguous (non-stripped)?  Thanks!

Paul
