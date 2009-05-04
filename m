Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n44LGbup010314
	for <linux-lvm@redhat.com>; Mon, 4 May 2009 17:16:37 -0400
Received: from pluto.sivell.com (z-t3.aifi.com [65.112.245.198])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n44L3s94003824
	for <linux-lvm@redhat.com>; Mon, 4 May 2009 17:04:11 -0400
Received: from ef.sivell.com (ef [192.168.249.210]) (authenticated bits=0)
	by pluto.sivell.com (8.13.1/8.13.1) with ESMTP id n44L4N5b008559
	for <linux-lvm@redhat.com>; Mon, 4 May 2009 16:04:23 -0500
Message-ID: <49FF5822.4010500@sivell.com>
Date: Mon, 04 May 2009 16:03:30 -0500
From: vu pham <vu@sivell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] striped LVs at installtion time
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I am sorry if this question was asked already. Can we specify striped 
LVs  in kickstart file , or from interactive installation ?

Currently I have to manually create the striped LVs for root/var/swap 
... after installation, then copy files over those LVs, relabel the 
selinux, then change /etc/fstab and /boot/grub/grub.conf. A lot of 
tedious works.

Thanks for your advice,

Vu
