From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] performance comparison soft-hardware RAID + LVM: bad
Message-ID: <20021016100622.A11693@sistina.com>
References: <3DAC940D.7010903@netland.nl>
Mime-Version: 1.0
In-Reply-To: <3DAC940D.7010903@netland.nl>; from raarts@netland.nl on Wed, Oct 16, 2002 at 12:17:49AM +0200
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
Date: Wed Oct 16 03:28:47 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Oct 16, 2002 at 12:17:49AM +0200, Ron Arts wrote:
> Hello,
> 
> I am interested in performance for hardware/software RAID
> in combination with LVM
> 
> So I took a server (Dual Xeon 2.4GHz, 1Gb RAM), a RAID adapter,
> some identical SCSI disks and configured it with several of these
> options (using RH 8.0) and ran a few bonnie++ benchmarks.
> 
> Results are below. Anyone care to comment? Especially LVM performance
> disappointed here.
> 
> LVM machine setup:
> 
> 2 18Gb disks. I created 3 partitions on both disks, 128Mb, 512Mb and 17Gb
> Equal partitions were combined into RAID-1 devices (md driver).
> First md device mounted on /boot, second for swapfile, and third
> as basis for LVM
> 
> Out of the volume group four LV were created and mounted as follows:
> 
> [root@nbs-126 root]# df
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/vg0/root          4225092   1293064   2717400  33% /
> /dev/md0                124323     11517    106387  10% /boot
> /dev/vg0/home          4225092     32828   3977636   1% /home
> none                    514996         0    514996   0% /dev/shm
> /dev/vg0/var           4225092     51720   3958744   2% /var
> /dev/vg0/mysql        16513960     32828  15642272   1% /var/lib/mysql

Ron, I don't get your configuration by this df output :(

You've got 3 mirrored MDs on 2 disks (1st: 128Mb, 2nd: 512Mb, 3rd: 17Gb)

3rd is used as the one and only physical volume (say /dev/md2)
for volume group "vg0", right?

How comes that the grand total of /dev/vg0/{root, home, var, mysql}
is ~27.84Gb when the volume group only holds the 17Gb of /dev/md2?

> 
> Is there a reason for the performance degradation I saw with LVM?

If my above thoughts are correct, the logical volume(s) used could well be
suffering from bad mapping onto disk(s). You can check the mapping with
either "pvdisplay -v /dev/md2" or for eg. "lvdisplay -v /dev/vg00/root".
I don't feel sure about your MD configuration either.

Hope that spots some light on those numbers which differ from mine
(typically LVM gives a performamce enhancement for sequential input).
The mapping overhead of the LVM1 driver is in the sub percent order.

Regards,
Heinz    -- The LVM Guy --

> 
> Regards,
> Ron Arts
> 
> 
> Version  1.02c      ------Sequential Output------ --Sequential Input- --Random-
>                      -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
> Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
> nbs-126.offic 2008M 24005  99 66015  49 16148   7 27430  98 86915  15 369.0   1  single disk
> nbs-126.offic    2G 23422  99 70919  58 23800  11 25289  86 101485 17 433.4   1  s/w RAID-1
> nbs-126.offic    2G  8152  99 49897  94 23092  27  9122  92 78056  38 331.1   2  s/w RAID-1 + LVM
> nbs-126.offic 4032M 19695  99 44056  42 14179   9 21526  94 86450  16 344.3   1  h/w RAID-1
> nbs-126.offic 4032M 19916  99 24033  22 13343   9 22794  99 111662 30 388.5   1  h/w RAID-5
>                      ------Sequential Create------ --------Random Create--------
>                      -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
> files:max:min        /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
> nbs-126.office.n 16  2481  99 +++++ +++ +++++ +++  2424  99 +++++ +++  5508  98  single disk
> nbs-126.office.n 16  2530  99 +++++ +++ +++++ +++  2437  99 +++++ +++  6062 100  s/w RAID-1 soft
> nbs-126.office.n 16   800  99 +++++ +++ 12848  98   807  99 +++++ +++  2591  99  s/w RAID-1 + LVM
> nbs-126.office.n 16  2138  98 +++++ +++ 31126  98  2200  99 +++++ +++  5322  98  h/w RAID-1
> nbs-126.office.n 16  2182  99 +++++ +++ 27238  86  2172  98 +++++ +++  5261  97  h/w RAID-5
> 
> 
> Notes:
> 
> The last two are with hardware RAID (GDT 4513RZ), and 2Gb RAM instead of 1, but I adjusted
> the -s parameter for bonnie++ accordingly.
> 
> commandline:
> # ./bonnie++ -d /tmp -s 2048 -x2 -uroot
> Results shown are for the second run. Machines were otherwise inactive, and carried a
> minimum install.

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
