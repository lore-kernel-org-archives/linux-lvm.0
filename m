From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vg fun!
Message-ID: <20021112132847.B29161@sistina.com>
References: <Pine.LNX.4.44.0211111117300.9203-100000@pircsds0.agron.iastate.edu>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0211111117300.9203-100000@pircsds0.agron.iastate.edu>; from akrherz@iastate.edu on Mon, Nov 11, 2002 at 11:30:28AM -0600
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
Date: Tue Nov 12 06:34:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Daryl,

could well be an array dereference bug fixed in the recent version.
Please try the attached statically linked vgscan version 1.0.6 (presuming i386;
not send to the list).
If that works, you want to upgrade to 1.0.6.

Regards,
Heinz    -- The LVM Guy --


On Mon, Nov 11, 2002 at 11:30:28AM -0600, Daryl Herzmann wrote:
> Greetings,
> 
> (warning:  I am a newbie to LVM!  I am probably doing something stupid.)
> 
> Environment:
>   RedHat 8.0  (RH stock  2.4.18-14)
>   lvm-1.0.3-9
> 
> Before this machine became quasi-production, I was messing around with LVM 
> and Raid.  I probably screwed somethinng up royally and I am hoping that 
> someone could help me reverse it...
> 
> I have a RAID 5 array of 3 physical hard drives 120G and a hopefull LVM 
> combination of a 40 and 80 to make 120.  (I had this working for a few 
> days until a reboot)  After my reboot,  the lvm component of my raid array 
> failed and I have been degradded mode ever since...
> 
> So lets try my LVM commands...
> 
> # pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/md0"   is associated to unknown VG "test_vg" 
> (run vgscan)
> pvscan -- inactive PV "/dev/hdj1"  is associated to unknown VG "vg1" (run 
> vgscan)
> pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "vg1" (run 
> vgscan)
> pvscan -- total: 3 [229.29 GB] / in use: 3 [229.29 GB] / in no VG: 0 [0]
> 
> (I wanted to combine /dev/hdj1 and /dev/hdc1 to built vg1, the problem 
> appears to be why /dev/md0 still thinks it is a part of test_vg?)
> 
> # vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> Segmentation fault
> 
> # ls /etc/lvmconf/
> vg0.conf        vg0.conf.2.old  vg0.conf.4.old  vg1.conf.1.old
> vg0.conf.1.old  vg0.conf.3.old  vg1.conf
> 
> # ls -l /dev/test_vg
> ls: /dev/test_vg: No such file or directory
> 
> So I guess the question is how to I get rid of test_vg??  I think once I 
> eliminate test_vg, then my vg1 will behave correctly.  Oh, here is my 
> raidtab in case you are interested..
> 
> # cat /etc/raidtab 
> raiddev /dev/md0
>   raid-level             5
>   nr-raid-disks          4
>   nr-spare-disks         0
>   persistent-superblock  1
>   parity-algorithm       left-symmetric
>   chunk-size             128
>   device     /dev/hdf1
>   raid-disk  0
>   device     /dev/hdh1
>   raid-disk  1
>   device     /dev/hdl1
>   raid-disk  2
>   device     /dev/vg1/lvol1
>   raid-disk  3
> 
> 
> 
> TIA,
>   Daryl
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
