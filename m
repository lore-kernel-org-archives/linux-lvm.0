From: Dan Sully <daniel@electricrain.com>
Subject: Re: [linux-lvm] LVM across network
Message-ID: <20031127155205.GD18005@electricrain.com>
References: <Pine.LNX.4.44.0311261511490.21217-100000@nymfe06.fi.muni.cz> <11659189187.20031126163948@tnonline.net> <20031126165649.1fd1c51b.neuron@hollowtube.mine.nu> <199870551.20031126190959@tnonline.net> <3FC5AE3A.9080906@webhackande.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3FC5AE3A.9080906@webhackande.se>
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
Date: Thu Nov 27 09:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

* Rickard Olsson <richie@webhackande.se> shaped the electrons to say...

> >  I  doubt  any  network  filesystem  will  allow  you to disconnect a
> >  machine  and still be able to operate.
> 
> I have been eyeing Coda for a while now and it looks like it does 
> exactly that. I'm not sure about the storage requirements, though. It 
> appears it may need two full mirrors worth for the replication, but they 
> can be spread out over a WAN if need be.
> 
> http://www.coda.cs.cmu.edu/index.html

CODA is really dead. If you want a disconnected filesystem, check out
Intermezzo, which is part of the Linux kernel as well.

> iSCSI RAID, anyone?
> 
> http://www.simplesan.com/products/iscsiarrays.htm

I picked up a NetDisk from Fry's over the past week and attempted to get it
to work. Unfortunately, the only Linux drivers they have right now are beta,
and only for Redhat 8 & 9 at that. Their "admin" tools require Tk (not on a
server!), and appear to be some hacked up version of their own code and net-snmp.

The windows drivers worked a bit better, but would say "Drive has been
disconnected" every so often, when nothing had changed physically.

Nice (and relatively cheap) idea, but their implementation has a way to go.

-D
-- 
It's only after you've lost everything that you're free to do anything.
