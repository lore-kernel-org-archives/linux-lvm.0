From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Some questions after starting to use 1.1-rc1
Message-Id: <20020425122528.D16336@sistina.com>
References: <E16yxHV-0001Ck-00@whittlesey.cl.cam.ac.uk>
MIME-Version: 1.0
In-Reply-To: <E16yxHV-0001Ck-00@whittlesey.cl.cam.ac.uk>; from
    Piete.Brooks@cl.cam.ac.uk on Sat, Apr 20, 2002 at 05:00:08PM +0100
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
Date: Thu Apr 25 05:26:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Apr 20, 2002 at 05:00:08PM +0100, Piete Brooks wrote:
> I've been using 0.9.1_beta6 for ages, and just upgraded to 1.1-rc1
> (I like "-qn" and the fact that minor device numbers are static!)
> 
> 1) I've been comparing the speed of LVM over RAID0 with striped LVM, using:
> 	perl -e '$n=1900;$x="X"x(1024*1024);foreach $i(1..$n){print $x}'
>    and I find that striped LVM takes 50% longer.
>    Due to the different areas on the physical disk, there should be some
>    difference (hdparm shows 37MB/s vs 31MB/s) and the stride might effect
>    things, but vmstat shows that with striped LVM there is a period of disk
>    IO, then no disk IO at the end (sample at end of email).  Any ideas why ?

Hi Piete,

which stripe size did you use?
Were the PVs on non-saturated pathes?
Did you compare LVM1 Raid0 to MD Raid0 on the very same hardware?

> 
> 2) When I tried to extend the striped partition, it failed when it used up the
>    first two PVs, and will not start the next two.  Ideas ?

That's a LVM1 constraint which will disapear with LVM2.

> 
> #  lvextend -L+1 /dev/vg97/test
> lvextend -- rounding relative size up to physical extent boundary
> lvextend -- rounding size to stripe boundary size
> lvextend -- extending logical volume "/dev/vg97/test" to 2 GB
> lvextend -- not enough free/allocatable physical extents to extend logical 
> volume "/dev/vg97/test"
> 
> # pvscan
> ...
> pvscan -- ACTIVE   PV "/dev/.../part26" of VG "vg97" [1020 MB / 0 free]
> pvscan -- ACTIVE   PV "/dev/.../part27" of VG "vg97" [1020 MB / 1020 MB free]
> pvscan -- ACTIVE   PV "/dev/.../part26" of VG "vg97" [1020 MB / 0 free]
> pvscan -- ACTIVE   PV "/dev/.../part27" of VG "vg97" [1020 MB / 1020 MB free]
> pvscan -- total: 24 [39.13 GB] / in use: 24 [39.13 GB] / in no VG: 0 [0]
> 
> #
> 
> 3) When trying out the new "-qn" (rah rah!) I wanted to tell the system
> 	forget about vg99; stop one PV; vgscan
>    to see how it got on with a missing PV.  The only way I could think of to
>    say "forget vg99" was to vgexport it. Stopped one RAID array, and vgscan
>    found vg99 (no need for "-qn" as I remember). Great ! restarted the array.
>    However, I could not the "forget" about vg99 again to allow me to add the
>    PV back again, as when I tried to export it, it said it was already
>    exported (I assume because it saw the array which I had restarted ...
>    a) Is there a better way to say "forget about vg99" ?
> 	(e.g. "vgremove --leave-all-data-ASIS /dev/vg99")
>    b) should it be possible to export a VG if there is a PV of that VG which
>       is still exported ?

No need to vgexport to test it.
Just stop one PV as you did adn "vgscan;vgchange -ay vg99" and it should
complain about gone VG quorum.
"vgchange -qn -ay vg99" should help this situation and activate the VG.


