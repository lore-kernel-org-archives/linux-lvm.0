MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <16286.55821.272330.836171@gargle.gargle.HOWL>
From: "John Stoffel" <stoffel@lucent.com>
Subject: Re: [linux-lvm] Drive gone bad, now what?
In-Reply-To: <3F9ED172.3000704@xs4all.nl>
References: <20031021171817.GA28462@mail.parplies.de>
	<3F985B2D.5060008@xs4all.nl>
	<16280.27367.874758.610758@gargle.gargle.HOWL>
	<3F98B691.7090902@webhackande.se>
	<3F9989C9.1070909@xs4all.nl>
	<16285.12868.20878.180441@gargle.gargle.HOWL>
	<3F9DB7D8.5080502@xs4all.nl>
	<20031028081933.GA1629@tykepenguin.com>
	<3F9EC8AA.7080603@xs4all.nl>
	<1067371611.4584.10.camel@jayson.NTSERVER1>
	<3F9ED172.3000704@xs4all.nl>
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
Date: Tue Oct 28 15:36:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Gert> True, but what if I stick 2 IDE drives of 250 Gb in an external
Gert> USB2 or Firewire box I have 500 Gb and speeds of 20 to 30
Gert> Mbyte/s at a fraction of the cost.  And those boxes can be put
Gert> into a safe too.

Very true, but in this case, what happens to your data if one of those
drives dies?  There's a similar issue with backups spanning multiple
tapes as well, so it's not even.

Also, at 30mb/s, it will take around three hours to fill that 250gb
disk.  Are you sure you can sustain that kind of throughput?  It's
becoming a big issue with tape backups, being able to drive the tapes
at their rated speed for the best compression/performance possible.
But moving that much data in a short amount of time isn't always easy.

For a cheap fileserver, I'd probably go with a 3ware controller,
either four or 8 ports, with 250gb drives.  For the four port
controller you can do RAID5, but you give up the hot spare.  For the
eight port controller, you'd get 1.5tb of RAW blocks, with one parity
and one hotspare disk.  You'd probably get closer to 1.2tb of useable
storage from the filesystem.

Now how do you back that up?  

John
