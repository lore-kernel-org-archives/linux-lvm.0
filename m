Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAEKsNnr007410
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2014 15:54:23 -0500
Received: from golfcontact.eu (golfcontact.eu [62.210.207.121])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAEKsLtL027792
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2014 15:54:22 -0500
Received: from [10.0.0.145] (143.141.broadband17.iol.cz [109.80.141.143])
	by golfcontact.eu (Postfix) with ESMTPSA id 3A52B28805A9
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2014 21:54:11 +0100 (CET)
Message-ID: <54666BF2.3070204@ttux.net>
Date: Fri, 14 Nov 2014 21:54:10 +0100
From: Marc des Garets <marc@ttux.net>
MIME-Version: 1.0
References: <1415908098.760.YahooMailBasic@web181504.mail.ne1.yahoo.com>	<54650ED4.7030409@ttux.net>	<5465C07A.2080707@ttux.net>
	<546637EA.1010203@redhat.com> <54665506.3070301@ttux.net>
	<54665872.2020101@ttux.net>
In-Reply-To: <54665872.2020101@ttux.net>
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

It's all sorted, fsck did the job and the only thing I lost is what was 
on the dead disk :-)

On 11/14/2014 08:30 PM, Marc des Garets wrote:
> I am in luck, I rebooted and fsck no longer complains about the size 
> of the physical blocks that differ from the filesystem so now it's 
> running and I believe it should be successful. I expected the reboot 
> would sort this out after I saw the lvdisplay was giving the right 
> size but that fdisk -l was not. I can still mount my partition and 
> access the files so now I expect fsck to get rid of the files that 
> were on the dead disk and which are now obviously giving I/O errors.
>
> On 11/14/2014 08:16 PM, Marc des Garets wrote:
>> I got a lot back from this file system. I only lost what was on that 
>> dead disk and by chance there weren't much data on it, most is on the 
>> other 2. I already know what I lost, I was lucky and it's not very 
>> important: some GC heap dumps and some backup of phone sd card.
>>
>> I made a backup of what was important now and so I'll be trying fsck. 
>> I hope it will work because I don't feel like rebuilding my lvm and 
>> copy everything again and lose what I consider not important.
>>
>> Thanks.
>>
>> On 11/14/2014 06:12 PM, Jack Waterworth wrote:
>>> If you get anything back from this file-system I would be impressed. 
>>> Losing 200GB of a file-system isnt something small that can just be 
>>> "made up" to restore the data. The only options I can think of would 
>>> be to (1) restore from backup, (2) copy as much data as you can off 
>>> onto a new location, (3) fsck.    #1 is probably the best in your 
>>> situation, however if that's not an option you should try to save as 
>>> much data as possible (#2).
>>>
>>> a fsck should be able to repair the file-system back into a "good" 
>>> state, but you'll likely lose a lot of data. Can you show us the 
>>> full error output you're getting when you try to fsck?
>>>
>>> Also, keep in mind that this is an LVM mailing list... not a 
>>> filesystem one. Perhaps you could get some help in #ext4 on the OFTC 
>>> IRC.
>>>
>>>   Jack
>>>
>>> On 11/14/2014 03:42 AM, Marc des Garets wrote:
>>>> ext2fs_open2: The ext2 superblock is corrupt 
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
