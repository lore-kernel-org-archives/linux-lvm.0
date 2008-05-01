Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m41KvtZ9003878
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 16:57:55 -0400
Received: from vms040pub.verizon.net (vms040pub.verizon.net [206.46.252.40])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m41KvgeI014207
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 16:57:42 -0400
Received: from [192.168.2.102] ([72.91.189.24])
	by vms040.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K0700KUPJQT0UQ2@vms040.mailsrvcs.net> for
	linux-lvm@redhat.com; Thu, 01 May 2008 16:01:42 -0500 (CDT)
Date: Thu, 01 May 2008 16:57:23 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <481A2BB4.7080504@Media-Brokers.com>
Message-id: <481A2EB3.40703@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4818F2FC.5050907@verizon.net>	<20080501154800.GA5941@us.ibm.com>
	<Pine.LNX.4.64.0805011223590.32190@engineering.redhat.com>
	<481A08A7.5010305@verizon.net>	<481A0E28.5030108@Media-Brokers.com>
	<481A1C09.7070508@verizon.net>	<481A1D32.6020705@Media-Brokers.com>
	<481A1FAF.5050303@verizon.net>	<481A221D.80209@Media-Brokers.com>
	<481A262C.7080908@verizon.net>	<20080501202534.GU18935@agk.fab.redhat.com>
	<481A286E.80309@verizon.net>	<481A2947.9070907@Media-Brokers.com>
	<481A29DD.6040108@verizon.net> <481A2BB4.7080504@Media-Brokers.com>
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

Charles Marcus wrote:
> On 5/1/2008 4:36 PM, Gerry Reno wrote:
>>  Without knowing the exact cause of the hang there is no way to know 
>> if the ramdisk was at issue.  I doubt it myself, I ran a whole series 
>> of backups last night using the ramdisk snapshot and everything went 
>> fine.
>
> Actually, I'm not talking about the hang as much as I am the problem 
> you had recovering from it...
>
> My questions is, had the snapshot volume been on a regular hard drive, 
> would you have had the same problems recovering from the situation.
>
I don't think anyone could possibly say. 

There was corruption involved and that could have occurred for lots of 
reasons.  My thought is that even if the ramdisk were not present on the 
next boot there should be no reason for that to cause corruption.  There 
were no lvm mods made to the rw snapshot which means in essence it was 
read-only.  The VG did not mount and nothing wrote to any filesystem on 
the VG which means the corruption is probably totally unrelated or is a 
bug.  LVM should be robust enough to fully recover from this without any 
corruption.  It just should have discarded the old snapshot.  The 
original volume should not be affected.  But as I said, I suspect there 
may be a bug.  Probably some scenario is not being handled in the code.


Gerry
