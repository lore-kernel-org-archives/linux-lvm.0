Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4GMdftr027704
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 18:39:41 -0400
Received: from wx-out-0102.google.com (wx-out-0102.google.com [66.249.82.202])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4GMdfL6021869
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 18:39:41 -0400
Received: by wx-out-0102.google.com with SMTP id s11so73654wxc
	for <linux-lvm@redhat.com>; Tue, 16 May 2006 15:39:41 -0700 (PDT)
From: "Ricardo Sanchez" <sanchez.ricardo@gmail.com>
Date: Tue, 16 May 2006 18:39:36 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <446a54ac.3c6d51c7.245b.ffffa9b0@mx.gmail.com>
Subject: [linux-lvm] Problem doing basic LVM functions
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I created a basic volume group named "uservg" and added two PVs to it
successfully.

After doing this, I deleted the partitions to the disks...
Every time I try to do a vgscan or vgremove it gives the following output:

nbd0: Attempted send on closed socket
end_request: I/O Error, dev nbd0, sector 0
printk: 7 messages suppressed.
Buffer  I/O Error on device nbd0, logical block 0
Buffer  I/O Error on device nbd0, logical block 1
Buffer  I/O Error on device nbd0, logical block 2
nbd0: Attempted send on closed socket
/dev/nb0: read failed after 0 of 4096 at 0: Input/output error
 /dev/nb0: read failed after 0 of 4096 at 2199022141440: Input/output error
  /dev/nb0: read failed after 0 of 4096 at 0: Input/output error
  /dev/nb1: read failed after 0 of 4096 at 2199022141440: Input/output error
  /dev/nb1: read failed after 0 of 4096 at 0: Input/output error
  /dev/nb2: read failed after 0 of 4096 at 2199022141440: Input/output error
  /dev/nb2: read failed after 0 of 4096 at 0: Input/output error
  /dev/nb3: read failed after 0 of 4096 at 2199022141440: Input/output error
  /dev/nb3: read failed after 0 of 4096 at 0: Input/output error
  /dev/nb4: read failed after 0 of 4096 at 2199022141440: Input/output error
  /dev/nb4: read failed after 0 of 4096 at 0: Input/output error
  /dev/nb5: read failed after 0 of 4096 at 2199022141440: Input/output error
  /dev/nb5: read failed after 0 of 4096 at 0: Input/output error
  /dev/nb6: read failed after 0 of 4096 at 2199022141440: Input/output error
  /dev/nb6: read failed after 0 of 4096 at 0: Input/output error
  /dev/nb7: read failed after 0 of 4096 at 2199022141440: Input/output error
  /dev/nb7: read failed after 0 of 4096 at 0: Input/output error
  /dev/nb8: read failed after 0 of 4096 at 2199022141440: Input/output error
  /dev/nb8: read failed after 0 of 4096 at 0: Input/output error
  /dev/nb9: read failed after 0 of 4096 at 2199022141440: Input/output error
  /dev/nb9: read failed after 0 of 4096 at 0: Input/output error
  /dev/nb10: read failed after 0 of 4096 at 2199022141440: Input/output
error
  /dev/nb10: read failed after 0 of 4096 at 0: Input/output error
  /dev/nb11: read failed after 0 of 4096 at 2199022141440: Input/output
error
  /dev/nb11: read failed after 0 of 4096 at 0: Input/output error
  /dev/nb12: read failed after 0 of 4096 at 2199022141440: Input/output
error
  /dev/nb12: read failed after 0 of 4096 at 0: Input/output error
  /dev/nb13: read failed after 0 of 4096 at 2199022141440: Input/output
error
  /dev/nb13: read failed after 0 of 4096 at 0: Input/output error
  /dev/nb14: read failed after 0 of 4096 at 2199022141440: Input/output
error
  /dev/nb14: read failed after 0 of 4096 at 0: Input/output error
  /dev/nb15: read failed after 0 of 4096 at 2199022141440: Input/output
error
  /dev/nb15: read failed after 0 of 4096 at 0: Input/output error


And it just hangs there. Can anyone help?

Thanks

Ricardo
