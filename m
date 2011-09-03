Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p838O5re011445
	for <linux-lvm@redhat.com>; Sat, 3 Sep 2011 04:24:05 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p838Nw2E011804
	for <linux-lvm@redhat.com>; Sat, 3 Sep 2011 04:24:01 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.sc.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p838Np4D014710
	for <linux-lvm@redhat.com>; Sat, 3 Sep 2011 01:23:53 -0700
Message-ID: <4E61E417.3050006@tlinx.org>
Date: Sat, 03 Sep 2011 01:23:51 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4E5CCA32.4000000@tlinx.org>
	<alpine.LRH.2.00.1108301415340.9607@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1108301415340.9607@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Proper way to delete an active snapshot?
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
To: LVM general discussion and development <linux-lvm@redhat.com>



Stuart D. Gathman wrote:
> On Tue, 30 Aug 2011, Linda A. Walsh wrote:
>
>> If you have a snapshot of a volume running... how are you supposed to 
>> delete
>> it?
>>
>> i.e. after you unmount it... if I just do a lvremove, I get a warning 
>> about it being
>> an active volume -- so I tried doing a dmsetup remove on it first -- 
>> and that
>> stops the warning -- but I just noticed, I had a bunch of inactive 'cow'
>> volume names under 'dmsetup ls', that referred to the old snapshot 
>> names.
>>
>> so I'm guessing that using dmsetup to remove the dev first, then 
>> lvremove is
>> NOT the best way to be doing this...(as it results in stuff that 
>> needs to be cleaned
>> up...)... So how do I remove the volume w/o getting warnings about it 
>> being 'active'?
>
> I agree that the warning is broken (when LV is not otherwise mounted 
> or open).
>
> I use
>
>   /usr/sbin/lvremove  -f "$snappath"
---
    Yeah...done that... doesn't feel right
>
> in scripts, which suppresses the warning without leaving a mess.  I'm not
> sure what happens if the LV is actually open in that case.  Hopefully
> you get an error.
Well...
I wouldn't expect that ... ... seems like -f could be for overcoming a
stuck driver -- in which case it might ignore a 'mounted' signal
from the kernel...  So that's why I asked...



The odd thing -- I used lvchange -- but it wasn't a mirrored or active 
volume..

I had:
   ....
  Home-2011.08.23-18.00.56 Home+Space -wi-ao   6.49g
  Home-2011.08.25-02.13.58 Home+Space -wi-ao   4.07g  
 *Home-2011.08.31-02.23.11 Home+Space -wi-a- 888.00m 
  Home-2011.08.31-07.34.53 Home+Space -wi-a-   1.86g
---
The one I removed was the one with the * beside it...
The one from yesterday morning didn't get filled up and mounted
either...but I still have the diff (maybe I copy it off manually..
rather than trust it to another run of my shell
script from hell..(what started out as a fun project has turned
into a personal demon!)...


;-')
