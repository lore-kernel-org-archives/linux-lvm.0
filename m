Return-Path: <iain@sandon.ca>
From: Iain Campbell <iain@sandon.ca>
Subject: Re: [linux-lvm] HUGE LVM log file...
Date: Wed, 18 Jul 2001 09:29:37 -0400
References: <5.0.2.1.2.20010718104547.00a40ec0@193.0.0.208> <5.0.2.1.2.20010718114553.00a30b40@193.0.0.208>
In-Reply-To: <5.0.2.1.2.20010718114553.00a30b40@193.0.0.208>
MIME-Version: 1.0
Message-Id: <01071809293700.00921@exodus>
Content-Transfer-Encoding: 8bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Wednesday 18 July 2001 05:47, you wrote:
> At 18/07/01, you wrote:
> >actually on AIX you can choose where the LV starts using PPs from
> >
> >         edge
> >         middle
> >         center
> >         inner-middle
> >         inner-edge
> >
> >middle is the default but I think this is more so the average performance
> >of the LVs are better, but maybe not...
>
> I think that middle is the default because IBM drives are more performants
> in the middle.
>
> I never use another brand of disks in a RS/6000 box so I can't tell you
> more....
>

Actually, it's not as elegant as that. AIX simply divides the total number of 
PEs (or to use the AIX terminology, PPs) on the PV by five, thus allocating 
one fifth of the total drive capacity into each of the five disk "areas" 
mentioned in the earlier post. The problem is that there are more blocks on 
the outer edge of the platter than the inner (geometry 101 ;), so what AIX 
calls the "middle" of the platter really is more like one third or so from 
the outer edge. 

The theory is that data placed exactly in the middle of the platter has the 
lowest average seek time, and AIX simplistically calls this the "fastest" 
area of the disk. In fact the outer edge has the greatest peripheral speed 
and gives the fastest data transfer rate. So, is "speed" to you seek time or 
data throughput?

Furthermore, if you have alook at the thread elsewhere in this group on disk 
write ordering (64 bit scsi read/write) you begin to get a feel for the weird 
and wonderful things drives do with data in hardware, which may mask alot of 
the physical factors of where the data is  actually laid out on disk.

Finally, of course, for files that arre read/written repeatedly, the o/s 
buffer cache has a significant blurring effect on where the data may actually 
be written on disk.

iain 
