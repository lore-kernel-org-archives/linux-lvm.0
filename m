Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j06N67r27367
	for <linux-lvm@redhat.com>; Thu, 6 Jan 2005 18:06:07 -0500
Received: from anubis.medic.chalmers.se (anubis.medic.chalmers.se
	[129.16.30.218])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j06N6181020770
	for <linux-lvm@redhat.com>; Thu, 6 Jan 2005 18:06:07 -0500
Received: from [193.11.254.225] (myrium.csbnet.se [193.11.254.225])
	by anubis.medic.chalmers.se (Postfix) with ESMTP id EEB9948F8
	for <linux-lvm@redhat.com>; Fri,  7 Jan 2005 00:05:59 +0100 (CET)
Message-ID: <41DDC3DF.80009@danielroth.se>
Date: Fri, 07 Jan 2005 00:03:59 +0100
From: Daniel Roth <daniel@danielroth.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: Can't mount after crash
References: <41BB808E.60108@danielroth.se>
	<20041221204852.GR26670@agk.surrey.redhat.com>
In-Reply-To: <20041221204852.GR26670@agk.surrey.redhat.com>
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

Alasdair G Kergon wrote:

>On Sun, Dec 12, 2004 at 12:19:42AM +0100, Daniel Roth wrote:
>  
>
>>My lvm-system crashed a day ago and I was really lost in how to do. 
>>    
>>
>
>You don't say how you actually first discovered something had gone wrong,
>or give any clues about what might have led up to the problem causing it.
>
>Your message doesn't show any LVM problems.
>
>Did something scribble over your disks?
>Have you tried mounting with alternative superblocks?
>  
>
Ok. I did an upgrade of my Debian system.apt-get update && apt-get 
upgrade *. lvm version got
updated as well. Afterwards I did a reboot to put in some extra hw 
(memory). After reboot I couldn't
mount my volume at all. No VG was found et.c. I tried to vgcfgrestore 
without any halp whatsoever
It only said that the pv could not be found or equiv so I restored them 
with the pvcreate line below,
which worked fine on the volumes and a vg and lvm was set up 
appropriately. Still unmountable,
Still unable to fsck.ext2 it with some diffrent superblocks.

I'd be happy to give any specific information you might need to find out 
any way to restore, since
I have run completely out of ideas. If the file system only is "wrapped" 
into the lvm I'd like to
find a tool which can scan disks and recognize superblocks, since I only 
have tried the 3-4 first
I could count up to.

>>I found the metadatafile and could with
>>pvcreate --uuid ... --restorefile ... .... /hdg5,
>>    
>>
>
>You should only use those if you've lost a disk or accidentally overwritten
>the start of one and vgcfgrestore isn't working.
>
>Alasdair
>  
>

"or accidentally overwritten the start of one" is maybe just what has happened.


Daniel
