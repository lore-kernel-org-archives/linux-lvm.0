Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3668Pj14033
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 02:08:25 -0400
Received: from hotmail.com (bay16-dav33.bay16.hotmail.com [65.54.186.213])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i3668N5D022712
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 02:08:23 -0400
From: "sachin" <sachindurge@hotmail.com>
Date: Tue, 6 Apr 2004 11:44:14 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <BAY16-DAV33hotjCjWE00010d11@hotmail.com>
Subject: [linux-lvm] LV no of reads and writes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

hi
I have  tried one lvm command  I want some clarification  
lvdisplay  -v  /dev/vg/lv1
It dispalys the information along with reads and writes
What that actually means
1. Is it  no read operations ,I think is not
2 Is it no of blocks read  
3 Is it data read in terms of sector

Is it possible to get the no of io operations on the logical volume 
I am using LVM1
Thanks
Sachin.
