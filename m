Date: Wed, 17 Feb 1999 22:38:42 -0600 (CST)
From: Shawn Leas <sleas@ixion.honeywell.com>
Subject: Re: [linux-lvm] Re: your mail
In-Reply-To: <4.1.19990217215840.0096c480@mail.msy.bellsouth.net>
Message-Id: <Pine.GHP.4.05.9902172236530.17992-100000@ixion.honeywell.com>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Whicker <heimdall@mail.org>
Cc: linux-lvm@msede.com

On Wed, 17 Feb 1999, Daniel Whicker wrote:

> Okay.  Let me make sure I understand this.  I think that what you're saying
> is that at this point, LILO should be able handle an LV like any other
> partition as far as booting is concerned?  If so, then the real problem
> lies in getting the LVM turned on early enough that we can finish the boot
> process, correct?  And if that were the case, we should be able to treat
> the LVM like any other necessary kernel driver and install it with an
> initrd.  Sorry to repeat things, but I want to make sure that I have a firm
> understanding of what you're saying.

I guess now that I think of it, I was kindof thinking of
an area on the root VG that lilo could find, which would
hold a kernel, and an initrd image so the extra partition
isn't needed.

-Shawn
<=========== America Held Hostage ===========>
   Day 2219 for the poor and the middle class. 
   Day 2238 for the rich and the dead.
   703 days remaining in the Raw Deal.
<============================================> 
