Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j21G33K26008
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 11:03:03 -0500
Received: from dermis.amis.com (dermis.amis.com [207.141.5.253])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j21G2vx0006879
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 11:02:58 -0500
Message-ID: <4224922E.8070503@theserrs.net>
Date: Tue, 01 Mar 2005 09:02:54 -0700
From: Scott Serr <serrs@theserrs.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm over raid5 - sizes
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAiKro/zVEU02Xw5blW4RJy8KAAAAQAAAA3hs8l0VXbU2EEHXI+Ey1iwEAAAAA@echohome.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAiKro/zVEU02Xw5blW4RJy8KAAAAQAAAA3hs8l0VXbU2EEHXI+Ey1iwEAAAAA@echohome.org>
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
To: Erik@echohome.org, LVM general discussion and development <linux-lvm@redhat.com>

Oh wow...  I thought EMVS was a LVM2 "equivalent."  Can't really give 
you any ideas about EMVS without doing some reading, but the "RAID5 
region" sounds neat.

My Experience:
I've been using LVM2 ontop of software RAID5 for over a year.  I've been 
happy with it.  It seems a little slow... but I don't care too much.  I 
know atleast some other people are doing it, and it does fit my needs.  
I've gone through the whole "grow" process twice now.  It is time 
consuming to grow the disk, but you don't have to sit and watch...  and 
you can have the system live if you wish.  A "pvmove /dev/md0 /dev/md3" 
takes about 8 hours with their sizes about 174GB.

If you can afford 1 hot spare (like your other message said) you might 
want to go with RAID1, it would be faster.


Erik Ohrnberger wrote:

>Well, I have a similar problem/desire.
>
>I want to have RAID5 for redundancy/reliability.  But I want to be able to
>resize the file system stored on the RAID5 array, as well as being able to
>add and remove hard disks to either increase/decrease available storage.
>
>What would be your recommendation for a configuration?
>
>At the moment, I'm considering using EVMS with its RAID5 regions, and put
>LVM2 on top of it.
>
>Thanks in advance,
>    Erik.
>
>  
>
>>-----Original Message-----
>>From: linux-lvm-bounces@redhat.com 
>>[mailto:linux-lvm-bounces@redhat.com] On Behalf Of Sam Vilain
>>Sent: Monday, February 28, 2005 12:11 AM
>>To: LVM general discussion and development
>>Subject: Re: [linux-lvm] lvm over raid5 - sizes
>>
>>
>>Scott Serr wrote:
>>    
>>
>>>I have alot of ideas going through my head.  Here is my situation:  
>>> 
>>>I've had 5 IDEs with 4 partitions each.  Each partition is 
>>>      
>>>
>>in a RAID5  
>>    
>>
>>>md:stripped.  
>>>md0 = hda5, hdb5, hdc5, hdd5, hde5  
>>>md1 = hda6, hdb6, hdc6, hdd6, hde6  
>>>md2 = hda7, hdb7, hdc7, hdd7  
>>>md3 = hda8, hdb8, hdc8, hdd8  
>>> 
>>>md0-3 are in an LVM2 volume group.  This makes it really nice when  
>>>expanding or adding another disk because I just pull say 
>>>      
>>>
>>md3 out of the  
>>    
>>
>>>volume group... rebuild md3 bigger and then add it back.  
>>>I just upgraded, replacing hde with a bigger disk and while 
>>>      
>>>
>>the pvmoves  
>>    
>>
>>>are taking FOREVER...  I thought what is the right size for 
>>>      
>>>
>>the RAID5  
>>    
>>
>>>chunk-size?  
>>> 
>>>I have chunk-size = 128k right now.  
>>> 
>>>The pv extents size is (always?) 4MB.  
>>> 
>>>Am I just shooting myself in the foot by not making my RAID 
>>>      
>>>
>>chunk size  
>>    
>>
>>>atleast 1MB?  Can someone give me a reason to increase it?
>>>      
>>>
>>You're shooting yourself in the foot with RAID 5 and a crazy 
>>setup like this in the first place.  I sure hope this isn't 
>>for a production box :)
>>
>>Just get more disks and use RAID 1.  It's faster, simpler, 
>>and more robust.  You can still do all of the tricks that 
>>you're looking for.
>>
>>Hey, maybe one of the disks has failed.  Standard RAID 5 
>>behaviour as designed in this case is to slow to a crawl.  
>>Alternatively maybe you're just experiencing what is known in 
>>the 'biz as "The Butterfly Effect".
>>
>>With most striping, keep the chunk size as large as possible. 
>> It's a real waste to spend 10ms waiting for the disk platter 
>>to rotate, and then only read 128kB of data.  Set it as high 
>>as possible.
>>-- 
>>Sam Vilain, sam /\T vilain |><>T net, PGP key ID: 0x05B52F13 
>>(include my PGP key ID in personal replies to avoid spam filtering)
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>    
>>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  
>
