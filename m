Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1O3KKem010720
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 22:20:21 -0500
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1O3KHIf004461
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 22:20:18 -0500
Received: by mail-pd0-f180.google.com with SMTP id y10so80019pdj.25
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 19:20:16 -0800 (PST)
Received: from localhost.localdomain
	(99-121-56-32.lightspeed.sntcca.sbcglobal.net. [99.121.56.32])
	by mx.google.com with ESMTPSA id ha2sm28324017pbb.8.2014.02.23.19.20.15
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 23 Feb 2014 19:20:16 -0800 (PST)
Date: Sun, 23 Feb 2014 19:20:14 -0800
From: Julie Ashworth <ashworth@berkeley.edu>
Message-ID: <20140224032014.GC13829@localhost.localdomain>
References: <20140222071408.GA10598@localhost.localdomain>
	<53087DDD.7010406@ankh.org>
	<20140222170837.GA11301@localhost.localdomain>
	<21258.42878.268778.924616@quad.stoffel.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21258.42878.268778.924616@quad.stoffel.home>
Subject: Re: [linux-lvm] LV mirror extents on same physical device
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

On 23-02-2014 20.59 -0500, John Stoffel wrote:
> 
> I think the problem is that you're confusing the Mirroring done at the
> MD level, which is /dev/md#, and then the mirroring at the LVM level,
> which is stacked on top of MD.  So there's no need to mirror at both
> levels.  But let's double check your setup, so can you please reply
> with the output of the following commands:

I'm not confused about mdadm vs. LVM mirror. I regret mentioning mdadm, since it seems to be confusing everyone. I should have only asked why the lvconvert command produced extents on the same physical device. At this point, I will just go ahead and test if
lvconvert -m0 /dev/VolGroup00/rootlv /dev/md1
will produce a functional linear volume on /dev/md2

best,
Julie
