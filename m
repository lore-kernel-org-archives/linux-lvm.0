Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7UIIpO0027781
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 14:18:51 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7UIIkb1000593
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 14:18:47 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p7UIISDv027086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 14:18:28 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p7UIISUQ009980
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 14:18:28 -0400
Date: Tue, 30 Aug 2011 14:18:28 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4E5CCA32.4000000@tlinx.org>
Message-ID: <alpine.LRH.2.00.1108301415340.9607@bmsred.bmsi.com>
References: <4E5CCA32.4000000@tlinx.org>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 30 Aug 2011, Linda A. Walsh wrote:

> If you have a snapshot of a volume running... how are you supposed to delete
> it?
>
> i.e. after you unmount it... if I just do a lvremove, I get a warning about 
> it being
> an active volume -- so I tried doing a dmsetup remove on it first -- and that
> stops the warning -- but I just noticed, I had a bunch of inactive 'cow'
> volume names under 'dmsetup ls', that referred to the old snapshot names.
>
> so I'm guessing that using dmsetup to remove the dev first, then lvremove is
> NOT the best way to be doing this...(as it results in stuff that needs to be 
> cleaned
> up...)... 
> So how do I remove the volume w/o getting warnings about it being 'active'?

I agree that the warning is broken (when LV is not otherwise mounted or open).

I use

   /usr/sbin/lvremove  -f "$snappath"

in scripts, which suppresses the warning without leaving a mess.  I'm not
sure what happens if the LV is actually open in that case.  Hopefully
you get an error.

I am on Centos-5.6

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
