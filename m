Date: Thu, 28 Sep 2000 18:26:57 +0200
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] current lvm function questions
Message-ID: <20000928182657.A14386@ns.lst.de>
References: <39D14B6C.4C9F6C26@us.oracle.com> <20000927122810.C31723@gruyere.muc.suse.de>
Mime-Version: 1.0
In-Reply-To: <20000927122810.C31723@gruyere.muc.suse.de>; from ak@suse.de on Wed, Sep 27, 2000 at 12:28:10PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: David Brower <dbrower@us.oracle.com>, linux-lvm@msede.com

On Wed, Sep 27, 2000 at 12:28:10PM +0200, Andi Kleen wrote:
> > disk when it does pvcreate.  What i'm not sure of is
> > whether the label used is (a) globally unique and suitable
> > for stable device naming, or (b) tied to the device it
> > happened to be on at the time the pvcreate was issued.
> 
> LVM uses an UUID iirc.

No, it does not (yet).

	Christoph

-- 
Always remember that you are unique.  Just like everyone else.
