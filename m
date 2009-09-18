Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8IKmQgV011361
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 16:48:27 -0400
Received: from smtp.bredband2.com (smtp.bredband2.com [83.219.192.166])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8IKm8D2026705
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 16:48:09 -0400
Received: from caramon (c-83-219-217-17.cust.bredband2.com [83.219.217.17])
	by smtp.bredband2.com (Postfix) with ESMTPA id 07986FE042
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 22:47:29 +0200 (CEST)
Message-ID: <127450ED38024F8FA2FD360E99F363ED@caramon>
From: "Fredrik Skog" <fredrik.skog@rodang.se>
References: <4AB3DE8E.9080301@candelatech.com> <4AB3E3F7.2060704@redhat.com>
Date: Fri, 18 Sep 2009 22:47:26 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Disk crash on LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi

I'm a beginner with LVM2. I run Gentoo Linux with a LV consisting och 5 
physical drives. I use LVM2 as it's installed so i guess it's not striped. 
It started out with read problems of the drive at certain times, it took a 
long time to access files. I then used smartctl to test the drive and it 
reported a failure.

ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED 
WHEN_FAILED RAW_VALUE
  1 Raw_Read_Error_Rate     0x000f   200   200   051    Pre-fail 
s       -       1453
  3 Spin_Up_Time            0x0003   148   148   021    Pre-fail 
s       -       7591
  4 Start_Stop_Count        0x0032   100   100   000    Old_age 
ys       -       38
  5 Reallocated_Sector_Ct   0x0033   126   126   140    Pre-fail  Always 
FAILING_NOW 591
  7 Seek_Error_Rate         0x000e   200   200   051    Old_age 
ys       -       0
....
...

I shut down the whole system and bought a new drive and added to the VG. 
When the failed drive is cold it's regognized by LVM when i boot, but if it 
gets warm it's not even recognized. a pvs results in this

# pvs
  /dev/sdc: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdc1: read failed after 0 of 2048 at 0: Input/output error
  /dev/block/253:0: read failed after 0 of 4096 at 500103577600: 
Input/output error
  /dev/block/253:0: read failed after 0 of 4096 at 500103634944: 
Input/output error
  /dev/sdc: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdc: read failed after 0 of 4096 at 500107771904: Input/output error
  /dev/sdc: read failed after 0 of 4096 at 500107853824: Input/output error
  /dev/sdc: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdc: read failed after 0 of 4096 at 4096: Input/output error
  /dev/sdc: read failed after 0 of 4096 at 0: Input/output error
  /dev/sdc1: read failed after 0 of 1024 at 500105150464: Input/output error
  /dev/sdc1: read failed after 0 of 1024 at 500105207808: Input/output error
  /dev/sdc1: read failed after 0 of 1024 at 0: Input/output error
  PV         VG    Fmt  Attr PSize   PFree
  /dev/hda1  vgftp lvm2 a-    74.51G      0
  /dev/hda2  vgftp lvm2 a-    74.51G      0
  /dev/hda3  vgftp lvm2 a-    74.51G      0
  /dev/hda4  vgftp lvm2 a-    74.55G      0
  /dev/hdb1  vgftp lvm2 a-    74.51G      0
  /dev/hdb2  vgftp lvm2 a-    74.51G      0
  /dev/hdb3  vgftp lvm2 a-    74.51G      0
  /dev/hdb4  vgftp lvm2 a-    74.55G      0
  /dev/sdb1  vgftp lvm2 a-   931.51G      0
  /dev/sdc1  vgftp lvm2 a-   465.76G      0
  /dev/sdd1  vgftp lvm2 a-   931.51G      0
  /dev/sde1  vgftp lvm2 a-     1.36T 931.50G

I want to do a pvmove from the old drive to my newly added drive, but as 
soon as i do that i get the same error as when i do the pvs command. Maybe I 
will try to freeze my drive if nothing else works. Is there a way to force 
pvmove or somethin similiar? I really would like to rescue as much data as 
possible from the failed drive.

If it's not possible to rescue anything from the drive. How should i proceed 
for best results regarding the rest of the drives? Will i still be able to 
access the files on the other drives?
How do i remove the failed drive in a good maner? pvremove? vgreduce?

I couldn't seem to find any info on how to best remove a failed drive with 
an accepted data loss.

thanks
/Fredrik




----- Original Message ----- 
From: "Milan Broz" <mbroz@redhat.com>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Friday, September 18, 2009 9:48 PM
Subject: Re: [linux-lvm] Question on compatibility with 2.6.31 kernel.


> Ben Greear wrote:
>> I recently tried to boot 2.6.31 on Fedora 8, and it couldn't
>> find the volume groups.  The same kernel works fine on F11.
>
> try to recompile kernel with
> CONFIG_SYSFS_DEPRECATED=y
> CONFIG_SYSFS_DEPRECATED_V2=y
>
> (old lvm will not understand new sysfs design, this should
> provide old sysfs entries)
>
>> Someone on LKML said they had similar problems on an old Debian Etch
>> system and to fix it they installed a new version of lvm2 and put
>> that in the initrd.
>
> yes, this is another option, new lvm2 (I think >2.02.29) should work.
> But note that also device-mapper library must be updated.
>
> Milan
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ 
