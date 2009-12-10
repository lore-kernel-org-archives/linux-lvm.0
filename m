Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBAF8WYa017692
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 10:08:32 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBAF8GmD013285
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 10:08:17 -0500
Date: Thu, 10 Dec 2009 10:08:15 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] kernel panic on lvcreate
In-Reply-To: <4B200615.1010702@redhat.com>
Message-ID: <Pine.LNX.4.64.0912101007100.8205@bmsred.bmsi.com>
References: <14440243.291260370842741.JavaMail.javamailuser@localhost>
	<4B200615.1010702@redhat.com>
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
Cc: Christopher Hawkins <chawkins@bplinux.com>

On Wed, 9 Dec 2009, Milan Broz wrote:

> > and the panic is still reproducible. Any time I create a snapshot of the root filesystem, kernel panics.
> 
> I guess it is already reported here https://bugzilla.redhat.com/show_bug.cgi?id=539328
> so please watch this bugzilla.

Ah, they are getting it while Oracle is updating.  That supports the updates
during supposedly atomic snapshot theory.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
