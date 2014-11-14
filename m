Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAEJGQjK002574
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2014 14:16:27 -0500
Received: from golfcontact.eu (golfcontact.eu [62.210.207.121])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAEJGOG7000968
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2014 14:16:24 -0500
Received: from [10.0.0.145] (143.141.broadband17.iol.cz [109.80.141.143])
	by golfcontact.eu (Postfix) with ESMTPSA id 40C3A28807A3
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2014 20:16:23 +0100 (CET)
Message-ID: <54665506.3070301@ttux.net>
Date: Fri, 14 Nov 2014 20:16:22 +0100
From: Marc des Garets <marc@ttux.net>
MIME-Version: 1.0
References: <1415908098.760.YahooMailBasic@web181504.mail.ne1.yahoo.com>	<54650ED4.7030409@ttux.net>	<5465C07A.2080707@ttux.net>
	<546637EA.1010203@redhat.com>
In-Reply-To: <546637EA.1010203@redhat.com>
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

I got a lot back from this file system. I only lost what was on that 
dead disk and by chance there weren't much data on it, most is on the 
other 2. I already know what I lost, I was lucky and it's not very 
important: some GC heap dumps and some backup of phone sd card.

I made a backup of what was important now and so I'll be trying fsck. I 
hope it will work because I don't feel like rebuilding my lvm and copy 
everything again and lose what I consider not important.

Thanks.

On 11/14/2014 06:12 PM, Jack Waterworth wrote:
> If you get anything back from this file-system I would be impressed. 
> Losing 200GB of a file-system isnt something small that can just be 
> "made up" to restore the data. The only options I can think of would 
> be to (1) restore from backup, (2) copy as much data as you can off 
> onto a new location, (3) fsck.    #1 is probably the best in your 
> situation, however if that's not an option you should try to save as 
> much data as possible (#2).
>
> a fsck should be able to repair the file-system back into a "good" 
> state, but you'll likely lose a lot of data. Can you show us the full 
> error output you're getting when you try to fsck?
>
> Also, keep in mind that this is an LVM mailing list... not a 
> filesystem one. Perhaps you could get some help in #ext4 on the OFTC IRC.
>
>   Jack
>
> On 11/14/2014 03:42 AM, Marc des Garets wrote:
>> ext2fs_open2: The ext2 superblock is corrupt 
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
