Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAD7LAPC019508
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2014 02:21:10 -0500
Received: from golfcontact.eu (golfcontact.eu [62.210.207.121])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAD7L8Nx016057
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2014 02:21:08 -0500
Received: from [10.0.0.140] (143.141.broadband17.iol.cz [109.80.141.143])
	by golfcontact.eu (Postfix) with ESMTPSA id 48A552880632
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2014 08:21:07 +0100 (CET)
Message-ID: <54645BE2.4000303@ttux.net>
Date: Thu, 13 Nov 2014 08:21:06 +0100
From: Marc des Garets <marc@ttux.net>
MIME-Version: 1.0
References: <5463DC2D.5020305@ttux.net>
	<CAD+pdNfniQEczbEO1aP+f2E-XhqjvnYrPSf+ig+OQzO6G+Gtbw@mail.gmail.com>
In-Reply-To: <CAD+pdNfniQEczbEO1aP+f2E-XhqjvnYrPSf+ig+OQzO6G+Gtbw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] broken fs after removing disk from group
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I think something is possible. I still have the config from before it 
died. Below is how it was. The disk that died (and which I removed) is 
pv1 (/dev/sdc1) but it doesn't want to restore this config because it 
says the disk is missing.

VolGroup00 {
         id = "a0p2ke-sYDF-Sptd-CM2A-fsRQ-jxPI-6sMc9Y"
         seqno = 4
         format = "lvm2"                 # informational
         status = ["RESIZEABLE", "READ", "WRITE"]
         flags = []
         extent_size = 8192              # 4 Megabytes
         max_lv = 0
         max_pv = 0
         metadata_copies = 0

         physical_volumes {

                 pv0 {
                         id = "dRhDoK-p2Dl-ryCc-VLhC-RbUM-TDUG-2AXeWQ"
                         device = "/dev/sda4"    # Hint only

                         status = ["ALLOCATABLE"]
                         flags = []
                         dev_size = 874824678    # 417.149 Gigabytes
                         pe_start = 2048
                         pe_count = 106789       # 417.145 Gigabytes
                 }

                 pv1 {
                         id = "NOskcl-8nOA-PpZg-DCtW-KQgG-doKw-n3J9xd"
                         device = "/dev/sdc1"    # Hint only

                         status = ["ALLOCATABLE"]
                         flags = []
                         dev_size = 625142385    # 298.091 Gigabytes
                         pe_start = 2048
                         pe_count = 76311        # 298.09 Gigabytes
                 }

                 pv2 {
                         id = "MF46QJ-YNnm-yKVr-pa3W-WIk0-seSr-fofRav"
                         device = "/dev/sdb1"    # Hint only

                         status = ["ALLOCATABLE"]
                         flags = []
                         dev_size = 3906963393   # 1.81932 Terabytes
                         pe_start = 2048
                         pe_count = 476923       # 1.81932 Terabytes
                 }
         }

         logical_volumes {

                 lvolmedia {
                         id = "aidfLk-hjlx-Znrp-I0Pb-JtfS-9Fcy-OqQ3EW"
                         status = ["READ", "WRITE", "VISIBLE"]
                         flags = []
                         creation_host = "archiso"
                         creation_time = 1402302740      # 2014-06-09 
10:32:20 +0200
                         segment_count = 3

                         segment1 {
                                 start_extent = 0
                                 extent_count = 476923   # 1.81932 Terabytes

                                 type = "striped"
                                 stripe_count = 1        # linear

                                 stripes = [
                                         "pv2", 0
                                 ]
                         }
                         segment2 {
                                 start_extent = 476923
                                 extent_count = 106789   # 417.145 Gigabytes

                                 type = "striped"
                                 stripe_count = 1        # linear

                                 stripes = [
                                         "pv0", 0
                                 ]
                         }
                         segment3 {
                                 start_extent = 583712
                                 extent_count = 76311    # 298.09 Gigabytes

                                 type = "striped"
                                 stripe_count = 1        # linear

                                 stripes = [
                                         "pv1", 0
                                 ]
                         }
                 }
         }
}

On 11/13/2014 12:11 AM, Fran Garcia wrote:
> On Wed, Nov 12, 2014 at 11:16 PM, Marc des Garets wrote:
>> Hi,
>> [...]
>> Now the problem is that I can't mount my volume because it says:
>> wrong fs type, bad option, bad superblock
>>
>> Which makes sense as the size of the partition is supposed to be 2.4Tb but
>> now has only 2.2Tb. Now the question is how do I fix this? Should I use a
>> tool like testdisk or should I be able to somehow create a new physical
>> volume / volume group where I can add my logical volumes which consist of 2
>> physical disks and somehow get the file system right (file system is ext4)?
> So you basically need a tool that will "invent" about 200 *Gb* of
> missing filesystem? :-)
>
> I think you better start grabbing your tapes for a restore...
>
> ~f
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
