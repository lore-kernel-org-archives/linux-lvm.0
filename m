Date: Tue, 16 Feb 1999 15:51:47 -0600 (CST)
From: Shawn Leas <sleas@ixion.honeywell.com>
Subject: Re: [linux-lvm] User count, general question for all y'all
In-Reply-To: <199902161420.AA06705@mailgate1b.telekom.de>
Message-Id: <Pine.GHP.4.05.9902161547150.25565-100000@ixion.honeywell.com>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: Daniel Whicker <heimdall@mail.org>, linux-lvm@msede.com

On Tue, 16 Feb 1999, Heinz Mauelshagen wrote:

> BTW: i have not been able to test any performance boosts with reiserfs;
>      reiserfsck is far to slow to be usefull

Reiser is slower unless you use notails,nopreserve and be careful about
what blocksize you use. Small files, small blocks.

I find system time goes up, user time down, overall time spent scribbling
goes slightly down on average. That really depends on your usage. It
requires tuning to work well.

Also, when I had this deadlock, my one mounted reiser LV (what had almost
no files open) lost MUCH data after a reiserfsck. Practically EVERYTHING
in every dir. Needless to say, mke2fs /dev/vg00/opt...

> P.S.: does somebody know about any Linux JFSes available for testing?

I only know of the LFS projects out there...

-Shawn
<=========== America Held Hostage ===========>
   Day 2218 for the poor and the middle class. 
   Day 2237 for the rich and the dead.
   704 days remaining in the Raw Deal.
<============================================> 
