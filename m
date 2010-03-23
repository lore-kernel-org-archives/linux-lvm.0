Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2N0ltaM027742
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2010 20:47:55 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2N0lhaO023068
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2010 20:47:43 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o2N0lgYW006335
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2010 20:47:43 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o2N0lgDm021570
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2010 20:47:42 -0400
Date: Mon, 22 Mar 2010 20:47:42 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <380B2771CDD78E46856E6B788D9F199753D65AA3@orsmsx503.amr.corp.intel.com>
Message-ID: <Pine.LNX.4.64.1003222041350.21370@bmsred.bmsi.com>
References: <380B2771CDD78E46856E6B788D9F199753D65AA3@orsmsx503.amr.corp.intel.com>
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

On Mon, 22 Mar 2010, Hyatt, Gilbert wrote:

> We are tried to do patch testing.  
> We want to snapshot an OS, continue to run on the original OS, while
> installing patches and testing the snapshot.

I do that all the time.  It works fine.

> In the FAQ it says:
> Read/write snapshots work like read-only snapshots, with the additional
> feature that if data is written to the snapshot, that block is marked in the
> exception table as used, and never gets copied from the original volume.

Correct.

> Can I get into trouble by change the same blocks in the original and in the
> snapshot?  If there is only one exception list, who wins?

The exception list is only used by the snapshot.  When reading the
snapshot volume, blocks come from the origin - except where noted in
the exception list.  When writing to the origin, a new exception
entry is added if there isn't one already and the block copied to the
snapshot.  When writing to the snapshot, a new exception entry is added
if there isn't one already, but the block is *not* copied from the origin.

> If I am changing blocks in both, can I come up with and inconsistent file
> system in the snapshot?

No.  Unless you are talking about race conditions, and then the answer
is still "no - unless there is a bug".

One thing you want to avoid (until shared snapshots are mainstream) is
multiple snapshots for the same origin.  This works, but is slow.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
