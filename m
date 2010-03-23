Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2N1io8u007475
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2010 21:44:51 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2N1ib3c026636
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2010 21:44:37 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o2N1ia3K008196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2010 21:44:36 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o2N1ia50021843
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2010 21:44:36 -0400
Date: Mon, 22 Mar 2010 21:44:36 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1003222041350.21370@bmsred.bmsi.com>
Message-ID: <Pine.LNX.4.64.1003222139580.21785@bmsred.bmsi.com>
References: <380B2771CDD78E46856E6B788D9F199753D65AA3@orsmsx503.amr.corp.intel.com>
	<Pine.LNX.4.64.1003222041350.21370@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can read/write snapshots be modified while the
 original is being modied
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 22 Mar 2010, Stuart D. Gathman wrote:

> On Mon, 22 Mar 2010, Hyatt, Gilbert wrote:
> 
> > We are tried to do patch testing.  
> > We want to snapshot an OS, continue to run on the original OS, while
> > installing patches and testing the snapshot.
> 
> I do that all the time.  It works fine.

A word to the wise.  Be sure and disable stuff like EDI or web service clients
that might modify other production machines.  I forgot to do that once.
Took the longest time to figure out why many of our production customs entry
responses were disappearing - as if someone had our password and was stealing
them...


Another approach I use is to restore a backup to a test VM.  This tests
the backup as well.  This is especially comforting when you use a
remote backup server to run the test VM.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
