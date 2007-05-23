Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4NEAT07005312
	for <linux-lvm@redhat.com>; Wed, 23 May 2007 10:10:29 -0400
Received: from inspire.Mines.EDU (inspire.Mines.EDU [138.67.130.5])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4NEANoD015938
	for <linux-lvm@redhat.com>; Wed, 23 May 2007 10:10:23 -0400
Received: from merlin.Mines.EDU (merlin.Mines.EDU [138.67.4.11])
	(authenticated bits=0)
	by inspire.Mines.EDU (8.13.1/8.13.1) with ESMTP id l4NEAHvN003815
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 23 May 2007 08:10:17 -0600
Subject: Re: [linux-lvm] lvm upgrade problems.
From: "Matthew B. Brookover" <mbrookov@mines.edu>
In-Reply-To: <20070523005108.GB14085@monsterjam.org>
References: <20070523005108.GB14085@monsterjam.org>
Content-Type: multipart/alternative; boundary="=-fd1geflc31JoJswzKFo8"
Date: Wed, 23 May 2007 08:10:16 -0600
Message-Id: <1179929417.5276.10.camel@merlin.Mines.EDU>
Mime-Version: 1.0
Reply-To: mbrookov@mines.edu,
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-fd1geflc31JoJswzKFo8
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

You probably need to start up the cluster infrastructure. cman, ccsd,
fencd, and clvmd.

This is probably not a good idea, but you can also turn off LVM2 locking
with:

lvmconf --disable-cluster

you can turn LVM2 locking back on with:

lvmconf --enable-cluster --lockinglibdir /usr/lib --lockinglib liblvm2clusterlock.so

The lvmconf command edits /etc/lvm/lvm.conf.

The errors 'connect() failed on local socket: Connection refused' appear
from LVM2 commands when clvmd is not running and lvm.conf is configured
for a cluster.

I am not sure why the device name does not show up.  After turning off
locking, you could try to do a 'vgchange -ay' and hopefully it will
appear.  

Matt

On Tue, 2007-05-22 at 20:51 -0400, jason@monsterjam.org wrote:

> hey list. Im running 
> [root@tf2 ~]# uname -a
> Linux tf2.localdomain 2.6.9-55.ELsmp #1 SMP Fri Apr 20 17:03:35 EDT 2007 i686 i686 i386 
> GNU/Linux
> [root@tf2 ~]# cat /etc/redhat-release 
> Red Hat Enterprise Linux AS release 4 (Nahant Update 5)
> [root@tf2 ~]# 
> 
> and I have a lvm volume created on a GFS formatted drive that I cant see anymore..
> 
> [root@tf2 ~]# vgscan
>   connect() failed on local socket: Connection refused
>   connect() failed on local socket: Connection refused
>   WARNING: Falling back to local file-based locking.
>   Volume Groups with the clustered attribute will be inaccessible.
>   Reading all physical volumes.  This may take a while...
>   Skipping clustered volume group diskarray
> [root@tf2 ~]# pvscan 
>   connect() failed on local socket: Connection refused
>   connect() failed on local socket: Connection refused
>   WARNING: Falling back to local file-based locking.
>   Volume Groups with the clustered attribute will be inaccessible.
>   PV /dev/sdb1   VG diskarray   lvm2 [136.48 GB / 6.48 GB free]
>   Total: 1 [136.48 GB] / in use: 1 [136.48 GB] / in no VG: 0 [0   ]
> [root@tf2 ~]#
> 
> whats more, the device name used to be 
> /dev/diskarray/lv1
> now, all I see is 
> 
> [root@tf2 ~]# ls -al /dev/disk/by-path/*
> lrwxrwxrwx  1 root root  9 May 22 15:34 /dev/disk/by-path/pci-0000:00:1f.1-ide-0:0 -> ../../hda
> lrwxrwxrwx  1 root root  9 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0 -> 
> ../../sda
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part1 -> 
> ../../sda1
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part2 -> 
> ../../sda2
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part3 -> 
> ../../sda3
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part4 -> 
> ../../sda4
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part5 -> 
> ../../sda5
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part6 -> 
> ../../sda6
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part7 -> 
> ../../sda7
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part8 -> 
> ../../sda8
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part9 -> 
> ../../sda9
> lrwxrwxrwx  1 root root  9 May 22 15:34 /dev/disk/by-path/pci-0000:03:0b.0-scsi-0:2:0:0 -> 
> ../../sdb
> lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:03:0b.0-scsi-0:2:0:0-part1 -> 
> ../../sdb1
> [root@tf2 ~]# 
> 
> 
> /dev/sdb1 is my disk array..
> 
> any ideas?
> 
> Jason
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=-fd1geflc31JoJswzKFo8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.6.2">
</HEAD>
<BODY>
You probably need to start up the cluster infrastructure. cman, ccsd, fencd, and clvmd.<BR>
<BR>
This is probably not a good idea, but you can also turn off LVM2 locking with:
<PRE>
lvmconf --disable-cluster
</PRE>
you can turn LVM2 locking back on with:
<PRE>
lvmconf --enable-cluster --lockinglibdir /usr/lib --lockinglib liblvm2clusterlock.so
</PRE>
The lvmconf command edits /etc/lvm/lvm.conf.<BR>
<BR>
The errors '<FONT COLOR="#000000">connect() failed on local socket: Connection refused</FONT>' appear from LVM2 commands when clvmd is not running and lvm.conf is configured for a cluster.<BR>
<BR>
I am not sure why the device name does not show up.&nbsp; After turning off locking, you could try to do a 'vgchange -ay' and hopefully it will appear.&nbsp; <BR>
<BR>
Matt<BR>
<BR>
On Tue, 2007-05-22 at 20:51 -0400, jason@monsterjam.org wrote:
<BLOCKQUOTE TYPE=CITE>
<PRE>
<FONT COLOR="#000000">hey list. Im running </FONT>
<FONT COLOR="#000000">[root@tf2 ~]# uname -a</FONT>
<FONT COLOR="#000000">Linux tf2.localdomain 2.6.9-55.ELsmp #1 SMP Fri Apr 20 17:03:35 EDT 2007 i686 i686 i386 </FONT>
<FONT COLOR="#000000">GNU/Linux</FONT>
<FONT COLOR="#000000">[root@tf2 ~]# cat /etc/redhat-release </FONT>
<FONT COLOR="#000000">Red Hat Enterprise Linux AS release 4 (Nahant Update 5)</FONT>
<FONT COLOR="#000000">[root@tf2 ~]# </FONT>

