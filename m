Date: Sun, 30 Jan 2000 21:57:42 +0100
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] Trouble 2.2.14 setup - unresolved symbol lvm_map_ptr (My first time)
Message-ID: <20000130215742.A8152@gruyere.muc.suse.de>
References: <200001301813.TAA08383@u9etz.ez-darmstadt.telekom.de> <200001301944.UAA20420@e35.marxmeier.com>
Mime-Version: 1.0
In-Reply-To: <200001301944.UAA20420@e35.marxmeier.com>; from mike@msede.com on Sun, Jan 30, 2000 at 08:44:56PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Marxmeier <mike@msede.com>
Cc: mauelsha@ez-darmstadt.telekom.de, linux-lvm@msede.com

On Sun, Jan 30, 2000 at 08:44:56PM +0000, Michael Marxmeier wrote:
> > IMO there's no obvious reason, why it should core there with size == 8.
> > 
> > Do you have an old libc in place by accident which might give us a
> > reason to assume an broken malloc()?
> > If so: try with an actual one.
> > 
> > Any ideas from other list members?
> 
> Conventional wisdom tells that when malloc crashes the free list
> (aka arena) has been trashed. This can happen eg. by a double free
> (some malloc versions check against this) or by writing beyond the
> end of a buffer.
> 
> You might want to try the following:
> env MALLOC_CHECK_=1 vgcreate ...

[...]

Another way is to run it under Electric Fence. This has better 
checking than MALLOC_CHECK_. 

BTW, the function could be made shorter by using mmap on the file 
instead of malloc+read.

-Andi
