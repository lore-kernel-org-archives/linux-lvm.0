Message-ID: <3DAE7A20.2F8896A1@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm on linux RAID5?
References: <1034773372.1658.8.camel@frodo.xelin.se> <20021016192819.D2330@zealot.blacknet.de>
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
Date: Thu Oct 17 04:06:43 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Goetz Bock wrote:
> 
> On Wed, Oct 16 '02 at 15:02, Anders Henriksson wrote:
> > I want to run lvm over four linux raid5 devices, can I just treat the
> > raid devices as discs? i.e. run pvcreate on them directly and go on from
> > there.
> You've more than 12 discs in your box? No? Oh, if you ment you're trying
> to run LVM ontop of a 4disk RAID5 drive (using linux md drivers), than
> try:

No, he doesnt have 12 disks. He wrote he have 4 which is splitted into
4.
aka, 4 disks made into a raid5, and then 4 partitions, and he wants to
run
LVM ontop of (one of) those partitions. (rather silly to split it into
partitions
for then to run LVM...)




JonB
