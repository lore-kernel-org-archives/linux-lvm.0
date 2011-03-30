Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2U0RKPm010312
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 20:27:20 -0400
Received: from smtp.bredband2.com (smtp.bredband2.com [83.219.192.166])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2U0RFYj027042
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 20:27:15 -0400
Received: from caramon (c-83-219-217-17.cust.bredband2.com [83.219.217.17])
	(Authenticated sender: ba9826)
	by smtp.bredband2.com (Postfix) with ESMTPA id 93710E9647
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2011 02:27:14 +0200 (CEST)
Message-ID: <5A7D1164A7AD4CA292C1E5176D286D23@caramon>
From: "Fredrik Skog" <fredrik.skog@rodang.se>
References: <DE6049702F6A4634890B18D047C27E03@caramon><20110329124434.3cf62c3e@bettercgi.com><CE3415B4EB40445F8F294A52BC905070@caramon>
	<alpine.LRH.2.00.1103291804330.23827@bmsred.bmsi.com>
Date: Wed, 30 Mar 2011 02:27:49 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to fix missmatch between VG-size and LV-size?
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: LVM general discussion and development <linux-lvm@redhat.com>


----- Original Message ----- 
From: "Stuart D. Gathman" <stuart@bmsi.com>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Wednesday, March 30, 2011 12:14 AM
Subject: Re: [linux-lvm] How to fix missmatch between VG-size and LV-size?

>SNIP>

>> I can run LVM commands fine now after the reboot and the output from 
>> pvdisplay and lvdisplay is like i posted earlier.
>> How can i revert this in a safe way? I was thinking of just removing the 
>> PV and do a vgcfgrestore to "before" the lvextend.
>> But since lvdisplay says the volume is 4.16TiB and pvdisplay says 5.59TiB 
>> something is wrong? Or am I missing something?

>SNIP>

>> Is it better to do a e2fsck now?

> That is probably the only way to salvage what is left of your filesystem,
> but don't do it until we find out whether the LV is the old or the new 
> size.
> I suspect the LV will be the new size, but the filesystem may still show
> the old size.  Since the resize2fs should be just adding free space, there 
> may not be any data loss.  e2fsck would fix the (now corrupt)
> free space, and you can extend again.

I just added all the segments of the LV from an old backed up config file. 
It adds up to 3,856TB, so I guess  you were right and i assumed wrong. The 
old LV was about 3,8TB and the new is about 4,16TB or about 400GB bigger 
than before as expected by lvextend -L+400G.

Also it tells me I have 1,43TiB free wich is 5,59TiB - 4,16TiB. It also 
looks right.

maybe I should try an e2fsck now?

again, thanks for your time

/Fredrik Skog

>
> --
>        Stuart D. Gathman <stuart@bmsi.com>
>     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 
> 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ 
