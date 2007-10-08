Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l98DTeTN031255
	for <linux-lvm@redhat.com>; Mon, 8 Oct 2007 09:29:40 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.239])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l98DTALk023349
	for <linux-lvm@redhat.com>; Mon, 8 Oct 2007 09:29:34 -0400
Received: by wx-out-0506.google.com with SMTP id t16so1145352wxc
	for <linux-lvm@redhat.com>; Mon, 08 Oct 2007 06:29:34 -0700 (PDT)
Message-ID: <95fec8860710080629h773abe69i9f5f367f80e2488f@mail.gmail.com>
Date: Mon, 8 Oct 2007 10:29:34 -0300
From: "Guillermo Marraco" <guillermo.marraco@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_863_25889352.1191850174661"
Subject: [linux-lvm] Problem resizing partition
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
To: linux-lvm@redhat.com

------=_Part_863_25889352.1191850174661
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello. I have recently installed a CentOS 5 Linux distribution. Is a free
version of Red Hat Enterprise.

I are a Linux Newbie.

The Linux installer DVD does not liked the 20 Gb ext3 partition I have
created (It was saying than now enough space was available), so I tell him
to automatically configure the partitions and filesystem.

The Installer formatted and created a 32 Mb "boot" partition, and a 20 Gb
"unknown" partition (as is found By gparted software).

I need to reduce this "unknown" partition by 8 Mb, (to avoid writing the
last 8 Mb, since is probably that the PC vendor, has utilized this space to
hide information, that windows use to recognizing that is "genuine", (don't
bash me about windows, I have not purchased that machine, I are utilizing
that machine to experiment and learn Linux, because I want latter to operate
a cluster with that OS, and I can't do experiments on the cluster, like
learning to resizing partitions)

I have not idea what file system is, and what tools allow to resize that
partition. I Have installed gparted (#yum install gparted), since I was told
that is the "Partition Magic" of Linux.
but It looks like this file system is rare, because is for cluster designed.

Looking on Internet, I have found that probably this system utilizes clvm
(no idea), so I have found this mail list, and write for help.

can you help me?

PD:Please, excuse my bad grammar, I never studied English.

------=_Part_863_25889352.1191850174661
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello. I have recently installed a CentOS 5 Linux distribution. Is a free version of Red Hat Enterprise.<br><br>I are a Linux Newbie.<br><br>The Linux installer DVD does not liked the 20 Gb ext3 partition I have created (It was saying than now enough space was available), so I tell him to automatically configure the partitions and filesystem.
<br><br>The Installer formatted and created a 32 Mb &quot;boot&quot; partition, and a 20 Gb &quot;unknown&quot; partition (as is found By gparted software).<br><br>I need to reduce this &quot;unknown&quot; partition by 8 Mb, (to avoid writing the last 8 Mb, since is probably that the PC vendor, has utilized this space to hide information, that windows use to recognizing that is &quot;genuine&quot;, (don&#39;t bash me about windows, I have not purchased that machine, I are utilizing that machine to experiment and learn Linux, because I want latter to operate a cluster with that OS, and I can&#39;t do experiments on the cluster, like learning to resizing partitions)
<br><br>I have not idea what file system is, and what tools allow to resize that partition. I Have installed gparted (#yum install gparted), since I was told that is the &quot;Partition Magic&quot; of Linux.<br>but It looks like this file system is rare, because is for cluster designed.
<br><br>Looking on Internet, I have found that probably this system utilizes clvm (no idea), so I have found this mail list, and write for help.<br><br>can you help me?<br><br>PD:Please, excuse my bad grammar, I never studied English.
<br>

------=_Part_863_25889352.1191850174661--
