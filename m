Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26C618796A
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 20:54:07 +0000 (UTC)
Received: from mail.stoffel.org (mail.stoffel.org [104.236.43.127])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E348180C0C
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 20:54:03 +0000 (UTC)
Received: from quad.stoffel.org (66-189-75-104.dhcp.oxfr.ma.charter.com
	[66.189.75.104])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 4DBC6602C4
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 16:45:57 -0400 (EDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <23022.21764.968838.764670@quad.stoffel.home>
Date: Mon, 23 Oct 2017 16:45:56 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <6897ab24-f558-33c6-511a-5d2bc3f4967b@member.fsf.org>
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
	<23016.63588.505141.142275@quad.stoffel.home>
	<beac3436-06a8-9365-4934-9db1a1f9ed34@member.fsf.org>
	<20171021025459.GD31049@redhat.com>
	<6897ab24-f558-33c6-511a-5d2bc3f4967b@member.fsf.org>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "Oleg" == Oleg Cherkasov <o1e9@member.fsf.org> writes:

Oleg> On 21. okt. 2017 04:55, Mike Snitzer wrote:
>> On Thu, Oct 19 2017 at  5:59pm -0400,
>> Oleg Cherkasov <o1e9@member.fsf.org> wrote:
>> 
>>> On 19. okt. 2017 21:09, John Stoffel wrote:
>>>> 
>> 
>> So aside from SAR outout: you don't have any system logs?  Or a vmcore
>> of the system (assuming it crashed?) -- in it you could access the
>> kernel log (via 'log' command in crash utility.

Oleg> Unfortunately no logs.  I have tried to see if I may recover dmesg 
Oleg> however no luck.  All logs but the latest dmesg boot are zeroed.  Of 
Oleg> course there are messages, secure and others however I do not see any 
Oleg> valuable information there.

Oleg> System did not crash, OOM were going wind however I did manage to 
Oleg> Ctrl-Alt-Del from the main console via iLO so eventually it rebooted 
Oleg> with clean disk umount.

Bummers.  Maybe you can setup a syslog server to use to log verbose
kernel logs elsewhere, including the OOM messages?  

>> 
>> More specifics on the workload would be useful.  Also, more details on
>> the LVM cache configuration (block size?  writethrough or writeback?
>> etc).

Oleg> No extra params but specifying mode writethrough initially.
Oleg> Hardware RAID1 on cache disk is 64k and on main array hardware
Oleg> RAID5 128k.

Oleg> I had followed precisely documentation from RHEL doc site so lvcreate, 
Oleg> lvconvert to update type and then lvconvert to add cache.

Oleg> I have decided to try writeback after and shifted cachemode to it with 
Oleg> lvcache.

>> I'll be looking very closely for any sign of memory leaks (both with
>> code inspection and testing while kemmleak is enabled).
>> 
>> But the more info you can provide on the workload the better.

Oleg> According to SAR there are no records about 20min before I reboot, so I 
Oleg> suspect SAR daemon failed a victim of OOM.

Maybe if you could take a snapshot of all the processes on the system
before you run the test, and then also run 'vmstat 1' to a log file
while running the test?

As a wierd thought... maybe it's because you have a 1gb meta data LV
that's causing problems?  Maybe you need to just accept the default
size?

It might also be instructive to make the cache be just half the SSD in
size and see if that helps.  It *might* be that as other people have
mentioned, that your SSD's performance drops off a cliff when it's
mostly full.  So reducing the cache size, even to only 80% of the size
of the disk, might give it enough spare empty blocks to stay
performant?

John
