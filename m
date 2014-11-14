Received: from [10.10.51.5] (vpn-51-5.rdu2.redhat.com [10.10.51.5])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAEHCAIx015481
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2014 12:12:10 -0500
Message-ID: <546637EA.1010203@redhat.com>
Date: Fri, 14 Nov 2014 12:12:10 -0500
From: Jack Waterworth <jack@redhat.com>
MIME-Version: 1.0
References: <1415908098.760.YahooMailBasic@web181504.mail.ne1.yahoo.com>	<54650ED4.7030409@ttux.net>
	<5465C07A.2080707@ttux.net>
In-Reply-To: <5465C07A.2080707@ttux.net>
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

If you get anything back from this file-system I would be impressed.  
Losing 200GB of a file-system isnt something small that can just be 
"made up" to restore the data. The only options I can think of would be 
to (1) restore from backup, (2) copy as much data as you can off onto a 
new location, (3) fsck.    #1 is probably the best in your situation, 
however if that's not an option you should try to save as much data as 
possible (#2).

a fsck should be able to repair the file-system back into a "good" 
state, but you'll likely lose a lot of data. Can you show us the full 
error output you're getting when you try to fsck?

Also, keep in mind that this is an LVM mailing list... not a filesystem 
one. Perhaps you could get some help in #ext4 on the OFTC IRC.

   Jack

On 11/14/2014 03:42 AM, Marc des Garets wrote:
> ext2fs_open2: The ext2 superblock is corrupt 
