Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3KH7CTS002247
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 13:07:16 -0400
Received: from mickey.mouse-hole.com (mickey.mouse-hole.com [87.194.144.122])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3KH5a7Y025435
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 13:06:56 -0400
From: Karl Wagner <karl@mouse-hole.com>
Message-Id: <1240247126.26812@mouse-hole.com>
Date: Mon, 20 Apr 2009 18:05:26 +0100 (BST)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bound1240247126"
Subject: [linux-lvm] Resize physical volume
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

--bound1240247126
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi all
 
I have just been through a fairly major reorganisation of my data, and need to resize the physical volumes in my LVM setup.

Currently I have sd[a-d]6, which are physical volumes for the volume group =91data=92, and sd[a-d]7, which contain nothing. My plan was to get rid of p7 on each device and extend p6 to include that space. However when I tried on sda, I got an error after of Couldn't find device with uuid=85

These are the steps I took:

* Deactivate all vg=92s 
* Fdisk /dev/sda 
* Delete p7 
* Delete p6 
* Create p6 with start at start of old p6, end at end of old p7 
* Write part table 

At this point, sda7 has gone and sda6 is the correct size (checked with blockdev =96getsz). But running a pvscan, lvm tells me it cant find sda6.

What am I missing?

 

Regards

Karl

--bound1240247126--
