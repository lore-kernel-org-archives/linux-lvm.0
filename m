Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pBULVKXX025970
	for <linux-lvm@redhat.com>; Fri, 30 Dec 2011 16:31:20 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pBULVJx4010321
	for <linux-lvm@redhat.com>; Fri, 30 Dec 2011 16:31:19 -0500
Date: Fri, 30 Dec 2011 16:30:16 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <CABYYHWGYuN_K5nus6XP5AAxmtb=cMx8UrY-HXw=fWA3Ec+qMSg@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1112301628300.9301@bmsred.bmsi.com>
References: <CABYYHWFYi0hzVc6Z8BYVYwhZmyFAFroMTi7aQetc72doQw08cw@mail.gmail.com>
	<8a9cc4935a6213d287ddbb04ccd4a51b.squirrel@ssl.verfeiert.org>
	<CABYYHWGYuN_K5nus6XP5AAxmtb=cMx8UrY-HXw=fWA3Ec+qMSg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to find out the location of PE's
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: peter@bieshaar.org, LVM general discussion and development <linux-lvm@redhat.com>
Cc: sven@whgl.uni-frankfurt.de

Centuries ago, Nostradamus foresaw that on Dec 30, peter.bieshaar@gmail.com...:

> thanks for this information. I will investigate the MetaData, on the second
> sector, as you mentioned. Now I also can more easily search the code (using
> the LVM2 and LABELONE strings). I tried but, it's a lot

If you have even an old backup of the /etc/lvm directory, that old metadata
could pinpoint the LV of your root filesystem (if it hasn't been resized
or moved since the backup), from you can extract the current metadata.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
