From: lembark@wrkhors.com
Subject: Re: [linux-lvm] Do I loose all my data if one disk crashes?
Message-Id: <16520000.1020292445@duke.wrkhors.com>
In-Reply-To: <3CD06BAB.7080905@uci.edu>
References: <3CD06BAB.7080905@uci.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Wed May  1 17:35:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


-- Dave Newman <newman@uci.edu> on 05/01/02 15:26:51 -0700

> Hi --
> 
> I just installed lvm on three 160 GB IDE hard drives, giving me a singe 480
> GB partition.

Not possible. You have combined the storage from 3 Phyiscal Volumes
("PV") into a single Volume Group ("VG"). After this point you can 
create Logical Volumes ("LV") w/in the VG.

Whether you loose data when a VG croaks depends on whether
your LV's are spread across multiple VG's. This is often
done either for the increased space or to improve performance
(by striping the LV in kernel-page sized chunks). If your
filesystem is striped and any disk it's on croaks then you
will loose whatever data is on the dead disk [until it's 
restored from the backup that you obviously intend to make
if you're dealing with have a TB of data]. 

If you have multiple LV's and they are all kept on a single
drive then only the LV's on the one PV will have to be restored.

I'd suggest if you're dealing with this much data that
a RAID system would be worth it. RAID5 isn't all that 
expensive to install (one more drive in this case) and 
can save you many, many hours restoring data.

In this case you'd want a RAID5 w/ 4k stripe (4 x 1K chunk)
(4k is standard page size for linux ext[23], change this
number to match whatever file system page you really use).
The RAID will combine the disks into a single unit for you,
so the VG will use a single PV. LVM is still useful here for
managing the individual LV's (e.g., growing them as time 
goes along). It would also be useful to have LVM in the case
where your physical storage has to grow. Just add another
RAID5 setup, add it to the VG and expand onto it.

--
Steven Lembark                              2930 W. Palmer
Workhorse Computing                      Chicago, IL 60647
                                           +1 800 762 1582
