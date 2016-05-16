Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4GLdY4A002190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 16 May 2016 17:39:34 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB59AC049D7F
	for <linux-lvm@redhat.com>; Mon, 16 May 2016 21:39:31 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id BBBD37FB71
	for <linux-lvm@redhat.com>; Mon, 16 May 2016 23:39:29 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 16 May 2016 23:39:29 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <88ecf232d113c573e524088e67204c4f@dds.nl>
References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
	<5739B848.3060505@redhat.com> <119b520d472b019ced48357eff9fb389@dds.nl>
	<5739D494.2040103@redhat.com> <88ecf232d113c573e524088e67204c4f@dds.nl>
Message-ID: <d05ce4c0af456d4c25824863522781f9@dds.nl>
Subject: Re: [linux-lvm] Unexptected filesytem unmount with thin provision
 and autoextend disabled - lvmetad crashed?
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
To: Linux lvm <linux-lvm@redhat.com>

In likelyhood there is just a delay, but I am sending this mail again in 
case it didn't arrive:



Zdenek Kabelac schreef op 16-05-2016 16:09:

> Behavior should be there for quite a while, but relatively recent fixes
> in dmeventd has made it working more reliable in more circumstances.
> I'd recommend to play at least with 142 - but since recent releases are
> bugfix oriented - if you are compiling yourself - just take latest.

Thanks Zdenek. You know I've had an interest in more thin safety, and 
though I may have been an ass sometimes, and though I was told that the 
perfect admin never runs into trouble ;-), I'm still concerned with 
actual practical measures :p.

I don't use my thin volumes for the system. That is difficult anyway 
because Grub doesn't allow it (although I may start writing for that at 
some point). But for me, a frozen volume would be vastly superior to the 
system locking up.

So while I was writing all of that ..material, I didn't realize that in 
my current system's state, the thing would actually cause the entire 
system to freeze. Not directly, but within a minute or so everything 
came to a halt. When I rebooted, all of the volumes were filled 100%, 
that is to say, all of the thin capacities added up to a 100% for the 
thin pool, and the pool itself was at 100%.

I didn't check the condition of the filesystem. You would assume it 
would contain partially written files.

If there is anything that would actually freeze the volume but not bring 
the system down, I would be most happy. But possibly it's the (ext) 
filesystem driver that makes trouble? Like we said, if there is no way 
to communicate space-fullness, what is it going to do right?

So is that dmeventd supposed to do anything to prevent disaster? Would I 
need to write my own plugin/configuration for it?

It is not running on my system currently. Without further amendments of 
course the only thing it could possibly do is to remount a filesystem 
read-only, like others have indicated it possibly already could.

Maybe it would even be possible to have a kernel module that blocks a 
certain kind of writes, but these things are hard, because the kernel 
doesn't have a lot of places to hook onto by design. You could simply 
give the filesystem (or actually the code calling for a write) write 
failures back.

All of that code is not filesystem dependent, in the sense that you can 
simply capture those writes in the VFS system, and not pass them on. At 
the cost of some extra function calls. But then you would need that 
module to know that certain volumes are read-only, and others aren't. 
All in all not very hard to do, if you know how to do the concurrency. 
In that case you could have a dmeventd plugin that would set this state, 
and possibly a user tool that would unset it. The state is set for all 
of the volumes of a thin pool, so the user tool would only need to unset 
this for the thin pool, not the volumes. In practice, in the beginning, 
this would be all you would need.

So I am just currently wondering about that

what other people have said. That the system already does this (mounting 
read-only).

I believe my test system just failed because the writes only took a few 
seconds to fill up the volume. Not a very good test, sorry. I didn't 
realize that, that it would check only in intervals.

I still wonder what freezes my system like that.

Regards, B.



And I'm sorry for any .... disturbance I may have caused here. Regards.
