Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9E5npr12912
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 01:49:51 -0400
Received: from bedevere.spamaps.org (ip-65-77-168-70-muca.aerosurf.net
	[65.77.168.70])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9E5nj1F015836
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 01:49:45 -0400
Received: from [172.16.129.47] (helo=spamaps.org)
	by bedevere.spamaps.org with esmtp (Exim 3.35 #1 (Debian))
	id 1CHyUi-0002AU-00
	for <linux-lvm@redhat.com>; Wed, 13 Oct 2004 22:49:44 -0700
Date: Wed, 13 Oct 2004 22:49:41 -0700
Subject: Re: [linux-lvm] How can I restripe LVs on addition of extra PVs?
Mime-Version: 1.0 (Apple Message framework v553)
From: Clint Byrum <cbyrum@spamaps.org>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20041014011250.CF9EC164005@ws1-4.us4.outblaze.com>
Message-Id: <D7F9CB17-1DA4-11D9-82ED-000A95730E92@spamaps.org>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wednesday, October 13, 2004, at 06:12 PM, Daniel . wrote:

> Hi,
>
> [I'm only familiar with LVM1, so that's what I'm referring to in the 
> rest of the mail.  I probably could move to LVM2 if it solves my 
> problems.]
>
> I'm planning on using LVM to create LVs striped across multiple PVs 
> (which, incidentally, are RAID 1 mirrorred partitions).
> In the future I will need to add extra PVs to the VG and extend the 
> LVs.
>

This just came up in #lvm on freenode today. I don't think this is at 
all possible with LVM1. Once the striping is done for an LV, that LV 
cannot be extended past the physical extents that were allocated at 
that time.

However, with LVM2, you could write a script to do this by manually 
running pvmove over and over, doing something like "pvmove dev:1-8 
otherdev;pvmove otherdev:1-8 dev;" .. It gets rather complex to figure 
this out on the cmdline, but I do believe it can be done and you would 
end up with PE's evenly spread out over all PVs.

Somebody tell me this is wrong and stupid before I try it. ;)
