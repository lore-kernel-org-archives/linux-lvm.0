Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBAF0Pih014229
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 10:00:25 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBAF09mx011714
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 10:00:10 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id nBAF085f010277
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 10:00:08 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id nBAF08Ka008562
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 10:00:08 -0500
Date: Thu, 10 Dec 2009 10:00:07 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] kernel panic on lvcreate
In-Reply-To: <14440243.291260370842741.JavaMail.javamailuser@localhost>
Message-ID: <Pine.LNX.4.64.0912100949260.8205@bmsred.bmsi.com>
References: <14440243.291260370842741.JavaMail.javamailuser@localhost>
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

On Wed, 9 Dec 2009, Christopher Hawkins wrote:

> After some time I revisited this issue on a freshly installed Centos 5.4 box,
> latest kernel (2.6.18-164.6.1.el5 ) and the panic is still reproducible. Any
> time I create a snapshot of the root filesystem, kernel panics. The LVM HOWTO
> says to post bug reports to this list. Is this the proper place?

Bummer.  I would post the bug on Centos bugzilla also.  Please post the
bug number here if you do it (cause I'll get to it eventually).

Thanks for testing this.  I have the same problem, and have a new client
to install by next year - so not much time to work on it.

Now that we know it is not yet fixed, we can form theories as to what
is going wrong.  My guess is that the problem is caused by the fact that
lvm is updating files in /etc/lvm on the root filesystem while taking
the snapshot.  These updates are done by user space programs, so I would
further speculate that *any* snapshot would crash if an update happened exactly
when creating the snapshot - i.e. the atomic nature of snapshot creation has
been broken.  The lvm user space probably does fsync() on files
in /etc/lvm, which might be involved in triggering the crash.

We could test the first theory by moving /etc/lvm to another volume (I
sometimes put it on /boot - a non LVM filesystem - for easier disaster
recovery.) Naturally, I wouldn't go moving /etc/lvm on a production server.

Testing the second hypothesis is less certain, and would basically involve
trying snapshots of LVs undergoing heavy updating.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
