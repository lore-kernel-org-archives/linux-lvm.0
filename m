From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: [RFE] lvm-1.0.3 - progress bar similar to e2fsck for pvmove
Message-ID: <20020628135426.C24660@sistina.com>
References: <20020627140947.J2723@xanex.hippierage.org>
Mime-Version: 1.0
In-Reply-To: <20020627140947.J2723@xanex.hippierage.org>; from jmm@sublogic.com on Thu, Jun 27, 2002 at 02:09:47PM -0400
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
Date: Fri Jun 28 07:02:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Very strange output.

1.0.4 looks like this *without* -v ...

# /sbin/LVM_BRANCH_1-0/pvmove /dev/sdc1:5871-5873 /dev/sdc1:5874-5876
pvmove -- moving physical extents in active volume group "vg00"
pvmove -- WARNING: if you lose power during the move you may need
        to restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- 3 extents of physical volume "/dev/sdc1" successfully moved
pvmove -- this has been a test run WITHOUT any real change

... and like this *with* -v:

# /sbin/LVM_BRANCH_1-0/pvmove -v /dev/sdc1:5871-5873 /dev/sdc1:5874-5876
pvmove -- checking name of source physical volume "/dev/sdc1"
pvmove -- locking logical volume manager
pvmove -- reading data of source physical volume from "/dev/sdc1"
pvmove -- checking volume group existence
pvmove -- reading data of volume group "vg00" from lvmtab
pvmove -- checking volume group consistency of "vg00"
pvmove -- searching for source physical volume "/dev/sdc1" in volume group "vg00"
pvmove -- building list of possible destination physical volumes
pvmove -- checking destination physical volume names in command line
pvmove -- checking volume group activity
pvmove -- moving physical extents in active volume group "vg00"
pvmove -- WARNING: if you lose power during the move you may need
        to restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- starting to move extents away from physical volume "/dev/sdc1"
pvmove -- checking for enough free physical extents in "vg00"
pvmove -- /dev/sdc1 [PE 5871 [u1 [LE 1661]] -> /dev/sdc1 [PE 5874] [1/3]
pvmove -- /dev/sdc1 [PE 5872 [u1 [LE 1662]] -> /dev/sdc1 [PE 5875] [2/3]
pvmove -- /dev/sdc1 [PE 5873 [u1 [LE 1663]] -> /dev/sdc1 [PE 5876] [3/3]
pvmove -- changing lvmtab
pvmove -- unlocking logical volume manager
pvmove -- 3 extents of physical volume "/dev/sdc1" successfully moved
pvmove -- this has been a test run WITHOUT any real change


Which tool version is this?

Regards,
Heinz    -- The LVM Guy --



On Thu, Jun 27, 2002 at 02:09:47PM -0400, James Manning wrote:
> > James,
> > 
> > are you sure you didn't use the "-v" option of pvmove?
> > 
> > Without that option pvmove typically display 6-7 lines.
> > With that option it displays some more information plus a line for
> > every extent moved.
> 
> Yup - maybe verbose is triggered as an option in the warning
> case of physical extents in an active vg?  here's the top few
> lines from one such pvmove run.
> 
> [root@localhost root]# rpm -q lvm
> lvm-1.0.3-5
> [root@localhost root]# pvmove /dev/hda6
> pvmove -- moving physical extents in active volume group "Volume00"
> pvmove -- WARNING: if you lose power during the move you may need
>         to restore your LVM metadata from backup!
> pvmove -- do you want to continue? [y/n] y
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 352640, 0307 352640
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 360832, 0307 360832
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 369024, 0307 369024
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 377216, 0307 377216
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 385408, 0307 385408
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 393600, 0307 393600
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 401792, 0307 401792
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 409984, 0307 409984
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 418176, 0307 418176
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 426368, 0307 426368
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 434560, 0307 434560
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 442752, 0307 442752
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 450944, 0307 450944
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 459136, 0307 459136
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 467328, 0307 467328
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 475520, 0307 475520
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 483712, 0307 483712
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 491904, 0307 491904
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 500096, 0307 500096
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 508288, 0307 508288
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 516480, 0307 516480
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 524672, 0307 524672
> /dev/Volume00/group::/dev/Volume00/LogVol00: 0306 532864, 0307 532864
> [SNIP]
> -- 
> James Manning <http://www.sublogic.com/james/>
> GPG Key fingerprint = B913 2FBD 14A9 CE18 B2B7  9C8E A0BF B026 EEBB F6E4
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
