Return-Path: <corryk@us.ibm.com>
Subject: Re: [linux-lvm] Problem deleteing PV's
Message-ID: <OF14217A96.084B4790-ON85256A56.00658579@raleigh.ibm.com>
From: "Kevin M Corry" <corryk@us.ibm.com>
Date: Thu, 24 May 2001 13:35:52 -0500
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

Well, the first thing I would try is increasing to "count=1000" or 10000. I
just did that on my machine with my test group. The VG TestGroup contained
a single PV /dev/hdb1. I did "dd if=/dev/zero of=/dev/hdb1 bs=1k
count=10000",
then reran pvscan, and that PV was gone from the listing. Then I ran
vgscan,
and TestGroup was gone. Then it was just a matter of removing the directory
in /dev for that group. If increasing the count in dd doesn't work, I'm not
sure what else to suggest.

-Kevin


> Tried doing the "dd if of bs count" stuff and now I'm recieving a
> pvscan -- ERROR "pv_reaad(): PV identifier invalid" reading physical
volumes
>
> any ideas ???
>
> Thanks,
>    Justin Both
>
> ----- Original Message -----
>
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
