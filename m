From: Kevin Corry <corryk@us.ibm.com>
Subject: Re: [linux-lvm] Re: [Announce] device-mapper beta3 (fast snapshots)
References: <3D2F6464.60908@us.ibm.com> <20020715124035.GA4609@fib011235813.fsnet.co.uk>
In-Reply-To: <20020715124035.GA4609@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Message-Id: <02071513565400.06209@boiler>
Content-Transfer-Encoding: 8bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Jul 15 14:13:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Joe Thornber <joe@fib011235813.fsnet.co.uk>, Andrew Theurer <habanero@us.ibm.com>
Cc: linux-kernel@vger.kernel.org

On Monday 15 July 2002 07:40, Joe Thornber wrote:
> On Fri, Jul 12, 2002 at 06:21:08PM -0500, Andrew Theurer wrote:
> > Thanks for the results.  I tried the same thing, but with the latest
> > release (beta 4) and I am not observing the same behavior.
>
> I've just read through the evms 1.1-pre4 code.
>
> You (or Kevin Corry rather) have obviously looked at the
> device-mapper snapshot code and tried to reimplement it.  I think it
> might have been better if you'd actually used the relevent files from
> device-mapper such as the kcopyd daemon.

Actually, I've never looked at the snapshotting code in LVM2.

We are both writing code with very similar end-goals, and there are only so 
many ways to perform I/O from within the block layer, so it wouldn't be 
unheard of that our designs might share some similarities.

> Also I have serious concerns about the correctness of your
> implementation, for example:
>
> i) It is possible for the exception table to be updated *before* the
>    copy on write of the data actually occurs.  This means that briefly
>    the on disk state of the snapshot is inconsistent.  Users of EVMS
>    that experience a machine failure will therefor have no option but to
>    delete all snapshots.
>
> ii) The exception table is only written out every
>     (EVMS_VSECTOR_SIZE/sizeof(u_int64_t)) exceptions.  Surely I've misread
>     the code here ?  This would mean I could have a machine that
>     triggers 1 fewer exceptions than this, then does nothing to this
>     volume, at no point would the exception table get written to disk?
>     Or do you periodically flush the exception table as well ?
>     Again if the machine crashed the snapshot would be useless.

In the current design, there are two cases when the COW table is written to 
disk. Either when current COW sector is full, or on a clean system shutdown. 
All snapshots will thus be persistent across a clean shutdown or reboot. 
Currently, an async snapshot will be disabled if the system crashes. This 
wasn't a big secret. In the latest HOWTO, the section on snapshotting 
explains this, and in the EVMS gui, there is a note attached to the "async" 
option saying this as well.

We designed async snapshots in EVMS for maximum performance. Allowing for the 
one above condition provides for a significant performance increase. Writing 
the COW table only when it's full prevents a lot of unnecessary disk head 
seeking. Also, allowing out-of-order I/Os means that the write request to the 
original that triggered the copy can be released much sooner - as soon as the 
chunk is read from the original, and in parallel with the write to the 
snapshot.

We've discussed adding a mode to async snapshots that will provide 
persistency across system crashes (at a slight performance penalty of 
course). But, there's been a lot going on here lately, so I haven't had a 
chance to get it all coded up. But, the synchronous option is still available 
for those who are scared about system crashes. Personally, I'm not that 
scared. I'd have a hard time remembering the last time one of my production 
machines crashed unexpectedly.

> iii) EVMS is writing the exception table data to the cow device
>      asynchronously, you *cannot* do this without risking deadlocks with
>      the VM system.

I don't see how this is the case. From the VM's viewpoint, writing the COW 
table is basically no different than copying the chunks from the original to 
the snapshot. We've never experienced any VM deadlocks in the testing we've 
done. If you provide us with some more details about the deadlock you are 
describing, we'll give it some more thought.

-Kevin
