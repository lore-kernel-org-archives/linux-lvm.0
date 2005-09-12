Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8CLAUV25963
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2005 17:10:30 -0400
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.207])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8CLAPxR012852
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2005 17:10:26 -0400
Received: by zproxy.gmail.com with SMTP id m7so1749964nzf
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2005 14:10:20 -0700 (PDT)
Message-ID: <cd21de0e05091214103bfe89ac@mail.gmail.com>
Date: Mon, 12 Sep 2005 14:10:20 -0700
From: Jonathan Morace <jmorace@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Resizing the root LVM partition
Reply-To: jonathan@awaken.com,
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
To: linux-lvm@redhat.com

I'm having a problem adding disks to my root partition, which is using
LVM.  The quick summary is that I think I need to run resize2fs on the
root partition, but I can't figure out how to unmount the root
partition to do so.

The longer version of the story...  I'm running Fedora Core 2, and
when I installed I had the root partition configured to be on two
disks using LVM.  I added two more disks to the computer and followed
the howto to initialize the disks, add the physical volumes to the
volume group, and extend the logical volume.  When I run "lvdisplay" I
see my logical volume is the correct size, but "df" only shows the
original size.  I'm assuming this is because I haven't done a
"resize2fs".  The reason I haven't is because I can't figure out how
to unmount the root filesystem in order to do this.  If I boot with
linux rescue, I can choose not to mount the filesystems, but then the
LVM devices don't exist.  I read somewhere that running "lvm vgscan -v
--mknodes" should do the trick, but as far as I could tell, no devices
were created.

Any ideas on how I can get the root partition resized to include the new disks?

Thanks for the help,

Jonathan
