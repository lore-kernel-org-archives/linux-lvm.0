Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8E5kDr20376
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 01:46:13 -0400
Received: from bedevere.spamaps.org (ip-65-77-168-70-muca.aerosurf.net
	[65.77.168.70])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8E5k2ZY007759
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 01:46:07 -0400
Received: from [172.16.129.47] (helo=spamaps.org)
	by bedevere.spamaps.org with esmtp (Exim 3.35 #1 (Debian))
	id 1C768a-0005DF-00
	for <linux-lvm@redhat.com>; Mon, 13 Sep 2004 22:45:56 -0700
Date: Mon, 13 Sep 2004 22:45:55 -0700
Subject: Re: [linux-lvm] massive LV corruption
Mime-Version: 1.0 (Apple Message framework v553)
From: Clint Byrum <cbyrum@spamaps.org>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040914004607.GB9253@copilotconsulting.com>
Message-Id: <58B212CA-0611-11D9-BB02-000A95730E92@spamaps.org>
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


On Monday, September 13, 2004, at 05:46 PM, Tracy R Reed wrote:

> On Sat, Sep 11, 2004 at 04:08:30AM -0700, Tracy R Reed spake thusly:
>> I am running Fedora Core 1 with stock RedHat kernel 
>> 2.4.22-1.2188.nptl. I
>> filled my /usr/local to 100% and decided I needed some more space so 
>> I ran
>> the lvextend and resize_reiserfs commands like I have done many times
>
> Nobody has an opinion to offer? I've been a big fan of LVM for ages but
> this incident has really shaken my confidence in it. It is my
> understanding that all of the software I am using should be pretty 
> solid
> by now. I am hesitatnt to allow LVM operations on production systems
> anymore if this sort of thing can happen without explanation. :( I 
> would
> like to think I did something wrong but I've used lvextend and
> resize_reiserfs a number of times before on other machines without
> incident.
>

I've never used resize_reiserfs, but I do know that a lot of people I 
talk to won't use ReiserFS because of past problems that have since 
been fixed. The tools that come with ReiserFS are generally very good. 
Personally I only use ext3 or XFS on LVM because of ReiserFS's slowness 
when being written to by more than one process.

If I had to blame one thing, I'd blame the heavily hacked 2.4 kernel 
that came with Fedora. :-P
