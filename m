Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9IIksr28413
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2004 14:46:54 -0400
Received: from mproxy.gmail.com (rproxy.gmail.com [64.233.170.195])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9IIkmwv002856
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2004 14:46:48 -0400
Received: by mproxy.gmail.com with SMTP id 73so231865rnk
	for <linux-lvm@redhat.com>; Mon, 18 Oct 2004 11:46:43 -0700 (PDT)
Message-ID: <9cb08bfa04101811461b27ca0b@mail.gmail.com>
Date: Mon, 18 Oct 2004 14:46:43 -0400
From: Pratik Solanki <pratik.solanki.ml@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Unable to boot system
Reply-To: Pratik Solanki <pratik.solanki.ml@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hello,

I am a newbie to LVM and recently installed Fedora Core 2 with LVM. I
have 2 hard disks, only one of them is used in a volume group. I have
4 logical volumes in the group, /, /usr, /home and swap. Everything
was wonrkinbg fine until I decided to upgrade my system through yum. I
used the development releases since I wanted gnome 2.8. I did not
update everything; instead I just updated selective gnome packages.
After rebooting my system refuses to come up. It says something like

Uncompressing Linux ....
...
Reading all physical volumes. This can take a while ...
Found Volume Group "Vol0". metadata lvm2
4 logical Volumes in volume group "Vol0" now active
Restarting System

I can use the fedora rescue disk and mount all the volumes without any
problem. I did notice that when I was restarting, my systems showed
errors when disabling swap (swapoff), but it went by too fast for me
to write down the exact error. Something about /dev/mapper/LV03 not
found.

Any ideas on what is causing this and how I can fix it.

Thanks,
Pratik.
