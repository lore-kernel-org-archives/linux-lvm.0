Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j27MoWn12146
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2005 17:50:32 -0500
Received: from pastinakel.tue.nl (pastinakel.tue.nl [131.155.2.7])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j27MoVT1019501
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2005 17:50:32 -0500
Received: from iris.tue.nl (iris.tue.nl [131.155.2.34])
	by pastinakel.tue.nl (Postfix) with ESMTP id E40C814BE1D
	for <linux-lvm@redhat.com>; Mon,  7 Mar 2005 23:50:09 +0100 (CET)
Received: from [131.155.224.41] (t-26-41.athome.tue.nl [131.155.224.41])
	by iris.tue.nl (Postfix) with ESMTP id DC83710C0FC
	for <linux-lvm@redhat.com>; Mon,  7 Mar 2005 23:50:09 +0100 (CET)
Message-ID: <422CDA9F.6030500@are-b.org>
Date: Mon, 07 Mar 2005 23:50:07 +0100
From: oliver <oliver@are-b.org>
MIME-Version: 1.0
References: <FBBA14180DBE83499AC81277324251B0113181@jaxmsx01.nemours.org>
	<422CBA04.3000002@vilain.net>
In-Reply-To: <422CBA04.3000002@vilain.net>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Fixed. But what are PV# and Cur LV in pvdata?
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

After spending hours trying to figure out what values to put where, all 
the data seems to be reconstructed. I ran a reiserfsck on all partitions 
and everything was Okay.

I'm stuck however with the PV# and Cur LV reported by pvdata. I kinda 
'guessed' them. The PV# was easyer to guess I think, as PV#'s apear to 
be unique. (comparing between my two LVM setups they both where, with 
the exception of the missing PV# of course). However the Cur LV i wans't 
sure what to put there. I now used a Unique identifier for it. E.g. On 
the other two it said 1 resp. 3 so I took 2 for my missing one. The rest 
I just copied the values from the other two PV structures. The PV Size I 
did some math on, Total - 2others, converted to hex, swapped bytes and 
put in same location as the other two had them. The other 'size' looking 
element was coincidently PV Size+1, so i did that also.

Also it appears to me that in lvm2 that doesn't even matter anyhow.

Anyway, If any of you have any clue what the PV# and Cur LV are, please, 
let me know.

I hope this post will help someone out there reading some archives some 
time : )

oliver