> 
> 4) http://www.sistina.com/lvm_howtos/lvm_howto/Recovery_when_things_go_w.html
>    (etc) are empty apart from:
> 	This is just stuff from the end of Joe's new LVM HowTo draft that I
> 	didn't know where to put. It should get moved to separate files as
> 	content is added 
>   but there is no "stuff" :-((   Where is "Joe's" HowTo ?

You found an old reference :-(
We'll remove it.

> 
> 5) is there some utility to display the contents of VGDA on disk, /etc/lvm*,
>    etc;  show where the first PE is in a PV, etc ?

Run "pvdata -a" on the particular PV.

> 
> 
> vmstat output:
> 
>    procs                    memory    swap          io     system         cpu
>  r  b  w swpd   free   buff  cache  si  so    bi    bo   in    cs  us  sy  id
>  1  0  0    0 1658156   6640 323648   0   0     0     0  135    53   0  50  50
>  1  0  1    0 1488868   6640 464556   0   0     0 60832  751    42   0  84  16
>  1  0  1    0 1394820   6640 553644   0   0     0 53640  872    37   0  82  18
>  1  0  1    0 1325356   6640 631468   0   0     0 43532  935    32   1  78  21
>  2  0  1    0 1269744   6640 689836   0   0     0 54848 1095    31   0 100   0
>  1  0  1    0 1192132   6640 759468   0   0     0 59680  925    32   0 100   0
>  2  0  1    0 1163724   6640 808620   0   0     0 44600 1139    31   0 100   0
>  1  0  1    0 1125648   6640 854700   0   0     0 55364 1625    35   1  99   0
>  1  0  1    0 1085020   6640 896684   0   0     0 60380 2188    31   0 100   0
>  1  0  1    0 956880   6640  975532   0   0     0 91424 1639    30   0 100   0
>  1  0  1    0 885072   6640 1061548   0   0     0 36624  916    34   1  77  22
>  1  0  1    0 870856   6640 1104556   0   0     0 38384 1169    31   0  99   0
>  1  0  1    0 762148   6640 1190692   0   0     0 69908  873    31   0  93   7
>  1  0  1    0 711120   6640 1259180   0   0     0 37896 1331    32   1  87  12
>  2  0  1    0 655180   6640 1315500   0   0     0 57808 1356    34   1  99   0
>  1  0  1    0 576164   6640 1381036   0   0     0 67068 1261    33   0 100   0
>  2  0  1    0 557596   6640 1423020   0   0     0 43252 1170    29   1  99   0
>  2  0  1    0 444896   6640 1500144   0   0     0 82376 1372    34   0 100   0
>  1  0  1    0 411028   6640 1549996   0   0     0 45384 1112    33   0 100   0
>  1  0  1    0 359984   6640 1604268   0   0     0 55176 1157    33   2  97   1
>  1  0  1    0 322548   6640 1654276   0   0     0 90664 1264    35   0  95   5
>  1  0  1    0 256308   6640 1725492   0   0     0 68960 1147    35   0  56  43
>  1  0  1    0 168056   6640 1813744   0   0     0 42748  941   139   0  49  51
>  1  0  1    0 108168   6640 1873632   0   0     0 76124 1120   126   0  51  49
>  0  1  1    0  35012   6640 1946788   0   0     0 45216  928   174   0  46  54
>  1  0  1    0  17240   6640 1964560   0   0     0 52916 1183   315   0  51  49
>  1  0  1    0  17244   6640 1964556   0   0     0 67456 1149    34   0  56  44
>  1  0  0    0  17244   6640 1964556   0   0     0 59724  838    36   0  54  46
>  1  0  0    0  17244   6640 1964556   0   0     0     0  767    31   0  50  50
>  1  0  0    0  17244   6640 1964556   0   0     0     0  112    31   0  50  50
>  1  0  0    0  17244   6640 1964556   0   0     0     0  117    31   0  51  49
>  1  0  0    0  17244   6640 1964556   0   0     0     0  115    30   0  50  50
>  1  0  0    0  17244   6640 1964556   0   0     0     0  109    33   0  50  50
>  1  0  0    0  17244   6640 1964556   0   0     0     0  116    31   0  50  50
>  1  0  0    0  17244   6640 1964556   0   0     0     0  109    30   0  50  50
>  1  0  0    0  17244   6640 1964556   0   0     0     0  110    33   0  51  49
>  1  0  0    0  17244   6640 1964556   0   0     0     0  111    31   0  50  50
>  1  0  0    0  17244   6640 1964556   0   0     0     0  115    31   0  50  50
>  1  0  0    0  17240   6640 1964560   0   0     0     0  114    32   0  50  50
>  1  0  0    0  17240   6640 1964560   0   0     0     0  116    31   0  51  49
>  1  0  0    0  17240   6640 1964560   0   0     0     0  114    32   0  52  48
>  1  0  0    0  17240   6640 1964560   0   0     0     0  116    31   0  50  50
>  1  0  1    0  50584   6640 1933328   0   0     0     0  124    43   0  53  46
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

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
