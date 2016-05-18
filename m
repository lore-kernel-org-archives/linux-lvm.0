Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4I50KxU016345
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 01:00:20 -0400
Received: from nm48-vm5.bullet.mail.ne1.yahoo.com
	(nm48-vm5.bullet.mail.ne1.yahoo.com [98.138.121.117])
	(using TLSv1 with cipher ECDHE-RSA-RC4-SHA (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5340163141
	for <linux-lvm@redhat.com>; Wed, 18 May 2016 05:00:18 +0000 (UTC)
Date: Wed, 18 May 2016 04:57:23 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <1872684910.4114972.1463547443287.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1872684910.4114972.1463547443287.JavaMail.yahoo.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] Unexptected filesytem unmount with thin provision
 and autoextend disabled - lvmetad crashed?
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Xen wrote:

<quote> So there are two different cases as mentioned: existing block writes, 
 and new block writes. What I was gabbing about earlier would be forcing 
 a filesystem to also be able to distuinguish between them. You would 
 have a filesystem-level "no extend" mode or "no allocate" mode that gets 
 triggered. Initially my thought was to have this get triggered trough 
 the FS-LVM interface. But, it could also be made operational not through 
 any membrane but simply by having a kernel (module) that gets passed 
 this information. In both cases the idea is to say: the filesystem can 
 do what it wants with existing blocks, but it cannot get new ones.
</quote>

You still have no earthly clue how the various layers work, apparently. For the FS to "know" which of it's blocks can be scribbled on and which can't means it has to constantly poll the block layer (the next layer down may NOT necessarily be LVM) on every write. Goodbye performance.

<quote>
 However, it does mean the filesystem must know the 'hidden geometry' 
 beneath its own blocks, so that it can know about stuff that won't work 
 anymore.
</quote>

I'm pretty sure this was explained to you a couple weeks ago: it's called "integration". For 50 years filesystems were DELIBERATELY written to be agnostic if not outright ignorant of the underlying block device's peculiarities. That's how modular software is written. Sure, some optimizations have been made by peaking into attributes exposed by the block layer but those attributes don't change over time. They are probed at newfs() time and never consulted again.

Chafing at the inherent tradeoffs caused by "lack of knowledge" was why BTRFS and ZFS were written. It is  ignorant to keep pounding the "but I want XFS/EXT+LVM to be feature parity with BTRFS". It's not supposed to, it was never intended and it will never happen. So go use the tool as it's designed or go use something else that tickles your fancy.
 
<quote>
 Will mention that I still haven't tested --errorwhenfull yet.
</quote>

But you conveniently overlook the fact that the FS is NOT remotely full using any of the standard tools - all of a sudden the FS got signaled that the block layer was denying write BIO calls. Maybe there's a helpful kern.err in syslog that you wrote support for? 

<quote>
 In principle if you had the means to acquire such a  flag/state/condition, and the
 filesystem would be able to block new  allocation wherever whenever, you would already
 have a working system.  So what is then non-trivial?
...
 It seems completely obvious that to me at this point, if anything from 
 LVM (or e.g. dmeventd) could signal every filesystem on every affected
 thin volume, to enter a do-not-allocate state, and filesystems would be 
 able to fail writes based on that, you would already have a solution
</quote>

And so therefore in order to acquire this "signal" every write has to be done in synchronous fashion and making sure strict data integrity is maintained vis-a-vis filesystem data and metadata. Tweaking kernel dirty block size and flush intervals are knobs that you can be turned to "signal" user-land that write errors are happening. There's no such thing as "immediate" unless you use synchronous function calls from userland.

If you want to write your application to handle "mis-behaved" block layers, then use O-DIRECT+SYNC.
