Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8EEnnr14108
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 10:49:49 -0400
Received: from bedevere.spamaps.org (ip-65-77-168-70-muca.aerosurf.net
	[65.77.168.70])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8EEnmEI020268
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 10:49:48 -0400
Received: from [172.16.129.47] (helo=spamaps.org)
	by bedevere.spamaps.org with esmtp (Exim 3.35 #1 (Debian))
	id 1C7Ect-0007AN-00
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 07:49:47 -0700
Date: Tue, 14 Sep 2004 07:49:45 -0700
Subject: Re: [linux-lvm] massive LV corruption
Mime-Version: 1.0 (Apple Message framework v553)
From: Clint Byrum <cbyrum@spamaps.org>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040914124540.GA13649@copilotconsulting.com>
Message-Id: <51D9A0D8-065D-11D9-BB02-000A95730E92@spamaps.org>
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


On Tuesday, September 14, 2004, at 05:45 AM, Tracy R Reed wrote:

> On Mon, Sep 13, 2004 at 10:45:55PM -0700, Clint Byrum spake thusly:
>> I've never used resize_reiserfs, but I do know that a lot of people I
>> talk to won't use ReiserFS because of past problems that have since
>> been fixed. The tools that come with ReiserFS are generally very good.
>
> I'm pretty sure it can't possibly be reiserfs because the actual lv's 
> were
> hosed. The LVM/block layer should prevent resize_reiserfs or any part 
> of
> reiserfs from damaging the lv's. I love reiser and have used it with 
> great
> success for years. I find it sad that people still pan reiserfs after 
> all

Just wanted to say that I don't pan ReiserFS, as I have never had 
problems like others did when it was still very new and there were 
problems keeping it in sync with the mainline kernel. I don't use 
ReiserFS v3 because, while very fast for workstations, it has major 
problems with concurrant write accesses.

Hans Reiser has stated that this is because each filesystem has a lock 
on it, so while writing to, say, /home/cvs, anybody else who wants to 
write to /home/cvs will have to wait. We have a CVS server where the 
CVS trees and home dirs are on two seperate logical volumes, and this 
locking scheme *HURTS* when two people are trying to do a cvs update. 
CVS writes a "read lock" file to each cvs directory, and some temp 
files in the working copy. Combine this with vim writing to its "swap" 
files all the time.. the box sometimes comes to a screeching halt for 
all users for almost a minute as they get in line with the filesystem 
locks.

That said, this ReiserFS+LVM1 system (redhat 8.0) has never had any 
data issues. :-P

> this time. I am really looking forward to reiser4 (released already 
> but I
> want to see it get some more time behind it) and some cool plugins for 
> it.
> I have a feeling it is going to do for Linux what MS claims WinFS will
> (someday) do for their OS.
>

Yes, bring it on. I plan to convert some workstations to it first.. 
then home server.. then non critical work servers.. the usual 
progression before production.

>> If I had to blame one thing, I'd blame the heavily hacked 2.4 kernel
>> that came with Fedora. :-P
>
> I suspect this is the case. I am using Fedora Core 2 with a 
> 2.6.something
> (exact kernel version in the typescript file from my original posting)
> kernel and that seems to be the most likely culprit. However, I doubt
> anyone from RedHat is going to take an interest because this isn't
> reproduceable. That is to say, I am not going to trash my box again to
> reproduce it.
>

You said you were running 2.4.22.nptl or something.
d
