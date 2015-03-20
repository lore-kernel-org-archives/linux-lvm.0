Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2KGXerH031582
	for <linux-lvm@redhat.com>; Fri, 20 Mar 2015 12:33:40 -0400
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2KGXclo029501
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 20 Mar 2015 12:33:39 -0400
Received: by ieclw3 with SMTP id lw3so96569298iec.2
	for <linux-lvm@redhat.com>; Fri, 20 Mar 2015 09:33:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <54F9D5F9.1030609@gmail.com>
References: <54F9D5F9.1030609@gmail.com>
Date: Fri, 20 Mar 2015 17:33:38 +0100
Message-ID: <CAE8gLhmjdbbJ=CuPD4-t7fJvyYiO4ciw0DPVU7dQ6jC_thsK7g@mail.gmail.com>
From: MegaBrutal <megabrutal@gmail.com>
Subject: Re: [linux-lvm] Question (and feature suggestions) regarding
 lvmcache and lvmthin
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Austin S Hemmelgarn <ahferroin7@gmail.com>

I agree with you that these features would be nice. Actually, I also
wanted to ask for some of them. Unfortunately, I don't know about a
way to flush lvmcache without detaching and recreating the cache LV.

As a workaround you could create writethrough caches, albeit their
write performance is slower. But in that case, you'd never need to
flush the cache, as you could be sure that the origin LVs are always
up-to-date.


2015-03-06 17:29 GMT+01:00 Austin S Hemmelgarn <ahferroin7@gmail.com>:
> I've got a couple of cached LV's on my system where the origin is a
> RAID{1,10,5} LV, and have noticed that there doesn't appear to be any way
> (at least that I can find) of resyncing/scrubbing the origin LV without
> detaching it from the cache pool, which is significantly inconvenient as I
> scrub the origin LV's weekly.  I was wondering if there was any advice on
> how to do this without needing to detach it from the pool
>
> On a somewhat related note, It would be a nice feature for both cached LV's
> and thinpool LV's to be able to just run 'lvchange --syncaction check' on
> the pool/cached LV and have it scrub each of the constituent LV's if
> applicable (ie, if you have a thinpool LV where the data and metadata LV's
> are RAID{1,10,5,6}, then running 'lvchange --syncaction check' on the
> thinpool would trigger a read-only resync for the data and metadata LV's).
>
> Please cc me on replies, as I'm not subscribed to the list.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
