Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j032ocr19478
	for <linux-lvm@redhat.com>; Sun, 2 Jan 2005 21:50:38 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.195])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j032oXh5014412
	for <linux-lvm@redhat.com>; Sun, 2 Jan 2005 21:50:33 -0500
Received: by rproxy.gmail.com with SMTP id 1so404578rny
	for <linux-lvm@redhat.com>; Sun, 02 Jan 2005 18:50:32 -0800 (PST)
Message-ID: <e5146c2a050102185078e20c7b@mail.gmail.com>
Date: Sun, 2 Jan 2005 21:50:32 -0500
From: Sasha Z <kleptophobiac@gmail.com>
Subject: Re: [linux-lvm] Rebuilding physical volume metadata
In-Reply-To: <20041231152235.GY26670@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <e5146c2a04123020236f018fdb@mail.gmail.com>
	<20041231152235.GY26670@agk.surrey.redhat.com>
Reply-To: Sasha Z <kleptophobiac@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

I have managed to restore the volume group, but I can't mount it as a
filesystem, I can't format the logical volume, I can't do anything
with lvextend, etc.

Here's a basic operation that fails:

[root@fileserver mapper]# lvextend -L+5G /dev/vg0/lv0
  Extending logical volume lv0 to 525.70 GB
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'vg0-lv0'.
  Problem reactivating lv0

After doing that, lvdisplay says the logical volume is suspended.
What's wrong? /dev/vg0/lv0 is a symlink to /dev/mapper/vg0-lv0
