Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p0HEIXMn014656
	for <linux-lvm@redhat.com>; Mon, 17 Jan 2011 09:18:33 -0500
Received: from mail-qw0-f46.google.com (mail-qw0-f46.google.com
	[209.85.216.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p0HEIMBc004027
	for <linux-lvm@redhat.com>; Mon, 17 Jan 2011 09:18:22 -0500
Received: by qwa26 with SMTP id 26so4609381qwa.33
	for <linux-lvm@redhat.com>; Mon, 17 Jan 2011 06:18:22 -0800 (PST)
Message-ID: <4D344FA8.2020101@gmail.com>
Date: Mon, 17 Jan 2011 09:18:16 -0500
From: Mauricio Tavares <raubvogel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] grub written over lvm partition
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

	I was given an ubuntu desktop which has an interesting problem. It has 
only one HD with two partitions: /boot and LVM. In this computer, the 
lvm partition is the first one (/dev/sda1); I guess that is how ubuntu 
used to do things.

During the last OS upgrade someone told the updater to put grub on the 
first partition. As a result, the lvm partition got rather unhappy. Is 
there a way to retrieve data off that partition?
