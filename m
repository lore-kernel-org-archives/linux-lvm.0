Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2R8tpu7015161
	for <linux-lvm@redhat.com>; Thu, 27 Mar 2014 04:55:51 -0400
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2R8tnNV023577
	for <linux-lvm@redhat.com>; Thu, 27 Mar 2014 04:55:50 -0400
Received: by mail-wi0-f170.google.com with SMTP id bs8so5571906wib.1
	for <linux-lvm@redhat.com>; Thu, 27 Mar 2014 01:55:48 -0700 (PDT)
Message-ID: <5333E792.9040709@gmail.com>
Date: Thu, 27 Mar 2014 09:55:46 +0100
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <E1D69AD765F9D841B8DE87D96DD21E450150B24B@AEMAILMBX02.lenovo.com>
In-Reply-To: <E1D69AD765F9D841B8DE87D96DD21E450150B24B@AEMAILMBX02.lenovo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] resize of thin pool
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
To: LVM general discussion and development <linux-lvm@redhat.com>, mryan@lenovoemc.com

Dne 27.3.2014 06:26, Michael Ryan napsal(a):
> Hi all.  Couple quick questions.
>
> 1.It is possible to resize (grow and shrink) the size of an active thin pool?

Only extension of thin pool is supported  (offline/online).
You cannot shrink the thin pool size.

(Theoretically you could relatively easily defragment chunks offline and 
update mapping, but this is not yet supported...)


> 2.What limitations exist on a thin volume with an external origin?  I
> understand the origin volume is effectively read-only, but can the thin volume
> be written to?  How about a snapshot of the thin volume with the external origin?
>

External origin has to be activated as a read-only volume.

The same external origin can be shared by many thin volumes even from 
different pool volumes. Of course you could then snapshot such thin volume as 
any other thin volume (i.e. chaining snapshot of snapshot of snapshot).
External origin can be still used as read-only normal LV and also it may be 
used as the origin for old-style traditional snapshot at the same time.

Current limitation is - you can't merge changes from your thin volume back
to your external origin (it's planed to add this feature in the future...)
Then there are some enforced limitation of the size alignments.

Zdenek
