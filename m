Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2MN1o7s011309
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2010 19:01:50 -0400
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2MN1YpX007521
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2010 19:01:34 -0400
From: "Hyatt, Gilbert" <gilbert.hyatt@intel.com>
Date: Mon, 22 Mar 2010 16:01:32 -0700
Message-ID: <380B2771CDD78E46856E6B788D9F199753D65AA3@orsmsx503.amr.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Can read/write snapshots be modified while the original
 is being modied
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

We are tried to do patch testing.  
We want to snapshot an OS, continue to run on the original OS, while installing patches and testing the snapshot.

In the FAQ it says:
Read/write snapshots work like read-only snapshots, with the additional feature that if data is written to the snapshot, that block is marked in the exception table as used, and never gets copied from the original volume.

Can I get into trouble by change the same blocks in the original and in the snapshot?  
If there is only one exception list, who wins?
If I am changing blocks in both, can I come up with and inconsistent file system in the snapshot?

-Gilbert.
