Date: Tue, 27 Jun 2000 04:53:40 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
In-Reply-To: <8525690A.0077720E.00@d54mta02.raleigh.ibm.com>
Message-ID: <Pine.LNX.4.21.0006270444180.5989-100000@fogarty.jakma.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benr@us.ibm.com
Cc: linux-lvm@msede.com

On Mon, 26 Jun 2000 benr@us.ibm.com wrote:

> If the existing LVM could accommodate what our customers have
> asked for, then, yes, it would have been more efficient to
> improve the current Linux LVM.  However, in order for the current
> LVM to be able to do what our customers have asked for,

what have your customers asked for exactly? 

and are these customers AIX customers?

> it would have to be based upon a different architecture.  This
> would require major changes to the code, the equivalent of a
> re-write.  This does not mean, however, that the current LVM is
> in any way bad.  It just means that our customers have needs that
> are not being met by the current LVM, and something different is
> required to meet those needs.

but rather than throwing your LVM at Linux (and having 2 different
LVM implementations - bad), why not re-examine your customers needs
and work with current LVM using your experience/concepts from IBM LVM
to develop an architecture that does meet those needs. An
architecture perhaps different from current-LVM/IBM-LVM but still
drawing on that experience.

i take it adapting IBM's LVM to linux will not be straight forward,
so the choices are:

1. port IBM LVM -> 2 seperate LVM implementations.
2. use current LVM with only slight improvements (possibly not
meeting your customer's needs)
3. work with Heinz and the rest of the linux community to build a new
LVM architecture, taking the best concepts from both IBM and Heinz
LVM to build a new LVM architecture superior to all the rest.

whatever you do, i think option 1. is the least desirable.

> 
> Regards,
> 
> Ben


regards,
-- 
Paul Jakma	paul@clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
According to the latest official figures, 43% of all statistics are
totally worthless.
