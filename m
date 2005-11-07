Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA7MroV01021
	for <linux-lvm@redhat.com>; Mon, 7 Nov 2005 17:53:50 -0500
Received: from NAMESPRO-EMAIL.mailroot.namespro.ca (mailroot.namespro.ca
	[70.85.153.146])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA7MreXf032474
	for <linux-lvm@redhat.com>; Mon, 7 Nov 2005 17:53:43 -0500
Message-ID: <436FDADF.80805@picardconsulting.ca>
Date: Mon, 07 Nov 2005 17:53:19 -0500
From: Patrick Picard <ppicard@picardconsulting.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] RAID 5 + LVM Planning help needed
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
Content-Type: text/html; charset="us-ascii"
To: linux-lvm@redhat.com

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
Hi Everyone,<br>
<br>
I am planning to have a raid 5 array (software based) with LVM riding
atop.<br>
<br>
I have a few questions regarding the setup.<br>
<br>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Generator" content="Kate, the KDE Advanced Text Editor">
1-
<b>From Suse 10.0 Reference Manual: </b>The
physical extent size defines the size of a physical block in the volume
group. All the
disk space in a volume group is handled in chunks of this size. This
value is normally
set to 4 MB and allows for a maximum size of 256 GB for physical and
logical volumes.
The physical extent size should only be increased, for example, to 8,
16, or 32 MB, if
you need logical volumes larger than 256 GB.<br>
<br>
Is this a linear function, meaning??<br>
PE&nbsp;&nbsp; &nbsp;&nbsp; Max Size<br>
8mb&nbsp;&nbsp; 512GB<br>
16mb 1TB<br>
32mb 2TB<br>
<br>
2- Raid setup: In the following config extract, do the hard drives have
to be formatted first, or could I do like in extract 2:<br>
I assume extract 1 has the drives partitionned with type fd ( raid
autodetect)...which one is the right one!!!<br>
<b>Extract 1:</b><br>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Generator" content="Kate, the KDE Advanced Text Editor">
<pre>raiddev /dev/md0
        raid-level      5
        nr-raid-disks   6
        nr-spare-disks  0
        persistent-superblock 1
        parity-algorithm        left-symmetric
        chunk-size      32
        device          /dev/sdb1
        raid-disk       0
        device          /dev/sdc1
        raid-disk       1
        device          /dev/sdd1
        raid-disk       2
        device          /dev/sde1
        raid-disk       3
        device          /dev/sdf1
        raid-disk       4
        device          /dev/sdg1
        raid-disk  	5</pre>
<b>Extract 2: (using raw disk)</b><br>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Generator" content="Kate, the KDE Advanced Text Editor">
<pre>raiddev /dev/md0
        raid-level      5
        nr-raid-disks   6
        nr-spare-disks  0
        persistent-superblock 1
        parity-algorithm        left-symmetric
        chunk-size      32
        device          /dev/sdb
        raid-disk       0
        device          /dev/sdc
        raid-disk       1
        device          /dev/sdd
        raid-disk       2
        device          /dev/sde
        raid-disk       3
        device          /dev/sdf
        raid-disk       4
        device          /dev/sdg
        raid-disk  	5


Then mkraid /dev/md0


<b>3- Once the raid is setup, </b>
pvcreate /dev/md0
vgcreate -s16 data /dev/md0
lvcreate  ( a bunch of lv's are created here)

I plan to partition the lv's with reiserfs

Some lv's will have lots of small files, where another will have tons of 700MB files.... does the PE size affect this ?

If you have any suggestion to make this setup optimal, it would be greatly appreciated. The HD's will be SATA and PATA ( mixed, but on different busses)


Thanks to everyone who will help.

Patrick Picard
Picard Consulting

</pre>
</body>
</html>
