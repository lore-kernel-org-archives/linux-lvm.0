Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA5JV8Dj020884
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 14:31:08 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA5JUwfE028755
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 14:30:59 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id nA5JUw89028429
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 14:30:58 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id nA5JUwZB014052
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 14:30:58 -0500
Date: Thu, 5 Nov 2009 14:30:58 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] kernel panic on lvcreate
In-Reply-To: <Pine.LNX.4.64.0911041336540.4214@bmsred.bmsi.com>
Message-ID: <Pine.LNX.4.64.0911051427530.14017@bmsred.bmsi.com>
References: <25671167.21257271245732.JavaMail.javamailuser@localhost>
	<Pine.LNX.4.64.0911041336540.4214@bmsred.bmsi.com>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 4 Nov 2009, Stuart D. Gathman wrote:

> On Tue, 3 Nov 2009, Christopher Hawkins wrote:
> 
> > Actually it looks like the reverse might be true. I tried this on a box with
> > older kernel 2.6.18-92.1.22.el5 and there is no panic. I upgraded that box to
> > kernel 2.6.18-164.2.1.el5, reboot, and now the panic is reproducible. Trying
> > to get an oops, will post again soon. 
> 
> I believe I am getting the same thing.  An lvcreate -s ... on the root
> filesystem of dom0 causes a kernel panic.  This happened at 5:30am via cron.

Anyone tested the new 164.6.1 kernel release to see if this crasher is fixed?
The changelog doesn't mention anything that sounds like it.  (Regressions
are usually fixed quickly.)

Has this been reported?  If 164.6.1 still has the problem, I can work
on a bug report.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
