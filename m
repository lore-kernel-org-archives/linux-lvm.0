Message-Id: <3CB364D2.F612BD9B@silicide.dk>
From: Jon Bendtsen <jon+vserver@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] multiple volumes..
References: <18044083656.20020409231800@tnonline.net>
    <611310000.1018387687@[192.168.200.4]>
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
Date: Tue Apr  9 17:01:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Steven Lembark wrote:
 
> > There is an expamle of my ideas at http://www.tnonline.net/raid-lvm.png
> > As you can see there are 8 chains and about 50 GB unallocated data in
> > this example. Can I minimize the loss even better?
> >
> > Any help or insight in this would be greatly appreciaded
> 
> One way is to mirror the hard drives (requires an even number
> of the same size/type) then build your LVM system on top of
> the mirrored drives. Nice thing about this is that the messy
> part (paring and mirroring the drives) is done once only and
> is transparent to the LVM system.

Okay, my suggestion would be to mirror alot, and possibly if you want
to,
to raid0 ontop of the mirrors, but that REQUIRES, that the disks are not
hd<a,b,c,d,e,f,g,h>
You should try to avoid having more than one (active) disk at the same
controller at once.
Anyway, mirror the 80GB disks, and the 75GB disks, possibly raid0 that.
raid0 2 60GB disks, and mirror that against the 120GB, or divide the 120
gb disk in 2, and mirror each partition for one 60GB disk.
The rest of the 60GB disks (4??) can do mirror, or mirror/raid
As for the 30, 40 and those 2*5GB from the 80GB disks, being raid0'ed
against
the 75GB disks, you could mirror the 30, 30 from the 40GB, and the last
10 GB,
well, same procedure as the 120GB disk, and the 2*60GB disks

Or you could just do what you suggested and then only create a mirror
from the
30GB disk, the leftovers from the 75GB disks, and the leftovers from the
120GB
disk.
30+2*5 = 40, which is left from the 120GB disk.

Personaly i dont think it is wise to raid5 over too many disks.
Especialy if
they are located on the same controller.



JonB
