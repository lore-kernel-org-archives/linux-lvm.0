Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5KJIvkO025058
	for <linux-lvm@redhat.com>; Tue, 20 Jun 2006 15:18:57 -0400
Received: from smtp1.versatel.nl (smtp1.versatel.nl [62.58.50.88])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5KJIiRB011146
	for <linux-lvm@redhat.com>; Tue, 20 Jun 2006 15:18:49 -0400
From: Aad Rijnberg <Aad.Rijnberg@zonnet.nl>
Date: Tue, 20 Jun 2006 21:07:29 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606202107.29948.Aad.Rijnberg@zonnet.nl>
Subject: [linux-lvm] Mounting two logical volumes to the same mount point
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

my logical volume that contains /usr appears to be too small. I already 
removed some applications that I did not need, but it is still on the edge. 
Now that there are a lot of updates, I get the complaint of yum that there is 
not enough free space on /usr.

I just bought an additional harddisk which I also needed for other purposes, 
and would like to reserve part of this new drive for extra LVM space. I have 
just created a new volume group (VolGroup01) on the new drive, and a logical 
volume (LogVol01) inside that physical volume group. 

Can I mount both /dev/mapper/VolGroup00-LogVol01 (which contains the /usr data 
on the "old" drive) and /dev/mapper/VolGroup01-LogVol01 to the /usr mount 
point? Or can only one logical volume be mounted to a mount point?

Aad
