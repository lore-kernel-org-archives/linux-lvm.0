Message-Id: <3CB365F4.F90C2347@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] multiple volumes..
References: <18044083656.20020409231800@tnonline.net>
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
Date: Tue Apr  9 17:06:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Anders Widman wrote:
> 
> I have a problem which I want to solve as efficiently as possible.
> 
> The problem is that I have 13 drives os various sizes (30-120GB) which
> I want to combine into one (or a few) logical volumes with redundancy
> if one drive would fail.

13 disks... in one computer. How many controllers do you have ??
Are they all filled up ?? aka, using hd<a,b,c,d,e,f,g,h,...>


> How would the smartest layout be? I was thinking about multiple
> partiontions and then combine them into several RAID 5 chains, and
> then use LVM to manage the logical volumes.

And how many disks would you have in your raid5 thingy ?? Way too
many pr. controller i fear. Only run one (active) ide hd pr.
controller. As for scsi, more, but not many more.

Why not use raid1, or possibly, raid0 ontop of raid1?

 
> There is an expamle of my ideas at http://www.tnonline.net/raid-lvm.png
> As you can see there are 8 chains and about 50 GB unallocated data in
> this example. Can I minimize the loss even better?

Yes, you could avoid it.
Run raid1 on much of it, possibly raid0 on top for speed.
The 30GB disk, and the leftovers from the 2*75GB disks, can
with the leftovers from the 120GB disk be turned into raid1
partitions.

 
> Any help or insight in this would be greatly appreciaded

More info about the disks, ide, scsi, mixed, controllers ??




JonB