<FONT COLOR="#000000">and I have a lvm volume created on a GFS formatted drive that I cant see anymore..</FONT>

<FONT COLOR="#000000">[root@tf2 ~]# vgscan</FONT>
<FONT COLOR="#000000">  connect() failed on local socket: Connection refused</FONT>
<FONT COLOR="#000000">  connect() failed on local socket: Connection refused</FONT>
<FONT COLOR="#000000">  WARNING: Falling back to local file-based locking.</FONT>
<FONT COLOR="#000000">  Volume Groups with the clustered attribute will be inaccessible.</FONT>
<FONT COLOR="#000000">  Reading all physical volumes.  This may take a while...</FONT>
<FONT COLOR="#000000">  Skipping clustered volume group diskarray</FONT>
<FONT COLOR="#000000">[root@tf2 ~]# pvscan </FONT>
<FONT COLOR="#000000">  connect() failed on local socket: Connection refused</FONT>
<FONT COLOR="#000000">  connect() failed on local socket: Connection refused</FONT>
<FONT COLOR="#000000">  WARNING: Falling back to local file-based locking.</FONT>
<FONT COLOR="#000000">  Volume Groups with the clustered attribute will be inaccessible.</FONT>
<FONT COLOR="#000000">  PV /dev/sdb1   VG diskarray   lvm2 [136.48 GB / 6.48 GB free]</FONT>
<FONT COLOR="#000000">  Total: 1 [136.48 GB] / in use: 1 [136.48 GB] / in no VG: 0 [0   ]</FONT>
<FONT COLOR="#000000">[root@tf2 ~]#</FONT>

<FONT COLOR="#000000">whats more, the device name used to be </FONT>
<FONT COLOR="#000000">/dev/diskarray/lv1</FONT>
<FONT COLOR="#000000">now, all I see is </FONT>

<FONT COLOR="#000000">[root@tf2 ~]# ls -al /dev/disk/by-path/*</FONT>
<FONT COLOR="#000000">lrwxrwxrwx  1 root root  9 May 22 15:34 /dev/disk/by-path/pci-0000:00:1f.1-ide-0:0 -&gt; ../../hda</FONT>
<FONT COLOR="#000000">lrwxrwxrwx  1 root root  9 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0 -&gt; </FONT>
<FONT COLOR="#000000">../../sda</FONT>
<FONT COLOR="#000000">lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part1 -&gt; </FONT>
<FONT COLOR="#000000">../../sda1</FONT>
<FONT COLOR="#000000">lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part2 -&gt; </FONT>
<FONT COLOR="#000000">../../sda2</FONT>
<FONT COLOR="#000000">lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part3 -&gt; </FONT>
<FONT COLOR="#000000">../../sda3</FONT>
<FONT COLOR="#000000">lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part4 -&gt; </FONT>
<FONT COLOR="#000000">../../sda4</FONT>
<FONT COLOR="#000000">lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part5 -&gt; </FONT>
<FONT COLOR="#000000">../../sda5</FONT>
<FONT COLOR="#000000">lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part6 -&gt; </FONT>
<FONT COLOR="#000000">../../sda6</FONT>
<FONT COLOR="#000000">lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part7 -&gt; </FONT>
<FONT COLOR="#000000">../../sda7</FONT>
<FONT COLOR="#000000">lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part8 -&gt; </FONT>
<FONT COLOR="#000000">../../sda8</FONT>
<FONT COLOR="#000000">lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:02:0e.0-scsi-0:1:0:0-part9 -&gt; </FONT>
<FONT COLOR="#000000">../../sda9</FONT>
<FONT COLOR="#000000">lrwxrwxrwx  1 root root  9 May 22 15:34 /dev/disk/by-path/pci-0000:03:0b.0-scsi-0:2:0:0 -&gt; </FONT>
<FONT COLOR="#000000">../../sdb</FONT>
<FONT COLOR="#000000">lrwxrwxrwx  1 root root 10 May 22 15:34 /dev/disk/by-path/pci-0000:03:0b.0-scsi-0:2:0:0-part1 -&gt; </FONT>
<FONT COLOR="#000000">../../sdb1</FONT>
<FONT COLOR="#000000">[root@tf2 ~]# </FONT>


<FONT COLOR="#000000">/dev/sdb1 is my disk array..</FONT>

<FONT COLOR="#000000">any ideas?</FONT>

<FONT COLOR="#000000">Jason</FONT>


<FONT COLOR="#000000">_______________________________________________</FONT>
<FONT COLOR="#000000">linux-lvm mailing list</FONT>
<FONT COLOR="#000000"><A HREF="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A></FONT>
<FONT COLOR="#000000"><A HREF="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</A></FONT>
<FONT COLOR="#000000">read the LVM HOW-TO at <A HREF="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</A></FONT>
</PRE>
</BLOCKQUOTE>
</BODY>
</HTML>

--=-fd1geflc31JoJswzKFo8--
