From: Tim <tim@connectlive.com>
Subject: Re: [linux-lvm] has anyone used LVM in a HA cluster?
Message-ID: <20020513073337.A31182@connectlive.com>
References: <20020510072608.GA1001@tykepenguin.com> <1021071171.17474.44.camel@UberGeek> <671160000.1021077884@[192.168.200.4]> <20020511192728.GB3125@colombina.comedia.it> <3CDF8482.7010109@lausch.at>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3CDF8482.7010109@lausch.at>; from mla@lausch.at on Mon, May 13, 2002 at 11:16:50AM +0200
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
Date: Mon May 13 07:33:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> And make sure the daemons are running in the real time scheduler class.
> There exists a state, commomly refered to as "split brain", where the 
> nodes of a cluster "think" the other one is down, which is not the fact. 
> Reason for this may be that the load is so high, that the heartbeat 
> daemon is not scheduled in time to answer the requests (it happened to 
> me with a commercial product). then both nodes mount the filesystem. 
> Usually the inital fsck (or log replay or whatever) is enough to destroy 
> the filesystem beyond repair. But all these things are in no way LVM 
> specific, so it works.

Or don't, and buy a power supply that you can control from serial, and
do so -- STONITH, it's called -- Shoot The Other Node In The Head.  Once
the power is off, there is no danger of fsck'ing...

It's a rather elegant way to solve that problem, IMHO.

We're going that route.

-- 
    "The most valuable piece of equipment in the darkroom
     is the trash can."
                                  --Ansel Adams
