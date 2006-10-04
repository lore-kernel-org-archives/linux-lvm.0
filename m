Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k94FnAuU023743
	for <linux-lvm@redhat.com>; Wed, 4 Oct 2006 11:49:10 -0400
Received: from web53005.mail.yahoo.com (web53005.mail.yahoo.com
	[206.190.49.35])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k94Fn4JH005547
	for <linux-lvm@redhat.com>; Wed, 4 Oct 2006 11:49:04 -0400
Message-ID: <20061004154858.80196.qmail@web53005.mail.yahoo.com>
Date: Wed, 4 Oct 2006 08:48:58 -0700 (PDT)
From: TNJazzGrass <tnjazzgrass@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Serious LVM Problem
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi all,

This is my first post here and I'm fairly
inexperienced with Linux, so please be gentle!

OK, here's the deal:  a couple of years ago I read
about LVM and decided to try it out under Fedora Core
3 as a music file server.  Had a few minor corruption
issues over the years, but nothing really serious.  I
just let the system rebuild itself on bootup and that
was that.  A few lost clusters here and there, but
nothing too bad.  The box was soon a "turn it on and
forget about it" kind of thing for me, as my primary
working environment is on a Mac these days.

Recently, I tried to install a wireless Linksys card,
as the box was going to end up in a room upstairs
where there was no internet access available.  Well,
the install completely hosed Core 3, and in doing some
followup I actually found a post that stated the
package I used often did that to Core 3!

This made me decide to upgrade to Core 5.  Like an
idiot, I tried to "upgrade" and I unchecked the LVM
drives for formatting when I did.  In hindsight I
should have removed them completely, but I didn't. 
Now I've got a fully functional Core 5, but I can't
find my LVM array anywhere on the box!  So I have no
idea if the data is still there, or if it has been
wiped clean by my rampant stupidity.

There is an LVM management in the GUI, but it doesn't
really help.  At this point all I want to do is
recover the data from the drives, if in fact it's
still there.

We're talking about an LVM of 5 x 250gb drives filled
with music and other files, plus part of a 120gb drive
that also contains the OS.

I have about 80-85% of the contents backed up on
optical media, so it's not really catastrophic if it
all goes down the tubes, but to rebuild the file
server from all those CDs and DVDs (over 400 of them!)
would be a chore.

Can anyone provide me some troubleshooting assistance
so I can determine what to do next?  I'm not afraid of
the command line, but I'm not all that skilled on it
either (so I'd need instructions that are fairly
straightforward).

Thanks, and sorry for the long first post!
Dirk

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
