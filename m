Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j23MSrK02199
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 17:28:54 -0500
Received: from kweetal.tue.nl (kweetal.tue.nl [131.155.3.6])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j23MSqX7013534
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 17:28:53 -0500
Received: from iris.tue.nl (iris.tue.nl [131.155.2.34])
	by kweetal.tue.nl (Postfix) with ESMTP id 8350C13B618
	for <linux-lvm@redhat.com>; Thu,  3 Mar 2005 23:28:48 +0100 (CET)
Received: from [131.155.224.79] (t-26-79.athome.tue.nl [131.155.224.79])
	by iris.tue.nl (Postfix) with ESMTP id 7E2E310C12C
	for <linux-lvm@redhat.com>; Thu,  3 Mar 2005 23:28:48 +0100 (CET)
Message-ID: <42278F9F.4090009@are-b.org>
Date: Thu, 03 Mar 2005 23:28:47 +0100
From: oliver <oliver@are-b.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Partition table gone? Any way to restore?
References: <4225FBC8.9020904@are-b.org>
	<20050302174819.GN17589@lug-owl.de>	<4225FEBC.2060505@are-b.org>
	<20050302180537.GO17589@lug-owl.de>	<42260F1B.2030803@are-b.org>
	<1109791034l.28794l.3l@tangerine>
	<1109796276.31821.263.camel@seki.nac.uci.edu>
In-Reply-To: <1109796276.31821.263.camel@seki.nac.uci.edu>
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

Small update. Using a hex editor i was able to more closley examine my 
disk(s). Since I have 2 LVM setups I was somewhat able to compare what I 
have to what I should have. I do still need some insite however.

 From what I can tell, pvcreate only modifies the first few k's of the 
disk, followed by information stored from the vgcreate.
Then the lvcreate adds some more information after this. (vg00/lv basicly).

I hope i got it right so far : )

Now, the vgcreate information is identical on the two surviving parts 
except for a 'hostname<someserialnumber>' part around address 0x00012c.

Then at 0x0001000 we see the UUID of the VG passing by followed by some 
data (which is identical on all three vgs.

I don't think i have to look beyond this point in space/address.

Assuming that none of the tools (besides pvcreate) write anything before 
0x0001000, I should be able to pvcreate /dev/hde edit the UUID of that 
specific PV (to the same stored in the other two PV's so the three match 
up again) and have a fully workable LVM set again.

The only thing that might worry me is crc information stored somewhere 
after 0x0001000 (However it appears to me that there isn't a whole bunch 
of data stored before 0x0001000 and the data created by pvcreate is 
identical on all 3 drives with the exception of the UUID so the crc 
value should match again) and the string 'vg00'at 0x0000ac i see on all 
disks (the name of the vg.

What my question is (without spending days reading the sourcecode : ) is 
am I correct? Assuming that all the 'important' metadata and such is 
stored 'after' 0x0001000 hex, is there a good chance of it working?

I'm thinking of running a pvcreate, change the UUID of the PV to what I 
expect it to be, add 'vg00' at 0x000ac and be happy?

I could simply try, I know, but some feedback first would be appreciated 
; ) I really don't want to loose my data.

Thanks a lot.

Oliver
