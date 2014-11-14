Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAE8gmkY009191
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2014 03:42:48 -0500
Received: from golfcontact.eu (golfcontact.eu [62.210.207.121])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAE8gjUT009963
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2014 03:42:46 -0500
Received: from [10.0.0.145] (143.141.broadband17.iol.cz [109.80.141.143])
	by golfcontact.eu (Postfix) with ESMTPSA id 452812880720
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2014 09:42:35 +0100 (CET)
Message-ID: <5465C07A.2080707@ttux.net>
Date: Fri, 14 Nov 2014 09:42:34 +0100
From: Marc des Garets <marc@ttux.net>
MIME-Version: 1.0
References: <1415908098.760.YahooMailBasic@web181504.mail.ne1.yahoo.com>
	<54650ED4.7030409@ttux.net>
In-Reply-To: <54650ED4.7030409@ttux.net>
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

I am even able to mount the volume actually now and get to the data but 
I can't do a fsck on the disk because of the difference of block between 
physical size and filesystem size. I really don't feel like copying all 
my data to recreate the lvm from scratch...

I tried what was suggested here: 
http://sourceforge.net/p/e2fsprogs/discussion/7053/thread/c9e05785/

debugfs -w /dev/sda1
debugfs: set_super_value blocks_count 597721088
debugfs: quit

Where I had to compile e2fsprogs as explained in the thread but it 
didn't work out anyway. All I gained from doing this is another warning 
when running fsck:
ext2fs_open2: The ext2 superblock is corrupt
fsck.ext4: Superblock invalid, trying backup blocks...

Guess it's happy with the backup blocks but it still complains about 
difference in block size.

On 11/13/2014 09:04 PM, Marc des Garets wrote:
> Yes, it's human readable. It's the one I sent in my previous email.
>
> lvdisplay gives the following:
>   --- Logical volume ---
>   LV Path                /dev/VolGroup00/lvolmedia
>   LV Name                lvolmedia
>   VG Name                VolGroup00
>   LV UUID                aidfLk-hjlx-Znrp-I0Pb-JtfS-9Fcy-OqQ3EW
>   LV Write Access        read/write
>   LV Creation host, time archiso, 2014-06-09 10:32:20 +0200
>   LV Status              suspended
>   # open                 0
>   LV Size                2.52 TiB
>   Current LE             660023
>   Segments               3
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           254:0
>
>
> On 11/13/2014 08:48 PM, matthew patton wrote:
>>> https://www.novell.com/coolsolutions/appnote/19386.html#DiskPermanentlyRemoved 
>>>
>>     >  pvdisplay shows the 3 disks exactly like before I had the one 
>> that
>>
>>> The filesystem size (according to the superblock) is 675863552 blocks
>>> The physical size of the device is 597721088 blocks
>> what about LVdisplay? Clearly the replacement chunk from the new 
>> device isn't the correct size. It's short by 39071232KB or roughly 37GB.
>>
>> Is the VG configuration restore file human readable?
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
