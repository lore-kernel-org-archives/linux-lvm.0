Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j23N4rK12544
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 18:04:53 -0500
Received: from pastinakel.tue.nl (pastinakel.tue.nl [131.155.2.7])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j23N4j8w009717
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 18:04:45 -0500
Received: from iris.tue.nl (iris.tue.nl [131.155.2.34])
	by pastinakel.tue.nl (Postfix) with ESMTP id CA2A714BB8A
	for <linux-lvm@redhat.com>; Fri,  4 Mar 2005 00:04:40 +0100 (CET)
Received: from [131.155.224.79] (t-26-79.athome.tue.nl [131.155.224.79])
	by iris.tue.nl (Postfix) with ESMTP id C1DC110C07C
	for <linux-lvm@redhat.com>; Fri,  4 Mar 2005 00:04:40 +0100 (CET)
Message-ID: <42279807.60501@are-b.org>
Date: Fri, 04 Mar 2005 00:04:39 +0100
From: oliver <oliver@are-b.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Internal Knowlegde required. Follow up.
References: <4225FBC8.9020904@are-b.org>	<20050302174819.GN17589@lug-owl.de>	<4225FEBC.2060505@are-b.org>	<20050302180537.GO17589@lug-owl.de>	<42260F1B.2030803@are-b.org>	<1109791034l.28794l.3l@tangerine>	<1109796276.31821.263.camel@seki.nac.uci.edu>	<42278F9F.4090009@are-b.org>
	<42279465.8090009@are-b.org>
In-Reply-To: <42279465.8090009@are-b.org>
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

I couldn't figure out what was written at first onto this disk. The 
first few bytes made sense, text strings about Missing operation system 
and such. However 0x1fe and 0x1ff it said '55 AA'. Looking at my 
'normal' partitioned hda it made perfect sense however. That's the exact 
point where all the 'data' e.g. partition table? stops. So unless this 
raid controller wrote data anywhere else (got an e-mail to highpoint and 
waiting for answer on that) I can even say that only the first 0x200 
addresses (512 bytes DOH) are foobared.

So the re-ask and re-phrase my question. Does pvcreate write 'different' 
data each run in the first 512 bytes. Not counting the UUID and the 
timestamp. Does vgcreate write anything else in the first 512 besides 
the volume name on 0xac?

I hope some one can answer me that. If not by tomorrow round 3ish, I 
might get bold and try it anyhow! HA! And then, all I can ask for is 
lots of luck.


(The plan then, for those interested, and future archive readers is to:
    pvcreate on hde
    dd the first 512 bytes, edit the UUID and the timestamp (timestamp 
will match hdg, 'just in case it needs to be older'
    restore the backup I still have of hde (while I sleep as it takes 2 
hours or so with just dd if=/mnt/hd/backupfile of=/dev/hde atleast the 
other way around did)
    dd the first 512 bytes from above with the new UUID back onto hde.
    Party!, I hope.
)


oliver wrote:

> WAS: Re: [linux-lvm] Partition table gone? Any way to restore?
>
> After further examination the 'hostname<someserialnumber>' I've 
> mention that worried me at first appears to be a unix timestamp. I 
> don't think that it matters much. I've noticed that on my other LVM 
> setup where I most likley did a pvcreate /dev/hdg /dev/hdi (to create 
> them simultaniously) since the timestamps are 100% identical.
>
> So I think I can be pretty safe by using the timestamp on my hde that 
> I have on my hdg. I did create them the same day, I'm sure of that. (I 
> am using LVM to span across multipledisks after all) The 3rd disk was 
> added later, hence the different timestamp. So all I really need to 
> know if some kind of crc/hash is computed after 0x0001000 so that I 
> can try this.
>
> Oliver.
>
> oliver wrote:
>
>> Small update. Using a hex editor i was able to more closley examine 
>> my disk(s). Since I have 2 LVM setups I was somewhat able to compare 
>> what I have to what I should have. I do still need some insite however.
>>
>> From what I can tell, pvcreate only modifies the first few k's of the 
>> disk, followed by information stored from the vgcreate.
>> Then the lvcreate adds some more information after this. (vg00/lv 
>> basicly).
>>
>> I hope i got it right so far : )
>>
>> Now, the vgcreate information is identical on the two surviving parts 
>> except for a 'hostname<someserialnumber>' part around address 0x00012c.
>>
>> Then at 0x0001000 we see the UUID of the VG passing by followed by 
>> some data (which is identical on all three vgs.
>>
>> I don't think i have to look beyond this point in space/address.
>>
>> Assuming that none of the tools (besides pvcreate) write anything 
>> before 0x0001000, I should be able to pvcreate /dev/hde edit the UUID 
>> of that specific PV (to the same stored in the other two PV's so the 
>> three match up again) and have a fully workable LVM set again.
>>
>> The only thing that might worry me is crc information stored 
>> somewhere after 0x0001000 (However it appears to me that there isn't 
>> a whole bunch of data stored before 0x0001000 and the data created by 
>> pvcreate is identical on all 3 drives with the exception of the UUID 
>> so the crc value should match again) and the string 'vg00'at 0x0000ac 
>> i see on all disks (the name of the vg.
>>
>> What my question is (without spending days reading the sourcecode : ) 
>> is am I correct? Assuming that all the 'important' metadata and such 
>> is stored 'after' 0x0001000 hex, is there a good chance of it working?
>>
>> I'm thinking of running a pvcreate, change the UUID of the PV to what 
>> I expect it to be, add 'vg00' at 0x000ac and be happy?
>>
>> I could simply try, I know, but some feedback first would be 
>> appreciated ; ) I really don't want to loose my data.
>>
>> Thanks a lot.
>>
>> Oliver
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
