From: James Mello <kingjamm@colltech.com>
Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
In-Reply-To: <3C6187A0.3DFEA8BE@lmco.com>
Message-Id: <Pine.GSO.4.21.0202061401180.17353-100000@psasolar.private.psa.pencom.com>
MIME-Version: 1.0
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
Date: Wed Feb  6 14:03:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>    Large amounts of data brings in even more issues. How do
> you stream Petabytes of data to tape in a resonable of time?
> Unless you spend HUGE amounts of money to buy multiple
> silos to handle slices of the data and put in a fantastic network
> to handle the traffic, you can't backup in a reasonable amount
> of time. In this case, disk is your only choice. The data size
> break point between disk and tape depends on lots of things,
> but that point is moving downward all the time (perhaps in
> the Terabyte range).

Petabytes are another matter entirely. If you must absolutely have that
much data backed up, you start looking at more exotic solutions. Backing
up solely to disk is *way* to expensive, hence the wonderful, but of
poorly implemented idea of HSM.... Disk and tape :)

	-- Cheers
	-- James
