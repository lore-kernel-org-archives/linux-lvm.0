From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] offtopic but ...
Message-Id: <94260000.1020868034@[192.168.200.4]>
In-Reply-To: <064b01c1f69a$71b9c100$070414ac@Home.PIN.LU>
References: <Pine.LNX.4.33.0205081213340.3518-100000@diablo.unixag-zw.fh-kl.d e>
    <064b01c1f69a$71b9c100$070414ac@Home.PIN.LU>
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
Date: Wed May  8 09:27:06 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

>> What i would like  is a solution which is between LVM and a RAIDx. LVM
>> has in my eyes the disadvantage that you create a filesystem over
> different
>> drives/partitions. If you lose one you nearly lose everything.

You don't create LV's on a "drive". You create them on a Physical
Volume ("PV"). This matters, becuse LVM has no real idea what the
underlying PV is, only that it's there. If the PV is RAID5 then
you can loose a disk drive without loosing the PV or any data on it.

>> With a RAID you lose a harddrive/partition (diskspace) to build it (more
>> costs for harddrives and maybe a controller).

You are not going to get reliability on multi-drive sytems without
SOME sort of redundancy. Either back the data up offline (e.g., to
tape, another disk or CD) or use RAID. If you really find the cost
of a single disk drive that prohibitive then feel free to pay for
it in time: make tape backups every time there is sufficient data
to be worth not re-entering.

Now you know why most people are willing to pay RAID5 -- many
companies I work for prefer RAID1+0 (i.e., mirroring individual
disks at the hardware level then appending their space into a
single large PV).

A 4-disk RAID5 doesn't eat that much of your total space and
should give reaonable performance. If you're desparate for
space, use an 8-drive stripe w/ 1b chunks.


> I'm too chicken to have faith in pvmove ;-)

Prbably a wise choice, especially since your method requires
accessing the most-used data.

Another approach is to cpio -p the items to a new location
and soft-link the old directory.

Main problem is that as the data use changes over time you
will likely have the least-used data filling the RAID5 system
and no more room for the hot stuff.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
