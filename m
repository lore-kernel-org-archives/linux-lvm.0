From: "David Mathews" <dmathews@sungard.com>
Message-ID: <8525676E.004E30CD.00@scs-mta1.scs.sungard.com>
Date: Tue, 11 May 1999 10:07:49 -0400
Subject: [linux-lvm] LVM recovery after machine failure
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com




My servers boot disk decided to go up in smoke this weekend.  After installing a
new disk and re-installing Linux/LVM I was able to recover all 30 GB managed by
LVM by simply issuing a vgscan and re-mounting the logical volumes.  While I did
have everything on tape, not having to spend hours restoring is wonderful!

-David
