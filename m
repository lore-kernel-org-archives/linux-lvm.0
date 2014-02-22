Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1MH8fxU024042
	for <linux-lvm@redhat.com>; Sat, 22 Feb 2014 12:08:41 -0500
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1MH8e3J001546
	for <linux-lvm@redhat.com>; Sat, 22 Feb 2014 12:08:40 -0500
Received: by mail-pb0-f46.google.com with SMTP id um1so4732201pbc.5
	for <linux-lvm@redhat.com>; Sat, 22 Feb 2014 09:08:40 -0800 (PST)
Received: from localhost.localdomain
	(99-121-56-32.lightspeed.sntcca.sbcglobal.net. [99.121.56.32])
	by mx.google.com with ESMTPSA id e3sm32972634pbc.17.2014.02.22.09.08.38
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 22 Feb 2014 09:08:39 -0800 (PST)
Date: Sat, 22 Feb 2014 09:08:37 -0800
From: Julie Ashworth <ashworth@berkeley.edu>
Message-ID: <20140222170837.GA11301@localhost.localdomain>
References: <20140222071408.GA10598@localhost.localdomain>
	<53087DDD.7010406@ankh.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53087DDD.7010406@ankh.org>
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

On 22-02-2014 10.37 +0000, James Hawtin wrote:
> #pvcreate /dev/md2
> #vgextend VolGroup00 /dev/md2
> # Stop the old pv getting lvs created on it
> pvchange -x n /dev/md1
> # Whole thing in one go
> pvmove -v /dev/md1 /dev/md2
> # One at a time
> pvmove -v -n rootlv /dev/md1 /dev/md2
> vgreduce VolGroup00 /dev/md2
> 
---end quoted text---

My LVs are already mirrored (w/ two extents on /dev/md1), so is pvmove really the right tool to move one of those extents?
best,
Julie 
