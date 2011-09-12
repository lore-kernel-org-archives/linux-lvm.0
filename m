Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8CMFRXu031223
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 18:15:27 -0400
Received: from serenity (serenity.lbt-schoeftner.at [78.47.33.233])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8CMFLrl012680
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 18:15:22 -0400
Received: from [10.73.0.9] (helo=feynman)
	by serenity with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.74)
	(envelope-from <rmu@unfoo.net>) id 1R3Eme-0003hc-E5
	for linux-lvm@redhat.com; Tue, 13 Sep 2011 00:15:20 +0200
Received: from dyson.unfoo.rmu ([10.73.1.2]) by feynman with esmtp (Exim 4.74)
	(envelope-from <rmu@unfoo.net>) id 1R3Emb-00029g-J1
	for linux-lvm@redhat.com; Tue, 13 Sep 2011 00:15:17 +0200
Message-ID: <4E6E8476.6030609@unfoo.net>
Date: Tue, 13 Sep 2011 00:15:18 +0200
From: =?ISO-8859-1?Q?Robert_Sch=F6ftner?= <rmu@unfoo.net>
MIME-Version: 1.0
References: <4E6E6BDE.1040301@unfoo.net>
	<alpine.LRH.2.00.1109121706310.19095@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1109121706310.19095@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] harddisk dies while pvmove is in progress
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

On 2011-09-12 23:08, Stuart D. Gathman wrote:
> On Mon, 12 Sep 2011, Robert Sch?ftner wrote:
>
>> So, LV homevideo is definitely lost, but shares seems to be OK, 
>> modulo the "running"/interrupted pvmove. Is there a way to clean up 
>> this mess without creating another LV and copying the contents of 
>> shares over?
>
> Remove the missing PV as the error message suggested.  Unless you
> have some hope of resurrecting it (has had success with connecting
> deceased drive via USB and putting in freezer to run it long enough
> to recover a little more data), it is gone now.
there is no hope in resurrecting the drive. it spins up, but doesn't 
show up, neither via direct sata connection nor via sata - usb bridge. 
and i already sent it away for warranty replacement.

my interpretation of the man page is that vgreduce --removemissing 
--force would remove both LVs, even the "good" one, that's what i want 
to avoid. my idea would be something like manually breaking the mirror 
from the raid to the missing harddisk, at least for the part that 
belongs to the LV "shares".

my plan is to edit the latest archived meta-data, remove the 
pvmove-mirror, exchange the segment pointing to the missing device with 
the mirrored segment, and vcfgrestore it, if no better idea comes up. 
the saved metadata confirms that the segment belonging to LV "shares" 
was completely mirrored before the harddisk died, so all the needed data 
is there.

thx
Robert
