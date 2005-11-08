Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA8B2XV11821
	for <linux-lvm@redhat.com>; Tue, 8 Nov 2005 06:02:33 -0500
Received: from oxtel.com ([195.219.3.158])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA8B2Nm9001339
	for <linux-lvm@redhat.com>; Tue, 8 Nov 2005 06:02:24 -0500
Received: from 10.96.99.102 by oxtel.com ([10.96.1.33] running VPOP3) with
	ESMTP for <linux-lvm@redhat.com>; Tue, 8 Nov 2005 11:01:52 -0000
Message-ID: <437086A1.6020905@oxtel.com>
Date: Tue, 08 Nov 2005 11:06:09 +0000
From: Tom Robinson <tom.robinson@oxtel.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgchange partial mount fails
References: <436FD150.9080800@oxtel.com> <20051108100023.GA30556@redhat.com>
In-Reply-To: <20051108100023.GA30556@redhat.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Heinz Mauelshagen wrote:

>On Mon, Nov 07, 2005 at 10:12:32PM +0000, Tom Robinson wrote:
>  
>
>>Hi,
>>
>>I'm trying to do a partial mount of a VG in order to rescue data from it
>>(the last of the 8 PVs has died)
>>
>>If I do vgchange -P -a y vg1
>>It says:
>>
>> Partial mode. Incomplete volume groups will be activated read-only.
>> 7 PV(s) found for VG vg1: expected 8
>> Logical volume (lv1) contains an incomplete mapping table.
>> 7 PV(s) found for VG vg1: expected 8
>> Logical volume (lv1) contains an incomplete mapping table.
>> 1 logical volume(s) in volume group "vg1" now active
>>
>>Which looks like it might have worked, but in /dev/mapper I have:
>>
>>crw-rw----  1 root root  10, 63 May 30 02:48 control
>>brw-------  1 root root 254,  0 Oct 25 13:20 vg1-lv1
>>
>>But I can't mount vg1-lv1 (its ext2 - but it says "must specify fs type).
>>    
>>
>
>Looks like expected behaviour.
>
>You're likely missing the beginning of your filesystem which was mapped
>to the dead PV and the fs code fails to find its metadata
>(ie. superblock).
>
>Check with "lvdisplay -m /dev/vg1/lv1"
>  
>

Thanks for your response, Heinz,

vaus root # lvdisplay -m /dev/vg1/lv1
  7 PV(s) found for VG vg1: expected 8
  7 PV(s) found for VG vg1: expected 8
  Volume group "vg1" not found

Thing is, /dev/vg1/lv1 doesn't exist at all,
It used to, when everything was working.
Only /dev/mapper exists.

I have had the server running for about 3 years,
and only added the last (dead) PV about 2 months ago
so would it still put the superblock there?

Any suggestions at all on how to rescue any data?

Oh, heres the first bit of output of lvdisplay -mP /dev/vg1/lv1
if it helps:

  Partial mode. Incomplete volume groups will be activated read-only.
  --- Logical volume ---
  LV Name                /dev/vg1/lv1
  VG Name                vg1
  LV UUID                000000-0000-0000-0000-0000-0000-000000
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1.51 TB
  Current LE             49447
  Segments               7486
  Allocation             normal
  Read ahead sectors     1024
  Block device           254:0
  
  --- Segments ---
  Logical extent 0 to 4883:
    Type                linear
    Physical volume     /dev/cdrom
    Physical extents    0 to 4883
  
  Logical extent 4884 to 8545:
    Type                linear
    Physical volume     /dev/hdf
    Physical extents    0 to 3661
  
  Logical extent 8546 to 12051:
    Type                linear
    Physical volume     /dev/hde4
    Physical extents    0 to 3505
  
  Logical extent 12052 to 19530:
    Type                linear
    Physical volume     /dev/hdh
    Physical extents    0 to 7478
  
  Logical extent 19531 to 27009:
    Type                linear
    Physical volume     /dev/hda
    Physical extents    0 to 7478
  
  Logical extent 27010 to 34488:
    Type                linear
    Physical volume     /dev/hdb
    Physical extents    0 to 7478
  
  Logical extent 34489 to 41967:
    Type                linear
    Physical volume     /dev/hdc
    Physical extents    0 to 7478
  
  Logical extent 41968 to 41968:
    Type                linear
    Physical volume     Missing
  
  Logical extent 41969 to 41969:
    Type                linear
    Physical volume     Missing

etc......


Regards,
  Tom

















>Regards,
>Heinz    -- The LVM Guy --
>
>  
>
vaus root # lvdisplay -m /dev/vg1/lv1
  7 PV(s) found for VG vg1: expected 8
  7 PV(s) found for VG vg1: expected 8
  Volume group "vg1" not found




>>What is wrong? Have I misconfigured lvm / dm?
>>are there any lines I need in my config file?
>>Are there any tools I can run to get more info?
>>
>>The array was built with LVM1 & 2.4.18,
>>I'm now using LVM2/DM under 2.6.11.10
>>
>>Also, It looks like it has done something, because if I try
>>to deactivate it with "vgchange -P -a n vg1" I get:
>>
>> Partial mode. Incomplete volume groups will be activated read-only.
>> 7 PV(s) found for VG vg1: expected 8
>> Logical volume (lv1) contains an incomplete mapping table.
>> Can't deactivate volume group "vg1" with 1 open logical volume(s)
>>
>>Any help greatly appreciated.
>>Kind regards,
>>Tom
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>    
>>
>
>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
>Heinz Mauelshagen                                 Red Hat GmbH
>Consulting Development Engineer                   Am Sonnenhang 11
>Cluster and Storage Development                   56242 Marienrachdorf
>                                                  Germany
>Mauelshagen@RedHat.com                            +49 2626 141200
>                                                       FAX 924446
>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>  
>
