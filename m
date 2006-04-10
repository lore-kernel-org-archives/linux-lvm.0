Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3A5tGD4032132
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2006 01:55:16 -0400
Received: from pproxy.gmail.com (pproxy.gmail.com [64.233.166.178])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3A5tAhI022106
	for <linux-lvm@redhat.com.>; Mon, 10 Apr 2006 01:55:10 -0400
Received: by pproxy.gmail.com with SMTP id z59so211473pyg
	for <linux-lvm@redhat.com.>; Sun, 09 Apr 2006 22:55:09 -0700 (PDT)
From: Petes Junk <crap.central@gmail.com>
Date: Sun, 09 Apr 2006 23:49:40 -0500
Message-Id: <1144644580.3783.35.camel@halifax>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lost volume group
Reply-To: crap.central@gmail.com,
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

When i was extending a group to include another PV somehow the Group
disappeared from the devices list after a reboot. 

The last entry in /dev/lvm/backup shows me executing
/usr/sbin/vgextend swampvg /dev/hdb2
to an already working /dev/swampvg/swamplv with a non striped /dev/hdb4
in it.

I then did a mkfs -t ext3 /dev/hdb2 (the new disk) which was probably
how i got into trouble. I really need the image from /dev/hdb4 and im
afraid to do anything with it without knowing exactly what im doing. Im
thinking all i need is to recreate the VG and LV with only /dev/hdb4. I
have several archives in the /dev/lvm/archive but docs are not clear how
to approach this. I backed up the partition to another with dd so i
could try work on it safely, but the LVM tools didnt like the fact that
it had two uuid labels the same and always picked /dev/hdb4 to work on.

Since then Ive been reading what little there is on LVM. Cant even find
a sysadmin book with more than 3 pages on the subject. Im very surprised
at the man page for vgcfgrestore where its options are not even
explained.

Any help is greatly appreciated. 

Pete
