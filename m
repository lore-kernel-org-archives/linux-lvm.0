From: Andreas Dilger <adilger@turbolabs.com>
Date: Fri, 31 Aug 2001 11:05:12 -0600
Subject: Re: [linux-lvm] PBs with LVM over software RAID
Message-ID: <20010831110512.V541@turbolinux.com>
References: <3B8E3F0E.8050609@st-peter.stw.uni-erlangen.de> <20010830083546.A20989@sistina.com> <3B8EC633.40202@st-peter.stw.uni-erlangen.de> <3B8F8C5E.7030603@st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B8F8C5E.7030603@st-peter.stw.uni-erlangen.de>
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
To: svetljo <galia@st-peter.stw.uni-erlangen.de>
Cc: AJ Lewis <lewis@sistina.com>, linux-lvm@sistina.com, pixel@mandrakesoft.com, Mauelshagen@sistina.com

On Aug 31, 2001  15:08 +0200, svetljo wrote:
> [root@svetljo mnt]# mount -t xfs /dev/myData/Music music
> Segmentation fault

Generally this is a bad sign.  Either mount is segfaulting (unlikely)
or you are getting an oops in the kernel.  You need do run something
like "dmesg | ksymoops" in order to get some useful data about where
the problem is (could be xfs, LVM, or elsewhere in the kernel).

Once you have an oops, you are best off rebooting the system, because
your kernel memory may be corrupted, and cause more oopses which do
not mean anything.  If you look in /var/log/messages (or /var/log/kern.log
or some other place, depending on where kernel messages go), you can
decode the FIRST oops in the log with ksymoops.  All subsequent ones are
useless.


> the LV ( lvcreate -i3 -I4 -L26G -nMusic )
> 
> the VG -> myData   /dev/hdh10 /dev/linVG1/linLV1 /dev/linVG2/linLV2
> 
> /dev/hdh10 normal partition 14G
> /dev/linVG1/linLV1 ->  linear LV 14G /dev/hde6 /dev/hde12
> /dev/linVg2/linLV2 ->  linear LV 14G /dev/hdg1 /dev/hdg5 /dev/hdg6 /dev/hdg12

There is absolutely no point in doing this (not that it is possible to do
so anyways).  First of all, striping is almost never needed "for performance"
unless you are normally doing very large sequential I/Os, and even so most
disks today have very good sequential I/O rates (e.g. 15-30MB/s).  Secondly,
you _should_ be able to just create a single LV that is striped across all
of the PVs above.  You would likely need to build it in steps, to ensure
that it is striped across the disks correctly.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
