Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105261640.f4QGeLZx001008@webber.adilger.int>
Subject: Re: [linux-lvm] Test of LVM
In-Reply-To: <01052614354500.00527@notch> "from Peter Kirk at May 26, 2001 02:35:45
 pm"
Date: Sat, 26 May 2001 10:40:20 -0600 (MDT)
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Peter Kirk writes:
> I have two disks in one Logical Volume, and all "Partitions" in the LV are 
> striped over the disks, the two disks are both:
> Maxtor 5T0T2H2 with 20 GB a piece, when I do 
> hdparm -t /dev/hda (or hdb) gives ~36MB/sec
> 
> Now I would like to know, how to test if my LVM is performing as it should, 
> could you please tell me what to do, and how to interprete the nubers I get ?
> I think it will not as simple as saying 36 + 36 = 72MB/sec, but it should be 
> somewhere there, shouldn`t it ?

Not even close.  IDE master/slave drives cannot do I/O at the same time,
so your hda+hdb setup is broken.  You will be lucky to get even the
performance of a single drive like this.

Why do people want to do striping anyways???  You have 36MB/s and you will
almost never even be able to use that up.  Striping will just mean that
both disks are always busy at the same time.  If you had separate filesystems
on the different drives, you could at least do copies between the two drives
or write to /tmp and /usr/src/linux at some reasonable speed.  If you have
striping, then you will be seeking like crazy instead.  You ALSO have the
good luck that if either drive goes bad you lose ALL of your data.

The ONLY reason to do striping is if you NEED > 36MB streaming I/O speed
for some reason (I don't think even real-time video needs that performance).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
