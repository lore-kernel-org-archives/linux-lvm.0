Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j16KFnO17325
	for <linux-lvm@redhat.com>; Sun, 6 Feb 2005 15:15:49 -0500
Received: from out1.smtp.messagingengine.com (out1.smtp.messagingengine.com
	[66.111.4.25])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j16KFmK1025377
	for <linux-lvm@redhat.com>; Sun, 6 Feb 2005 15:15:48 -0500
Received: from web3.messagingengine.com (web3.internal [10.202.2.212])
	by frontend1.messagingengine.com (Postfix) with ESMTP id C63D2C55010
	for <linux-lvm@redhat.com>; Sun,  6 Feb 2005 15:15:47 -0500 (EST)
Message-Id: <1107720948.6351.214448095@webmail.messagingengine.com>
From: "Ajeet Nankani" <fromkth+lvm@fastmail.fm>
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Date: Sun, 06 Feb 2005 12:15:48 -0800
Subject: [linux-lvm] Reducing PV/ Reclaiming free PEs from a PV to be used
 for another partition/purpose outside of LVM
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion & development <linux-lvm@redhat.com>

I have hda6 as the only PV in a Volume Group which contains 2 Logical
Volumes.
I have around 42 contiguous free PEs at the end of PV.
I want to reduce this PV by 42 or less PEs so that i can reduce hda6 and
create one more partion hda7(Fat32) for some other work.

There is not any straight command to do it atleat untill now, because i
tried to use pvresize and it said that command not implemented yet.

I thought of one way, but i am not sure it would work or not, so i need
you people comments on it.

First i will create a meta data backup of the Volume Group with the
command

vgcfgbackup which would give me meta file data as below 

================================================
description = "Created *after* executing 'pvmove -v -i 60 --alloc
anywhere /dev/hda6:233-264 /dev/hda6:192-223'"

creation_host = "XXXXX"        # Linux XXXXX 2.6.9-1.667 #1 Tue Nov 2
14:41:25 EST 2004 i686
creation_time = 1107716048      # Sun Feb  6 19:54:08 2005

VolGroup00 {
        id = "cdEPbO-5o71-hUIa-szPC-FAra-E79P-cdbuTS"
        seqno = 17
        status = ["RESIZEABLE", "READ", "WRITE"]
        extent_size = 65536             # 32 Megabytes
        max_lv = 0
        max_pv = 0

        physical_volumes {

                pv0 {
                        id = "BQSuB1-GYJf-bfdM-wnZd-JJgi-fZAM-jm4th6"
                        device = "/dev/hda6"    # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 384
                        pe_count = 266  # 8.3125 Gigabytes
                }
        }

        logical_volumes {

                LogVol00 {
                        id = "6WyF9L-t4dJ-8HrR-NdTo-CoZh-NKvl-z6fidr"
                        status = ["READ", "WRITE", "VISIBLE"]
                        segment_count = 1

                        segment1 {
                                start_extent = 0
                                extent_count = 192      # 6 Gigabytes

                                type = "striped"
                                stripe_count = 1        # linear

                                stripes = [
                                        "pv0", 0
                                ]
                        }
                }

                LogVol01 {
                        id = "N3auhB-e9br-76Cw-Eqvw-c31w-mq3Y-T5QBp8"
                        status = ["READ", "WRITE", "VISIBLE"]
                        segment_count = 1

                        segment1 {
                                start_extent = 0
                                extent_count = 32       # 1024 Megabytes

                                type = "striped"
                                stripe_count = 1        # linear

                                stripes = [
                                        "pv0", 192
                                ]
                        }
                }
        }
}
=====================================================================

Now here if i edit it and in physical volume section where it says that
pe_count = 266, i change it to pe_count = 224 which is the last PE used
by the Logical Volume.

after saving it if i run vgcfgrestore with this file, will my PV be
reduced?? after that i can reduce hda6 with parted or similar utility.

Any comments??

Thanks.

-ajeet.
