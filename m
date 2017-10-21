Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6CC35D963
	for <linux-lvm@redhat.com>; Sat, 21 Oct 2017 14:10:40 +0000 (UTC)
Received: from erato-smout.broadpark.no (erato-smout.broadpark.no
	[80.202.10.26])
	by mx1.redhat.com (Postfix) with ESMTP id DAC58C057FA1
	for <linux-lvm@redhat.com>; Sat, 21 Oct 2017 14:10:37 +0000 (UTC)
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Received: from osl1cloudm2.nextgentel.net ([80.202.10.59])
	by erato-smout.broadpark.no
	(Oracle Communications Messaging Server 7u4-27.01(7.0.4.27.0) 64bit
	(built Aug
	30 2012)) with ESMTP id <0OY600L3YFAEVC80@erato-smout.broadpark.no> for
	linux-lvm@redhat.com; Sat, 21 Oct 2017 16:10:36 +0200 (CEST)
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
	<23016.63588.505141.142275@quad.stoffel.home>
	<beac3436-06a8-9365-4934-9db1a1f9ed34@member.fsf.org>
	<20171021025459.GD31049@redhat.com>
From: Oleg Cherkasov <o1e9@member.fsf.org>
Message-id: <6897ab24-f558-33c6-511a-5d2bc3f4967b@member.fsf.org>
Date: Sat, 21 Oct 2017 16:10:36 +0200
In-reply-to: <20171021025459.GD31049@redhat.com>
Content-language: en-US
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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

On 21. okt. 2017 04:55, Mike Snitzer wrote:
> On Thu, Oct 19 2017 at  5:59pm -0400,
> Oleg Cherkasov <o1e9@member.fsf.org> wrote:
> 
>> On 19. okt. 2017 21:09, John Stoffel wrote:
>>>
> 
> So aside from SAR outout: you don't have any system logs?  Or a vmcore
> of the system (assuming it crashed?) -- in it you could access the
> kernel log (via 'log' command in crash utility.

Unfortunately no logs.  I have tried to see if I may recover dmesg 
however no luck.  All logs but the latest dmesg boot are zeroed.  Of 
course there are messages, secure and others however I do not see any 
valuable information there.

System did not crash, OOM were going wind however I did manage to 
Ctrl-Alt-Del from the main console via iLO so eventually it rebooted 
with clean disk umount.

> 
> More specifics on the workload would be useful.  Also, more details on
> the LVM cache configuration (block size?  writethrough or writeback?
> etc).

No extra params but specifying mode writethrough initially.  Hardware 
RAID1 on cache disk is 64k and on main array hardware RAID5 128k.

I had followed precisely documentation from RHEL doc site so lvcreate, 
lvconvert to update type and then lvconvert to add cache.

I have decided to try writeback after and shifted cachemode to it with 
lvcache.

> 
> I'll be looking very closely for any sign of memory leaks (both with
> code inspection and testing while kemmleak is enabled).
> 
> But the more info you can provide on the workload the better.

According to SAR there are no records about 20min before I reboot, so I 
suspect SAR daemon failed a victim of OOM.
