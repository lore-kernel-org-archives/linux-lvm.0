Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAG2t2Ru020842
	for <linux-lvm@redhat.com>; Wed, 15 Nov 2006 21:55:02 -0500
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.191])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAG2sYl3009837
	for <linux-lvm@redhat.com>; Wed, 15 Nov 2006 21:54:54 -0500
Received: by nf-out-0910.google.com with SMTP id l36so868006nfa
	for <linux-lvm@redhat.com>; Wed, 15 Nov 2006 18:54:54 -0800 (PST)
Message-ID: <170fa0d20611151854m4bc49ed6qc696e82f83417e7@mail.gmail.com>
Date: Wed, 15 Nov 2006 21:54:54 -0500
From: "Mike Snitzer" <snitzer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] walltime of pvs vs pvdisplay with 256 PVs
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I have a testbed with 256 PVs.  Running 'pvdisplay -c' takes .672 sec.
 Running 'pvs' takes 43sec!  I've tried this on RHEL4U3
(lvm2-2.02.01-1.3.RHEL4) and RHEL4U4 (lvm2-2.02.06-6.0.RHEL4).  lvm2
from U4 is actually slower than U3 on this issue (1m vs 43s).

With RHEL4U3, pvs -vvvvv shows that a single device gets opened 264
times yet pvdisplay -c -vvvvv only opens a single device 8 times.
With RHEL4U4, there are 261 opens for pvs and 5 opens for pvdisplay
-c.  Clearly there is something flawed in the pvs algorithm.  I can
dig deeper but I wanted to put this info out there in case others
might have some insight.

please advise, thanks.
Mike
