Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAFFuxr09600
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 10:57:00 -0500
Received: from navont3.navo.navy.mil (navont3.navo.navy.mil [128.160.42.3])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAFFuwgZ018792
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 10:56:59 -0500
Message-ID: <23E4371F6124D411B59B00805F9FA971158ABCF5@navont3.navo.navy.mil>
From: "Jean-Pierre, Azed Dr" <Jean-PierreA@NAVO.NAVY.MIL>
Date: Mon, 15 Nov 2004 09:56:38 -0600
MIME-Version: 1.0
Subject: [linux-lvm] restoring lvm volume group
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

All,


I created a volume group "m73304raid_vg1" with 2 physical volumes "/dev/sda"
and "/dev/sdc" .
I then created 2 logical volumes "/dev/m73304raid_vg1/raid_lv1" occupying
/dev/sda and 
 "/dev/m73304raid_vg1/raid_lv2" occupying /dev/sdc.    formated the volumes
with linux "ext3" file 
system and stored some data on the volumes.

One of the scsi devices where getting errors and hung up the system.  Now I
can't get the system
to mount the volumes:

I am running RedHat Enterprise Linux 3.0 (u3), but created the volumes under
(u1). I upgraded
to u3 to solve scsi issue, but started having problems with lvm under u1.


vgscan only found 0 of 4095 LEs for LV /dev/m73304raid_vg1/raid_lv2 ,  and
there are no reports of 
                      dev/m73304raid_vg1/raid_lv1.
          vgscan ERROR "vg_read_with_pv_and_lv():  allocated LE of LV  can't
get data of volume group 
          "m73304raid_vg1" from physical volumes(s)

vgchange -a y /dev/m73304raid_vg1 ,   reoprts
         volume group "m73304rai_vg1" does not exist.

pvscan  reports
        inactive PV "dev/sda" is assoceated with unknown VG "m73304raid_vg1"
(run vgscan)
        inactive PV "dev/sdc" is assoceated with unknown VG "m73304raid_vg1"
(run vgscan)

vgcfgrestore -n m73304raid_vg1 -v  -l  -l --test 
       shows all the right information about the original VG, LV and PV but 

vgcfgrestore -n m73304raid_vg1 -v  /dev/sda /dev/sdc          
     reports:  -- usage information
                   please enter physical volume name

can anybody help me recover my data?
         


___________________________________________
Azed Jean-Pierre, Ph.D.
Ocean Products Division  - Code N93
Naval Oceanographic Office
Stennis Space Center, MS 39522
(228) 689-8021
___________________________________________
