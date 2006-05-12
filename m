Received: from [192.168.1.2] (vpn-68-1.surrey.redhat.com [10.32.68.1])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4CCGXfA013547
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 13:16:33 +0100
Message-ID: <44647CA0.3010509@redhat.com>
Date: Fri, 12 May 2006 13:16:32 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] problem when creating a volumegroup on an external
	drive
References: <44647168.3030205@neuroweave.nl>
In-Reply-To: <44647168.3030205@neuroweave.nl>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Joep Blom wrote:
> Hi,
> I'm new to the list and new to the use of LVM. I have read the manuals
> (which mainly are for LVM1) and am using LVM2.
> I have one question. I just created a new volumegroup on an USB external
> disk.
> As the manual says I did : pvcreate /dev/sda but that did't work but
> pvcreate /dev/sda1 worked.
> I then did a vgcreate VG01, expecting to get one volume group for the
> whole disk (250 GB). However, it created 2 volumegroups, one named
> VolGroup00  of 46.6 GB and one VG01 (as expected) of 232.8 GB. The
> problem is I have on another 2 disks already a VolGroup00 so I cannot do
> an lvcreate VolGroup00 as this will try to access the earlier created one.
> Can anybody explain why an unrequested volumegroup is created and how
> can I solve this.
> I cannot do a vgdelete VolGroup00 as this will destroy my current -
> working - system.
> Hope somebody knows the answers.


It's fantastically unlikely that a single 'vgcreate VG0' command would create
two VGs.

What is much more likely is that VolGroup00 already existed and you just
didn't notice it. That's the default name for a volume group created by a
Fedora install BTW

patrick
