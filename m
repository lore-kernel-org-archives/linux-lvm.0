Return-Path: <jbooth@ccbill.com>
Message-ID: <007c01c0e483$46f0aa80$5300000a@cavecreek.net>
From: "Justin Booth" <jbooth@ccbill.com>
References: <OF14217A96.084B4790-ON85256A56.00658579@raleigh.ibm.com>
Subject: Re: [linux-lvm] Problem deleteing PV's
Date: Thu, 24 May 2001 11:56:39 -0700
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

still getting that pv_read error (PV identifier invalid). I ran a pvscan -d
and it's exiting with a -268 from
 pv_create_name_from_kdev_t -- LEAVEING with ret: -268

Justin Booth

 Thanks for all the help.

----- Original Message -----
From: "Kevin M Corry" <corryk@us.ibm.com>
To: <linux-lvm@sistina.com>
Sent: Thursday, May 24, 2001 11:35 AM
Subject: Re: [linux-lvm] Problem deleteing PV's


> Well, the first thing I would try is increasing to "count=1000" or 10000.
I
> just did that on my machine with my test group. The VG TestGroup contained
> a single PV /dev/hdb1. I did "dd if=/dev/zero of=/dev/hdb1 bs=1k
> count=10000",
> then reran pvscan, and that PV was gone from the listing. Then I ran
> vgscan,
> and TestGroup was gone. Then it was just a matter of removing the
directory
> in /dev for that group. If increasing the count in dd doesn't work, I'm
not
> sure what else to suggest.
>
> -Kevin
>
>
> > Tried doing the "dd if of bs count" stuff and now I'm recieving a
> > pvscan -- ERROR "pv_reaad(): PV identifier invalid" reading physical
> volumes
> >
> > any ideas ???
> >
> > Thanks,
> >    Justin Both
> >
> > ----- Original Message -----
> >
> > Justin,
> >
> > Do you have any active volumes using any space on /dev/sdb or /dev/sdc?
> > (You said below that you are trying to get rid of those entries to start
> > over)? When you tried recreating the partition table for those disks,
> > did you create everything with the same size/location? If so, then the
> > LVM metadata will still be in the same place that pvscan and vgscan
> > expect to find it. So, if you don't have any data on those disks to
> > worry about, you should be able to just clear out the metadata sectors.
> >
> > dd if=/dev/zero of=/dev/sdb1 bs=1k count=10
> > dd if=/dev/zero of=/dev/sdc1 bs=1k count=10
> > dd if=/dev/zero of=/dev/sdb bs=1k count=10
> > dd if=/dev/zero of=/dev/sdc bs=1k count=10
> >
> > There are actually 240+ sectors of metadata at the beginning of each
> > PV, but these commands should wipe away the information about the PVs
> > and VGs. After this you should repartition the disks again, run
> > pvcreate on the appropriate partitions, and run pvscan and vgscan.
> >
> > I hope I've understood your problem correctly. If you do in fact have
> > data on those disks, and vgscan/pvscan isn't finding the volumes, then
> > obviously don't run the above commands. :)
> >
> > Kevin
> >
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
