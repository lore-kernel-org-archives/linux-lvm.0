Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2O30vO11579
	for <linux-lvm@redhat.com>; Wed, 23 Mar 2005 22:00:57 -0500
Received: from hathawaymix.org (67.107.199.112.ptr.us.xo.net [67.107.199.112])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j2O30v4D026178
	for <linux-lvm@redhat.com>; Wed, 23 Mar 2005 22:00:57 -0500
Received: from [192.168.1.10] (bluewan [192.168.2.2])
	by hathawaymix.org (Postfix) with ESMTP id 40B0E12353E
	for <linux-lvm@redhat.com>; Wed, 23 Mar 2005 19:56:09 -0700 (MST)
Message-ID: <42422D63.1080403@hathawaymix.org>
Date: Wed, 23 Mar 2005 20:00:51 -0700
From: Shane Hathaway <shane@hathawaymix.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] snapshot reset
References: <20050316230040.GA6604@wavehammer.waldi.eu.org>	<20050316231000.GC19749@agk.surrey.redhat.com>
	<20050317074345.GA27947@wavehammer.waldi.eu.org>
In-Reply-To: <20050317074345.GA27947@wavehammer.waldi.eu.org>
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

Bastian Blank wrote:
>>With LVM2, between those commands, you can just zero out the
>>start of the cow device (say first 64k).  And then it'll treat
>>it as if it were a new snapshot (based on current state of filesystem.)
> 
> 
> Something like this?
> | name=${vg}-${lv}
> | dmsetup suspend $name
> | dd if=/dev/zero of=/dev/mapper/${name}-cow bs=64k count=1
> | dmsetup resume $name

I tried something very much like this a couple of weeks ago (with Linux 
2.6.10) and found that it's not reliable.  Digging further, I learned 
that the snapshot device doesn't actually read the cow device when it 
resumes.  (BTW, you only need to blank the first 4 bytes, which contain 
the magic number.)  However, if you use "vgchange -a n; vgchange -a y" 
after this script, it should work.

My goal was to use snapshot devices to implement filesystem-level 
transactions.  I wanted to write a set of changes to the filesystem only 
if all of the changes could be committed.  I decided that vgchange was 
too invasive for my purposes, so I wrote a patch for device-mapper that 
lets you reliably and quickly clear a snapshot device using this command:

   dmsetup message ${vg}-${lv} 0 resync

Then I wrote a script that commits the changes from a snapshot device 
back to the original volume, then clears the snapshot device so it can 
be reused for more transactions.  I was happy with how it turned out; 
you don't even have to unmount the filesystem to commit a transaction. 
(Aborting a transaction does require a remount.)

Once I finished, I changed my mind and decided I wanted to gain 
transactional integrity in a different way.  However, if anyone's 
interested in my work, email me and I'll send you everything.

Shane
