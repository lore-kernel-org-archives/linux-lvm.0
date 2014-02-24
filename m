Received: from mx2.redhat.com (ext-mx01.extmail.prod.ext.rdu2.redhat.com
	[10.11.55.1])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1OLpdCV003879
	for <linux-lvm@redhat.com>; Mon, 24 Feb 2014 16:51:39 -0500
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mx2.redhat.com (8.14.4/8.14.4) with ESMTP id s1OLpZ3t022572
	for <linux-lvm@redhat.com>; Mon, 24 Feb 2014 16:51:37 -0500
Received: by mail-pa0-f49.google.com with SMTP id hz1so7124298pad.36
	for <linux-lvm@redhat.com>; Mon, 24 Feb 2014 13:51:34 -0800 (PST)
Received: from ssh2.neuro.berkeley.edu (ssh2.Neuro.Berkeley.EDU.
	[169.229.248.250]) by mx.google.com with ESMTPSA id
	sx8sm127959386pab.5.2014.02.24.13.51.33 for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 24 Feb 2014 13:51:34 -0800 (PST)
Date: Mon, 24 Feb 2014 13:51:25 -0800
From: Julie Ashworth <ashworth@berkeley.edu>
Message-ID: <20140224215125.GA31189@ssh2.neuro.berkeley.edu>
References: <20140222071408.GA10598@localhost.localdomain>
	<CAE7pJ3ASKEJ0ExqVn7w9pDhv-SRC7HX-60CFJcswROVOmdWBNA@mail.gmail.com>
	<20140224185629.GA28182@ssh2.neuro.berkeley.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140224185629.GA28182@ssh2.neuro.berkeley.edu>
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

I doubt anybody else will have this problem, but just in case...
my solution was to upgrade lvm2, convert my mirrors to linear arrays, and recreate the mirrors. After the lvm2 upgrade, I didn't see allocation errors when creating the mirrored log.

lvconvert -m0 /dev/VolGroup00/lvname
lvconvert -m1 --mirrorlog=mirrored /dev/VolGroup00/lvname

best,
Julie
