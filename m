Date: Fri, 19 Feb 1999 09:38:22 -0600 (CST)
From: Chris Stamborski <cstambor@uiuc.edu>
Subject: Re: [linux-lvm] Problems on compile
In-Reply-To: <199902180900.AA26287@mailgate1b.telekom.de>
Message-ID: <Pine.GSO.3.96.990218221142.22919A-100000@eesnop1.ews.uiuc.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Thu, 18 Feb 1999, Heinz Mauelshagen wrote:

> Thank you Shawn.
> 
> It's concerned with BSD disk label support.
> I never choosed that config option ;*)
> 
> It will be in 0.6alpha anyway.
> 
> BTW: hope to bring out 0.6alpha including some features and
>      bug fixes before march.

I did not apply the patch, but deselecting the BSD disk label support gave
me a clean compile.  Thanks for the help.

The creation of volume groups and logical volumes works wonderfully. 
However, making an e2fs filesystem on a logical volume that is part of a 2
physical volume group causes a null pointer dereference and a kernel dump,
which causes the kernel to dump it's registers to screen. 

I can sucessfully make an e2fs filesystem on a logical volume that is part
of a 1 physical volume group.  I can also mount it.  I can touch a file on
the filesystem, but any data that is written to the filesystem causes
a similar kernel dump.

After I connect a serial console to my machine I should be able to get
details.

But one general question:  Has smp support been tested?  I'm willing to be
the guinea pig. :) 

)chris(

-----------------------------------------------------------------------------
Chris Stamborski   |    "Make it idiot proof and someone will make a
cstambor@uiuc.edu  |	 better idiot." 
