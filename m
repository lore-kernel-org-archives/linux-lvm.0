Subject: Re: [Evms-devel] Re: [linux-lvm] Re: [lvm-devel] [ANNOUNCE] LVM
    reimplementation ready for beta testing
Message-Id: <20020131130913.A8997@fib011235813.fsnet.co.uk>
References: <OFBCE93B66.F7B9C14E-ON85256B52.006B8AB3@raleigh.ibm.com>
    <20020131125211.A8934@fib011235813.fsnet.co.uk>
    <20020201045518.A10893@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020201045518.A10893@devserv.devel.redhat.com>;
    from arjanv@redhat.com on Fri, Feb 01, 2002 at 04:55:18AM -0500
From: Joe Thornber <thornber@fib011235813.fsnet.co.uk>
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
Date: Fri Feb  1 04:04:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arjan van de Ven <arjanv@redhat.com>
Cc: Joe Thornber <thornber@fib011235813.fsnet.co.uk>, lvm-devel@sistina.com, Jim McDonald <Jim@mcdee.net>, Andreas Dilger <adilger@turbolabs.com>, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, evms-devel@lists.sourceforge.net

On Fri, Feb 01, 2002 at 04:55:18AM -0500, Arjan van de Ven wrote:
> There is one thing that might spoil the device-mapper "just simple stuff
> only" thing: moving active volumes around. Doing that in userspace reliably
> is impossible and basically needs to be done in kernelspace (it's an
> operation comparable with raid1 resync, a not even that hard in kernel
> space). However, that sort of automatically requires kernelspace to know
> about volumes, and from there it's a small step....

I think you're talking about pvmove and friends, in which case I hope
the description below helps.

- Joe



Let's say we have an LV, made up of three segments of different PV's,
I've also added in the device major:minor as this will be useful
later:

+-----------------------------+
|  PV1     |   PV2   |   PV3  | 254:3
+----------+---------+--------+


Now our hero decides to PV move PV2 to PV4:

1. Suspend our LV (254:3), this starts queueing all io, and flushes
   all pending io.  Once the suspend has completed we are free to change
   the mapping table.

2. Set up *another* (254:4) device with the mapping table of our LV.

3. Load a new mapping table into (254:3) that has identity targets for
   parts that aren't moving, and a mirror target for parts that are.

4. Unsuspend (254:3)

So now we have:
                           destination of copy
               +--------------------->--------------+
               |                                    |
+-----------------------------+               + -----------+
| Identity | mirror  | Ident. | 254:3         |    PV4     |
+----------+---------+--------+               +------------+
     |         |         |
     \/        \/        \/
+-----------------------------+
|  PV1     |   PV2   |   PV3  | 254:4
+----------+---------+--------+

Any writes to segment2 of the LV get intercepted by the mirror target
who checks that that chunk has been copied to the new destination, if
it hasn't it queues the initial copy and defers the current io until
it has finished.  Then the current io is written to *both* PV2 and the
PV4.

5. When the copying has completed 254:3 is suspended/pending flushed.

6. 254:4 is taken down

7. metadata is updated on disk

8. 254:3 has new mapping table loaded:

+-----------------------------+
|  PV1     |   PV4   |   PV3  | 254:3
+----------+---------+--------+
