Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p46Etxnl011193
	for <linux-lvm@redhat.com>; Fri, 6 May 2011 10:55:59 -0400
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.122])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p46Etwrr010899
	for <linux-lvm@redhat.com>; Fri, 6 May 2011 10:55:58 -0400
Message-ID: <4DC40BFD.3080408@cfl.rr.com>
Date: Fri, 06 May 2011 10:55:57 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] getting pe_start right
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

While trying to convert my mdadm raid5 array from metadata format 0.9 to 
1.0, I forgot to specify the version and it defaulted to 1.2, which 
damaged the lvm metadata.  After correcting mdadm to 1.0, I decided to 
try to recreate the LVM after managing to locate the volume descriptions 
in the metadata after manually dumping it.

The problem I now have is that pvcreate will not use the same pe_start 
as before.  It was 384 and it is now 3072.  I tried using --metadatasize 
192k --dataalignmentsize 0 and it did not help.  What gives?
