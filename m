Date: Wed, 17 Feb 1999 15:49:11 -0600 (CST)
From: Shawn Leas <sleas@ixion.honeywell.com>
Subject: Re: [linux-lvm] Re: your mail
In-Reply-To: <199902171313.OAA13340@e35.msede.com>
Message-Id: <Pine.GHP.4.05.9902171547200.4175-100000@ixion.honeywell.com>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Marxmeier <mike@msede.com>
Cc: mauelsha@ez-darmstadt.telekom.de, marka@a-wicked.demon.co.uk, linux-lvm@msede.com, mge@u9ete.ez-darmstadt.telekom.de

On Wed, 17 Feb 1999, Michael Marxmeier wrote:

> Heinz wrote:
> > /boot must be in a regular disk partition containing basic commands,
> > device specials and LVM driver/commands.
> > About 20-30MB should be sufficient to set this up.
> 
> IMO this could even be less if initrd is used.
> We may need about 1-2 MB per kernel image + 1-2 MB for the initial
> utilities (shell, vgchange, mount).

How about a special boot area inside a boot-configured
root volume group? That way, lilo could be modified to run the
second stage boot loader which could then be as heavyweight
as anyone needs it.

Isn't this sort of how hpux handles it?

-Shawn
<=========== America Held Hostage ===========>
   Day 2219 for the poor and the middle class. 
   Day 2238 for the rich and the dead.
   703 days remaining in the Raw Deal.
<============================================> 
