Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1O3DeaV023750
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 22:13:40 -0500
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1O3DdZ7026034
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 22:13:39 -0500
Received: by mail-pb0-f49.google.com with SMTP id jt11so566819pbb.22
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 19:13:39 -0800 (PST)
Received: from localhost.localdomain
	(99-121-56-32.lightspeed.sntcca.sbcglobal.net. [99.121.56.32])
	by mx.google.com with ESMTPSA id cz3sm44853655pbc.9.2014.02.23.19.13.38
	for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 23 Feb 2014 19:13:38 -0800 (PST)
Date: Sun, 23 Feb 2014 19:13:36 -0800
From: Julie Ashworth <ashworth@berkeley.edu>
Message-ID: <20140224031336.GB13829@localhost.localdomain>
References: <20140222071408.GA10598@localhost.localdomain>
	<CAAMCDed94+WJa5Ms9CG+gtxKmfzuWw39yHLD1uj2xXGa89J3ag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAMCDed94+WJa5Ms9CG+gtxKmfzuWw39yHLD1uj2xXGa89J3ag@mail.gmail.com>
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


On 23-02-2014 20.16 -0600, Roger Heflin wrote:
> If I am reading what I can find correctly - -alloc=anywhere defeats
> the mirror code from attempting to put on 2 different physical
> devices.
---end quoted text---

-alloc=anywhere just refers to the logs, which isn't important at this point.
best,
Julie
