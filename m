Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA3HHpTN010618
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 12:17:52 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA3HHfbN024444
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 12:17:42 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id nA3HHfB4027947
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 12:17:41 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id nA3HHfwD030368
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 12:17:41 -0500
Date: Tue, 3 Nov 2009 12:17:41 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Re: error creating snapshots
In-Reply-To: <1257268672.6488.145.camel@breeves.fab.redhat.com>
Message-ID: <Pine.LNX.4.64.0911031217200.30331@bmsred.bmsi.com>
References: <Pine.LNX.4.64.0911022226110.26129@bmsred.bmsi.com>
	<20091103141626.GA15344@redhat.com>
	<Pine.LNX.4.64.0911031147050.30149@bmsred.bmsi.com>
	<1257268672.6488.145.camel@breeves.fab.redhat.com>
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

On Tue, 3 Nov 2009, Bryn M. Reeves wrote:

> > > But if you restart dmeventd (kill the process and it'll restart next
> > > time you activate the snapshot) it should work.
> > 
> > How can restarting a daemon make a library symbol suddenly become defined?
> > Isn't this a library issue?
> 
> If the daemon has been running since before the package update it will
> still use the old binary/library images. Killing and re-starting it will
> force it to use the newly updated versions.

Yep, that fixed it.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
