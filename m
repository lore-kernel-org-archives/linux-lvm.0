Date: Tue, 16 Feb 1999 20:23:34 -0600 (CST)
From: Shawn Leas <sleas@ixion.honeywell.com>
Subject: Re: [linux-lvm] User count, general question for all y'all
In-Reply-To: <000201be5a0f$5789a3c0$2ba2eecf@stcostaras.chaven.com>
Message-Id: <Pine.GHP.4.05.9902162016250.4139-100000@ixion.honeywell.com>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Costaras <stevecs@chaven.com>
Cc: linux-lvm@msede.com

On Tue, 16 Feb 1999, Stephen Costaras wrote:

> I signed up to the list to get a feel as to how stable lvm is and
> what pitfalls I would cross in using it.  The servers here are used
> in a production setting so I am on the reluctant side of putting in
> 'bleeding edge' stuff.
> 
> Steve

When you think about it, the fundamental role of LVM has
little opportunity to introduce instability where it wasn't
there before. (Maybe Heinz can help me here)

It's simply offereing userland a virtual view of disk (or
some non-volatile storage), and in doing so has the job of
translating logical addresses to physical ones, etc etc. Well,
that and locking some things here and there at times... But
then, that's more for LVM meta data, because LVM sits on top
of already existing kernel stuff, proven stable.

I guess locking could be a concern, but I get the feel,
having used LVM, that Heinz has done a production quality job
with everything.

Go ahead and try it out on a more developmenty platform,
I think you'll find it as stable as a non-lvm one.

-Shawn
<=========== America Held Hostage ===========>
   Day 2218 for the poor and the middle class. 
   Day 2237 for the rich and the dead.
   704 days remaining in the Raw Deal.
<============================================> 
