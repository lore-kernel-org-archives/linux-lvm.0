Date: Fri, 16 Jun 2000 23:03:15 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] IBM to release LVM Technology to the Linux Community
Message-ID: <20000616230315.A3657@gruyere.muc.suse.de>
References: <85256900.006F9EE2.00@d54mta02.raleigh.ibm.com>
Mime-Version: 1.0
In-Reply-To: <85256900.006F9EE2.00@d54mta02.raleigh.ibm.com>; from benr@us.ibm.com on Fri, Jun 16, 2000 at 04:19:10PM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benr@us.ibm.com
Cc: linux-lvm@msede.com

On Fri, Jun 16, 2000 at 04:19:10PM -0400, benr@us.ibm.com wrote:
> >The stacking of multiple block translation modules seems to be already
> >implemented in 2.4-latest, although it is a bit of a hack and SMP
> >unfriendly.
> 
> My understanding of what is in 2.4-latest is that you do indeed have the
> stacking of multiple block translation modules, but the implementation of
> this is not as flexible or integrated as what we have described in the
> white paper.   Please correct me if I am wrong!

I'm not sure anything can be more flexible than a simple list of 
block remappers that are called one after another. I guess your framework
is more integrated though. What is definitely lacking is a generic
API for this case; the current way of letting remappers change a function
pointer requires special support in every single remapper and it is hard
to remove or insert them on the fly; and all kind of nice user space
support. Also a generic way to store metadata is nice (I think you're 
providing this); e.g. current crypto loopback is badly suffering ATM from
missing metadata. Also some generic way to trigger user space actions
on volume changes would be useful; for example to automatically rerun lilo 
when you move the LV with the kernel on it (current lvm is lacking a bit
on that front) 

> >The white paper talks about software RAID. Do you plan to release an
> >own software RAID implementation or just a port of the existing MD  ?
> 
> The Linux Community has not yet had a chance to evaluate IBM's vision of
> what an LVMS should be, much less the technology that we are releasing in
> support of that vision.  However, should things progress to the point where

I'm sure there is plenty of interest in a flexible stackable block devices
implementation.

Maybe the name choice is a bit unfortunate though because it sounds now
like a direct competitor to LVM (which it is only partly, I guess the 
current LVM could also exist in your framework) 

> the Linux Community has expressed an interest in this technology and IBM is
> releasing code (under the GPL, of course) in support of this technology,
> then I doubt that IBM would release another software RAID.  It would be far
> more productive to have the existing software RAID adapted to run as a
> "Feature Plug-in" than to develop or port another software RAID
> implementation.

I was just trying to understand what your code offers other than just being
a framework.
Has it been decided what plugins would be included in the GPL release? 

-Andi
