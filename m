Return-Path: <jbooth@ccbill.com>
Message-ID: <004901c0e478$a3c85ec0$5300000a@cavecreek.net>
From: "Justin Booth" <jbooth@ccbill.com>
References: <OFD6F650E6.4F2A1D36-ON85256A56.004C77FE@raleigh.ibm.com>
Subject: Re: [linux-lvm] Problem deleteing PV's
Date: Thu, 24 May 2001 10:40:35 -0700
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

Tried doing the "dd if of bs count" stuff and now I'm recieving a
pvscan -- ERROR "pv_reaad(): PV identifier invalid" reading physical volumes

any ideas ???

Thanks,
   Justin Both
----- Original Message -----
From: "Kevin M Corry" <corryk@us.ibm.com>
To: <linux-lvm@sistina.com>
Cc: <jbooth@ccbill.com>
Sent: Thursday, May 24, 2001 7:13 AM
Subject: Re: [linux-lvm] Problem deleteing PV's


> Justin,
>
> Do you have any active volumes using any space on /dev/sdb or /dev/sdc?
> (You said below that you are trying to get rid of those entries to start
> over)? When you tried recreating the partition table for those disks,
> did you create everything with the same size/location? If so, then the
> LVM metadata will still be in the same place that pvscan and vgscan
> expect to find it. So, if you don't have any data on those disks to
> worry about, you should be able to just clear out the metadata sectors.
>
> dd if=/dev/zero of=/dev/sdb1 bs=1k count=10
> dd if=/dev/zero of=/dev/sdc1 bs=1k count=10
> dd if=/dev/zero of=/dev/sdb bs=1k count=10
> dd if=/dev/zero of=/dev/sdc bs=1k count=10
>
> There are actually 240+ sectors of metadata at the beginning of each
> PV, but these commands should wipe away the information about the PVs
> and VGs. After this you should repartition the disks again, run
> pvcreate on the appropriate partitions, and run pvscan and vgscan.
>
> I hope I've understood your problem correctly. If you do in fact have
> data on those disks, and vgscan/pvscan isn't finding the volumes, then
> obviously don't run the above commands. :)
>
> Kevin
>
> > vgscan seems to only update /etc/lvmtab and /etc/lvmtagb.d
> > a pvchange -x n /dev/sdxx
> > results in a
> > pvchange -- unable to find volume group "/dev/xxxx" (VG not active?)
> > pvchange -- 0 physical volumes changed / 0 physical volumes already o.k.
> >
> > on all PV's
> >
> > > Have you tried a vgscan to see if there are VG's that you don't need?
> What
> > > about pvchange -x n /dev/sdxx?
> > >
> > >
> > > > Hello,
> > > >
> > > >  I have a problem deleteing 4 PV's that I managed to create None of
> the
> > > > PV's are in a VG, and I can't figure out how to get rid of them
> > > >
> > > > when I do a pvscan It returns something like this:
> > > >
> > > > pvscan -- reading all physical volumes (this may take a while)
> > > > pvscan -- inactive PV "/dev/sdb" is in no VG [12.16] MB
> > > > pvscan -- inactive PV "/dev/sdb1" is in no VG [8.54] GB
> > > > pvscan -- inactive PV "/dev/sdc" is in no VG [12.16] MB
> > > > pvscan -- inactive PV "/dev/sdc1" is in no VG [8.54] GB
> > > > pvscan -- total: 4 [17.11 GB] / in use 0 [0] / in no VG:  4 [17.11
> GB]
> > > >
> > > >
> > > > How do I get rid of these entries to start over again?
> > > > I've tried deleteing the partition table and recreating them but a
> > > > subsequent vgscan always brings them back into pvscan
> > > >
> > > >
> > > >  Thanks much,
> > > >       Justin Booth
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
