Message-ID: <3CDF8482.7010109@lausch.at>
From: Michael Lausch <mla@lausch.at>
MIME-Version: 1.0
Subject: Re: [linux-lvm] has anyone used LVM in a HA cluster?
References: <20020510072608.GA1001@tykepenguin.com> <1021071171.17474.44.camel@UberGeek> <671160000.1021077884@[192.168.200.4]> <20020511192728.GB3125@colombina.comedia.it>
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
Date: Mon May 13 04:15:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Luca Berra wrote:
> On Fri, May 10, 2002 at 07:44:44PM -0500, Steven Lembark wrote:
> 
> 
> there is a tool called heartbeat on http://www.linux-ha.org/
> have a look at it it really rocks.
> it already has a resource that supports mounting of partitions
> on shared media in case an hosts fail, it would be trivial
> to adapt it for LVM

And make sure the daemons are running in the real time scheduler class.
There exists a state, commomly refered to as "split brain", where the 
nodes of a cluster "think" the other one is down, which is not the fact. 
Reason for this may be that the load is so high, that the heartbeat 
daemon is not scheduled in time to answer the requests (it happened to 
me with a commercial product). then both nodes mount the filesystem. 
Usually the inital fsck (or log replay or whatever) is enough to destroy 
the filesystem beyond repair. But all these things are in no way LVM 
specific, so it works.

Plan the export and import scenarios (what commands must be executed by 
the node having the disk mounted and what commands must be executed 
(vgscan and friends) on the node which mounts a filesystem respectivly) 
very carefully and take all possible failover scenarios into account, 
e.g. the active node crashes hard and yu have to scan the volume groups, 
do the fsck combo on dirty filesystems and mount the volumes.

my experience stems from veritas HA, veritas cluster (which uses a 
kernel module for heartbeats to work around the scheduler problems) and 
various versions of veritas volume manager. the volume manager is very 
similar to a MD/LVM combination.

> 
> L.
> 
> 
