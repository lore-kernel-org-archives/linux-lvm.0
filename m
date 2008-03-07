Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m27FZSMP014010
	for <linux-lvm@redhat.com>; Fri, 7 Mar 2008 10:35:28 -0500
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.226])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m27FYvk4031016
	for <linux-lvm@redhat.com>; Fri, 7 Mar 2008 10:34:57 -0500
Received: by wr-out-0506.google.com with SMTP id 67so306342wri.3
	for <linux-lvm@redhat.com>; Fri, 07 Mar 2008 07:34:57 -0800 (PST)
Message-ID: <dd20e5b50803070734o3eac4e18o156fe4e1552040c@mail.gmail.com>
Date: Fri, 7 Mar 2008 10:34:56 -0500
From: "Lionel Kernux" <lionel.kernux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] How to "clone" a logical volume
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

Hi,

Here's what I'm trying to do:

I have an LV that is being used as a physical disk for a XEN virtual machine.
I want to "clone" the VM.
lvcreate -L 75G -n virtualmachine_clone_lv VG00
dd if=/path/to/virtualmachine_lv of=/path/to/virtualmachine_clone_lvT

This method would be perfect if it wasn't for the fact that now I have
2 LV's with the same uuid....not good...
Is there a way to do this (ie. copy an LV but change its uuid, or
create a duplicate of the source LV with a new uuid?)

I want to do this WITHOUT using any XEN cloning tools (buggy).

Thanks

LK
