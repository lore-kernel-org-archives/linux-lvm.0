Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8C9mRYj030162
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 05:48:28 -0400
Received: from yw-out-2324.google.com (yw-out-2324.google.com [74.125.46.28])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8C9mFZS000641
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 05:48:15 -0400
Received: by yw-out-2324.google.com with SMTP id 5so268848ywb.81
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 02:48:15 -0700 (PDT)
Message-ID: <3d847d110809120248r796de032u29b08d41278c6299@mail.gmail.com>
Date: Fri, 12 Sep 2008 11:48:14 +0200
From: hanocri <hanocri@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Recovering LVM partition after OS reinstallation
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

After root filesystem failure my "/" was all messed up so i had to
install system from scratch (Debian Unstable). /home is on separate
LVM partition and (i hope so) intact. However pvscan and vgscan gives
no result. According to fdisk partition is marked as "8e  Linux LVM".
I have LVM metadata backup which you can find here:
http://pastebin.com/m5a13d266
At line 23 there is: 'device = "/dev/dm-7"    # Hint only ', but there
is no such device as /dev/dm-7. I think it should be rather /dev/dm-6
(I'm using dmraid), again according to fdisk - the size and type is
correct.
Should I change dm-7 into dm-6 or simply ignore it and do
vgcfgrestore? And what does ' #Hint only' mean? Or maybe there is
other way to recover LVM config?

Thanks for any help.

-- 
Regards, Grzegorz R.
