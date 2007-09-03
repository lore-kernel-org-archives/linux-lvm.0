Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l83GHihl027673
	for <linux-lvm@redhat.com>; Mon, 3 Sep 2007 12:17:44 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l83GHaMf026127
	for <linux-lvm@redhat.com>; Mon, 3 Sep 2007 12:17:37 -0400
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id A915255717
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2007 18:17:28 +0200 (CEST)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 6611994DC
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2007 18:17:28 +0200 (CEST)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id dF4sI9J8rw3G for <linux-lvm@redhat.com>;
	Mon,  3 Sep 2007 18:17:26 +0200 (CEST)
Received: from [192.168.10.145] (xdsl-87-79-108-186.netcologne.de
	[87.79.108.186]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2007 18:17:26 +0200 (CEST)
Message-ID: <46DC3394.2050308@wpkg.org>
Date: Mon, 03 Sep 2007 18:17:24 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how much memory does LVM need? oom-killer comes
References: <Pine.LNX.4.44.0709031016200.17519-100000@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.44.0709031016200.17519-100000@bmsred.bmsi.com>
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

Stuart D. Gathman schrieb:
> On Mon, 3 Sep 2007, Tomasz Chmielewski wrote:
> 
>>> Out of memory: kill process 2220 (getty) score 24 or a child
>>> Killed process 2220 (getty)
>>> Kernel panic - not syncing: Out of memory and no killable processes...
>>>
>>> Rebooting in 20 seconds..
>> Again, replying to myself, as no one on this list seem to have a clue 
>> about problems with LVM snapshots... I added RAM, and was able to boot 
>> again.
> 
> I don't have any answers, but I am very impressed by this kind of testing
> and grateful for the contribution.  My thoughts on evil experiments
> focused on timing and component failure.  Obviously, resource limits 
> are extremely important as well.
> 
> I suppose ideal behaviour would be to refuse to create a snapshot when
> memory is "low".  But defining "low" can be tricky.

Not really.

We can still have plenty memory when we want to create a snapshot - but 
memory can shrink later, as the snapshot fills.


As I understand, and as experimentation shown, memory usage increases as 
the snapshot gets filled, with 3 MB of RAM per 1 GB of snapshot filled 
(more or less).

As the memory used for a snapshot is not swappable, from a certain 
point, it is possible to realize "I'm in trouble, but I can't do anything".

Let's watch at the process once again:

1. Make a snapshot of some large volume (it's easier than making 
multiple small snapshots). We still have plenty of RAM, so there is no 
sense in refusing to create a snapshot.

2. Start filling the snapshot by either writing to the original, or to 
the snapshot. Memory usage increases.

3. As the snapshot fills, and you have less and less memory, from some 
point, you will no longer be able to remove the snapshot.

4. Now, you can only watch as the snapshot grows, your memory shrinks, 
the processes are getting killed, and eventually, the kernel panics. If 
you only have remote access, you're screwed.



Perhaps, in 1., instead of refusing to make a snapshot, make a printk, 
so that the admin knows what may happen? Is the memory used for a 
snapshot possible to calculate? Is it always ~3 MB RAM per 1 GB changes, 
or is it sometimes 1 MB, and sometimes 4 MB, depending on which data 
changes? If it remains more or less the same, add up all space reserved 
for snapshots, if it's more than we have, print a message.


BTW, wasn't it like that in some kernels before 2.6.22? With 2.6.18, I 
was getting a "cannot allocate memory" when I tried to create several 
snapshots. I guess it was a bug, though.


Ideally would be to make the memory needed for snapshots swappable, but 
I'm not sure the kernel would really like it.


-- 
Tomasz Chmielewski
http://wpkg.org
