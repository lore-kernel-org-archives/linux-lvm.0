Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k29FTm113145
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2006 10:29:48 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.198])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k29FTgJ0022233
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2006 10:29:42 -0500
Received: by xproxy.gmail.com with SMTP id t14so320012wxc
	for <linux-lvm@redhat.com>; Thu, 09 Mar 2006 07:29:42 -0800 (PST)
Message-ID: <6c3e3c670603090729ue151783w37c1c5ac412f7bd1@mail.gmail.com>
Date: Thu, 9 Mar 2006 10:29:41 -0500
From: "Chad Rebuck" <chadrebuck@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] pvmove didn't work - now system won't boot
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

I ran "pvmove -v /dev/hdc2" to move the data off the drive but it
stopped before any real drive activity happened.  The system was stuck
for about 30 minutes not doing anything so I powered off/on.  Now it
boots into a bash prompt but suggests I run fsck manually.  I noticed
that lvm only reported that 2 of the 3 physical volumes were found.  I
can't run any lvm commands from here as I get a 'Locking type 1
initialization failed'.

What steps do I take to get the system to boot again?  The root dir is
part of the lvm volume.  The /boot is separate from the lvm volume but
maybe this is required anyway for lvm to work.

Thanks,
Chad
