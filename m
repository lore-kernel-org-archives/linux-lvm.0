Message-ID: <3C03F0C7.DB486DAD@berbee.com>
From: Scott P <pichelma@berbee.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM limit on PE's/size?
References: <3C03CEB1.E5D5D447@berbee.com> <20011127112556.D730@lynx.no>
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
Date: Tue Nov 27 14:01:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Andreas,

Thanks so much for the insight!

Here is some ouput, it looks like we might be ok?
Please comment, if possible, thanks...

-Scott

[root@ptb3 pichelma]# /sbin/pvdisplay /dev/sdb1
--- Physical volume ---
PV Name               /dev/sdb1
VG Name               exp300_2
PV Size               440.71 GB / NOT usable 26.75 MB [LVM: 176 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       32768
Total PE              14102
Free PE               0
Allocated PE          14102
PV UUID               1gKwp2-dotn-0WJU-5FwZ-uScI-OyMH-SHVw5F


[root@ptb3 pichelma]# /sbin/pvdisplay /dev/sdc1
--- Physical volume ---
PV Name               /dev/sdc1
VG Name               exp300_2
PV Size               440.71 GB / NOT usable 26.75 MB [LVM: 176 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       32768
Total PE              14102
Free PE               0
Allocated PE          14102
PV UUID               ciUWIf-i9OO-okne-Fs6R-fjU1-NPpr-Ml4p8L


[root@ptb3 pichelma]# /sbin/pvdata -P /dev/sdb1
--- Physical volume ---
PV Name               /dev/sdb1
VG Name               exp300_2
PV Size               440.71 GB / NOT usable 26.75 MB [LVM: 176 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       32768
Total PE              14102
Free PE               0
Allocated PE          14102
PV UUID               1gKwp2-dotn-0WJU-5FwZ-uScI-OyMH-SHVw5F


[root@ptb3 pichelma]# /sbin/pvdata -P /dev/sdc1
--- Physical volume ---
PV Name               /dev/sdc1
VG Name               exp300_2
PV Size               440.71 GB / NOT usable 26.75 MB [LVM: 176 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       32768
Total PE              14102
Free PE               0
Allocated PE          14102
PV UUID               ciUWIf-i9OO-okne-Fs6R-fjU1-NPpr-Ml4p8L



Andreas Dilger wrote:

> On Nov 27, 2001  11:34 -0600, Scott P wrote:
> > We are planning to add a 3 rd EXP300 array to out current server w/ 2
> > EXP300's in place already!  We WILL surpass the 1 TB size, if possible?
>
> Depends if the driver does 32-bit block numbers with signed or unsigned
> values.  The absolute maximum supported by 2.4 kernels is 2TB devices.
> I don't know if 2.2 will support > 1TB devices, but it is possible.
>
> > Linux ptb3 2.2.19 #2 SMP Tue Jul 24 11:53:29 CDT 2001 i686 unknown
> >
> > We are using:
> > lvm_0.9.1_beta7
> > reiserfsprogs-3.x.0j
>
> Get newer LVM tools, like 1.0.1, because the old ones have lots more bugs.
> Beta 7 has the PE alignment bug, so you should upgrade the tools even if
> you can't upgrade the kernel.
>
> > Here is the current filesystem and size:
> >
> > /dev/exp300_2/exp300_lv2 924160464 891307744  32852720      97% /files1
>
> > Q: Why are my logical volumes limited to 256 GB in size?
> > A: This is NO absolute limit but it depends on the physical extent size
> > you configured at volume group creation time.
>
> Check what "pvdata -P /dev/whatever" tells you about the PE size.  If
> it is 16386kB, then you are limited to 1TB in size.  If it is larger
> than that, you _may_ be able to go past 1TB, but you may not, depending
> on whether your drivers and kernel work properly or not.
>
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
