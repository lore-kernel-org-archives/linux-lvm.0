Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1O3CsXh001406
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 22:12:54 -0500
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1O3Crsc030509
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 22:12:53 -0500
Received: by mail-pb0-f41.google.com with SMTP id jt11so572417pbb.0
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 19:12:53 -0800 (PST)
Received: from localhost.localdomain
	(99-121-56-32.lightspeed.sntcca.sbcglobal.net. [99.121.56.32])
	by mx.google.com with ESMTPSA id q7sm44817512pbc.20.2014.02.23.19.12.50
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 23 Feb 2014 19:12:51 -0800 (PST)
Date: Sun, 23 Feb 2014 19:12:48 -0800
From: Julie Ashworth <ashworth@berkeley.edu>
Message-ID: <20140224031248.GA13829@localhost.localdomain>
References: <20140222071408.GA10598@localhost.localdomain>
	<CAAMCDed94+WJa5Ms9CG+gtxKmfzuWw39yHLD1uj2xXGa89J3ag@mail.gmail.com>
	<CAAMCDeekhfvcU+1KEsfTkDTZvRgPB=Y9w7sae=CGA=Svi-cKrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAMCDeekhfvcU+1KEsfTkDTZvRgPB=Y9w7sae=CGA=Svi-cKrQ@mail.gmail.com>
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

On 23-02-2014 21.03 -0600, Roger Heflin wrote:
> without the anywhere option it indicates you need *4* devices, 2 for
> data, and 2 for mirror log, using anywhere removes the more than 1
> device for everything,.

The -alloc=aywhere simply refers to the log. I'm not concerned about the log, I'm concered about the actual image extents, which seem to be both on /dev/md1.
 
> Using this format should allow you to force the move of a copy from
> one device to another, see the pvmove man page for more details.
> 
> pvmove /dev/sdb1:1000-1999 /dev/sdc1:0-999

The end goal is to convert the mirror to a linear volume (on /dev/md2). 
I'm still not convinced that pvmove is the right utility for mirrored extents. But thanks for the advice - I will try it if lvconvert -m0 fails. (this is a test server).

best,
Julie
