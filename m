Message-ID: <3E68BC6E.21AB9F6F@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Max storage size per system
References: <20030304114851.GA22965@hcsd.de> <3E64B885.1AF49EDA@silicide.dk> <20030304144121.GB23975@hcsd.de> <4857903125.20030305160532@tnonline.net> <20030305194551.GA11043@hcsd.de> <20030306162150.GA11451@gw.silicide.dk> <20030306171539.GA16219@hcsd.de>
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
Date: Fri Mar  7 09:37:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Stephan Austermuehle wrote:
> 
> On Thu, Mar 06, 2003 at 05:21:50PM +0100, jon+lvm@silicide.dk wrote:
> 
> > hmm, that would need 130T/0.146T = 890 disks. And running raid 5...
> 
> Please have a look at the following links. A single HDS Lightning
> (aka HP XP 1024) can address up to 1,024 disks.
> 
>         http://www.hp.com/products1/storage/products/disk_arrays/highend/xp1024/index.html
> 
>         http://www.hds.com/products/systems/9900v/

nice, imagien all that porn ;-D

 
> > personaly i dont like raid5, because if you loose more than one disk
> > your data are gone, and with this ammount of disks, i expect failure
> > rather often. (it's proberly not one big raid5 array, but that just
> > makes it need more disks).
> 
> I prefer RAID 1 (or RAID 10), too, but sometimes one has to use RAID 5.
> A common strategy is to put a higher number of hot spare drives in one
> system. Another (somewhat newer) strategy is to use two rotating parity
> drives per RAID set.

2 rotating parity disks ? Can you elaborate on how that works ?
I have thought about using something else than raid5, where you would
split the data across a number of disks, AND use a mirrored device for
storing the parity on.



JonB
