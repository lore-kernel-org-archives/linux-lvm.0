Subject: Re: [linux-lvm] Raid and LVM, GFS newbie question
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <4012D858.1020005@dpincorp.com>
References: <4012D858.1020005@dpincorp.com>
Message-Id: <1075159753.24139.406.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Mon Jan 26 18:43:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sat, 2004-01-24 at 15:40, Mr. David wrote:
<snip>
> 3.  I need to have mulitiple nodes see the same file systems through the 
> SAN impletmentation.  I read about Sistina's GFS.   Is this product 
> similar to Veritas SanPoint foundation suite where multiple nodes can 
> see same file systems.  How much does GFS cost for, say  for 2 cpu's, 4 
> - 6 nodes?  Are there other products that does similiar job?
> 
> Thank you for your help!
> 
If you are considering GFS, you may want to know:

GFS was developed as opensource by Sistina.

18 months ago (I think) it was taken commercial.

The old opensource logic was the basis of the OpenGFS project.

Since then, both have diverged.

OpenGFS does NOT have a fault tolerant lock-server solution yet, so if
the lock-server dies, your whole file-system crashes.

I don't think GFS does either.

The OpenGFS project has CVS code that uses the IBM distributed lock
server.  It is at the very initial testing phase, and definately NOT
usable yet.

I don't know if GFS is working on a fault-tolerant lock-server solution.

Redhat is in the process of buying Sistina.  "Search the news section of
Google for Sistina."

Once done, Redhat "plans to offer Sistina's file system and storage
technologies as open source software."  They will also be supporting it
at some point in the future.

Greg
