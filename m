Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8EKgMr14056
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 16:42:22 -0400
Received: from rwcrmhc13.comcast.net (rwcrmhc13.comcast.net [204.127.198.39])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8EKgKUl001897
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 16:42:20 -0400
Message-ID: <414757A4.9040507@passalong.com>
Date: Tue, 14 Sep 2004 15:42:12 -0500
From: Darren Johnson <djohnson@passalong.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] EMC Question
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

This has probably been covered before, but I can't find a thread.  I 
apologize if it is indeed a duplicate.  I am running RedHat Enterprise 
Linux ES (v.3) and have several mounted emc "drives".

When I do a pvcreate, I get a "pvcreate -- invalid physical volume 
"/dev/emcpowerf1"".  Why do I get this error?  The partition type is 
0x8e and the drive is unmounted.

Thanks...

Darren
