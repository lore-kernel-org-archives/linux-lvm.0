From: Jesse Keating <jkeating@pogolinux.com>
Subject: Re: [linux-lvm] Max storage size per system
References: <20030305195052.GC11043@hcsd.de> <20030307013431.GB6942@auctionwatch.com> <20030307142049.GB21686@hcsd.de>
In-Reply-To: <20030307142049.GB21686@hcsd.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200303091813.36010.jkeating@pogolinux.com>
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
Date: Sun Mar  9 20:09:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Friday 07 March 2003 06:20, Stephan Austermuehle uttered:
> Well, iSCSI was developed and pushed by some networking guys with
> Ethernet in mind to get into the storage market without developing know
> how for a really efficient data link. So iSCSI has to handle lots of
> overhead: SCSI commands are encapsulated in IP, IP is encapuslated in
> Ethernet. This leads to bad performance (latency, throughput) compared
> to a Fibre Channel connection with the same link speed. Maybe the
> performance impact will become negligible with 10G or 100G Ethernet but
> at the moment we don't have these technologies available.

This speaks nothing of HyperSCSI which is indepenant of TCP/IP and all of it's 
ugly overhead.  Hyperscsi runs in raw ethernet, no TCP/IP even need be on the 
wire.  Data writing w/ HyperSCSI is far faster than with NFS or iSCSI.

-- 
Jesse Keating RHCE MCSE
Pogo Linux -- Support Tech
tel: 888.828.7646
