Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p68NI88v008558
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2011 19:18:08 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p68NI5Al019051
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2011 19:18:06 -0400
Received: from r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.17.33] helo=[10.0.2.100])
	by ps536.phatservers.com with esmtpa (Exim 4.66)
	(envelope-from <support@bettercgi.com>) id 1QfKJA-0000MA-CI
	for linux-lvm@redhat.com; Fri, 08 Jul 2011 16:18:04 -0700
References: <4E16942E.9070204@tlinx.org>
In-Reply-To: <4E16942E.9070204@tlinx.org>
MIME-Version: 1.0
From: "adultsitesoftware@gmail.com" <support@bettercgi.com>
Date: Fri, 08 Jul 2011 18:17:54 -0500
Message-ID: <defbc387-1bad-4241-b8b4-b0f8a04f2cd8@email.android.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] what use is virtualsize -- or how is it to be used?
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

Virtual size lets you create a 200G file system om a 20G LV and then lvextend as needed, without the need to resize the filesystem. Read about sparse files for ideas of other uses.

It'd like a sparse device in that blocks need not actually exist until they are written to.

It currently has a performance and flexibility impact that prevents us from using it, though we would like to.

"Linda A. Walsh" <lvm@tlinx.org> wrote:

>I just saw it in the man page, and first thing I tried was creating a 
>logical volume
>by just giving a --virtualsize, arg -- thinking it would 'auto-extend 
>it' as needed.
>
>Nep.
>
>Next was looking on the net and seeing an example that gave it some 
>small size (-L 1G),
>with a virtual size of 2G.   So what is that supposed to do?
>
>I just now thought to copy a bunch of files ( that differed from 
>yesterday to today) to a tmp
>partition) but had it fail miserably when it REALLY failed upon
>reaching 
>the physical
>limit -- not the virtual limit!)....
>
>
>I was trying to use rsync to copy from a snap from yesturday of /home 
>that was mounted on
>/ohome to 'home.diff' (the partition that I used 'virtual size' with, 
>... I gave it a real
>size of 1G, and a virtual size of 1T.
>
>Using rsync, I had --compare-dest=/ohome (where I mount yesturday's 
>snap) and copied
>from /home to /home.diff (the virtual partition)....   Well the diffs 
>were > 1G, so had
>hoped /home.diff would expand to it's virtual size...  Anyway, got I/O 
>errors, after I
>ran out of space.  Ok, so *that*'s not what virtual size is
>for...either! 
>
>Anyway, I unmounted the now 'corrupt' /home.diff, and tried to remove
>it...
>Got all sorts of i/o errors using lvremove Home.diff. (-f didn't work 
>either).
>
>Got it to remove with lvremove -f /dev/PV/Home.diff
>That gave I/O errors too, but successfully completed...
>
>So what's virtual size good for, anyway?
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
