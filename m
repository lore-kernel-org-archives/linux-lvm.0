Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5OJRUP7003850
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 15:27:31 -0400
Received: from mail.ilcampo.com (mail.ilcampo.com [193.172.126.47])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n5OJR86e023483
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 15:27:09 -0400
Received: from unknown (HELO [172.16.2.132])
	(mark.ruijter_siennax@[193.172.126.230])
	(envelope-sender <mruijter@gmail.com>)
	by mail.ilcampo.com (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 24 Jun 2009 19:27:08 -0000
Message-ID: <4A427DC4.7050805@gmail.com>
Date: Wed, 24 Jun 2009 21:25:56 +0200
From: Mark Ruijter <mruijter@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Data deduplication for Linux : lessfs
References: <4A42424B.1080208@gmail.com>
	<BE6893A3-3CF3-4B26-B23D-3951C1BF5034@karlsbakk.net>
In-Reply-To: <BE6893A3-3CF3-4B26-B23D-3951C1BF5034@karlsbakk.net>
Content-Type: multipart/alternative;
	boundary="------------090604030903040506090309"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------090604030903040506090309
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Roy,
>
> It's a good idea, but given the current traffic on the lessfs mailing
> list, I'm not sure if much work is done. I have been a member of that
> list since June 1 and haven't received more than one message, which
> was the one I wrote myself.
>
Almost all the traffic is on the forum - open discussion.
Only one person posted to the mailing list. ;-)

> If done smartly, this may perhaps be possible, but the problem is the
> filesystem's metadata. Is this going to be dedup'ed? How much will
> this take? A simple backup will update atime on all the files backed
> up, and although atime isn't always wanted or needed, the problem
> occurs elsewhere.
Typically the meta data on production systems is approx 10%~20% of the
deduplicated stored data.
Stored data is on my systems 40x less then the data written to the
filesystem.

For example, from a real life backup server making dozens of backups
each day:
# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/cciss/c0d0p3     9.7G  2.4G  6.9G  26% /
/dev/cciss/c0d0p1      99M   23M   72M  24% /boot
tmpfs                 7.9G     0  7.9G   0% /dev/shm
/dev/cciss/c0d0p4     246G  6.0G  241G   3% /meta
/dev/cciss/c0d1p1     274G   73G  202G  27% /blockdata
/dev/cciss/c1d0p1     4.1T  1.5T  2.7T  35% /data
lessfs                4.1T  1.5T  2.7T  35% /pooldata
[root@lessfssrv pooldata]# du . -s -h
31T     .
[root@lessfssrv pooldata]# ls -alh /data/current/
total 314G
drwxr-xr-x 2 root root   26 Jun  1 00:12 .
drwxr-xr-x 6 root root   59 Jun  1 00:12 ..
-rw-r--r-- 1 root root 314G Jun 22 14:26 blockdata.tch
[root@lessfssrv pooldata]# ls -alh /meta/current/
total 1.4G
drwxr-xr-x 2 root root   63 Jun  1 00:12 .
drwxr-xr-x 6 root root   59 Jun  1 00:12 ..
-rw-r--r-- 1 root root 1.3G Jun 22 14:52 blockusage.tch
-rw-r--r-- 1 root root  89M Jun 22 14:45 dirent.tcb
-rw-r--r-- 1 root root  89M Jun 22 14:52 metadata.tcb

Mark.
>
>
> roy
> --=20
> Roy Sigurd Karlsbakk
> (+47) 97542685
> roy@karlsbakk.net
> http://blogg.karlsbakk.net/
> --=20
> I all pedagogikk er det essensielt at pensum presenteres
> intelligibelt. Det er et element=EF=BF=BDrt imperativ for alle pedagoger =
=EF=BF=BD
> unng=EF=BF=BD eksessiv anvendelse av idiomer med fremmed opprinnelse. I de
> fleste tilfeller eksisterer adekvate og relevante synonymer p=EF=BF=BD no=
rsk.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------090604030903040506090309
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
Hi Roy,<br>
<blockquote
 cite="mid:BE6893A3-3CF3-4B26-B23D-3951C1BF5034@karlsbakk.net"
 type="cite"><br>
It's a good idea, but given the current traffic on the lessfs mailing
list, I'm not sure if much work is done. I have been a member of that
list since June 1 and haven't received more than one message, which was
the one I wrote myself.
  <br>
  <br>
</blockquote>
Almost all the traffic is on the forum - open discussion.<br>
Only one person posted to the mailing list. ;-)<br>
<br>
<blockquote
 cite="mid:BE6893A3-3CF3-4B26-B23D-3951C1BF5034@karlsbakk.net"
 type="cite">If done smartly, this may perhaps be possible, <font
 color="#993300">but the problem is the filesystem's metadata.</font>
Is this going to be dedup'ed? How much will this take? A simple backup
will update atime on all the files backed up, and although atime isn't
always wanted or needed, the problem occurs elsewhere.</blockquote>
Typically the meta data on production systems is approx 10%~20% of the
deduplicated stored data.<br>
Stored data is on my systems 40x less then the data written to the
filesystem.<br>
<br>
For example, from a real life backup server making dozens of backups
each day:<br>
<tt># df -h<br>
Filesystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp; Used Avail Use% Mounted on<br>
/dev/cciss/c0d0p3&nbsp;&nbsp;&nbsp;&nbsp; 9.7G&nbsp; 2.4G&nbsp; 6.9G&nbsp; 26% /<br>
/dev/cciss/c0d0p1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 99M&nbsp;&nbsp; 23M&nbsp;&nbsp; 72M&nbsp; 24% /boot<br>
tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7.9G&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 7.9G&nbsp;&nbsp; 0% /dev/shm<br>
/dev/cciss/c0d0p4&nbsp;&nbsp;&nbsp;&nbsp; 246G&nbsp; 6.0G&nbsp; 241G&nbsp;&nbsp; 3% /meta<br>
/dev/cciss/c0d1p1&nbsp;&nbsp;&nbsp;&nbsp; 274G&nbsp;&nbsp; 73G&nbsp; 202G&nbsp; 27% /blockdata<br>
/dev/cciss/c1d0p1&nbsp;&nbsp;&nbsp;&nbsp; 4.1T&nbsp; 1.5T&nbsp; 2.7T&nbsp; 35% /data<br>
lessfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.1T&nbsp; 1.5T&nbsp; 2.7T&nbsp; 35% /pooldata<br>
[root@lessfssrv pooldata]# du . -s -h<br>
31T&nbsp;&nbsp;&nbsp;&nbsp; .<br>
[root@lessfssrv pooldata]# ls -alh /data/current/<br>
total 314G<br>
drwxr-xr-x 2 root root&nbsp;&nbsp; 26 Jun&nbsp; 1 00:12 .<br>
drwxr-xr-x 6 root root&nbsp;&nbsp; 59 Jun&nbsp; 1 00:12 ..<br>
-rw-r--r-- 1 root root 314G Jun 22 14:26 blockdata.tch<br>
[root@lessfssrv pooldata]# ls -alh /meta/current/<br>
total 1.4G<br>
drwxr-xr-x 2 root root&nbsp;&nbsp; 63 Jun&nbsp; 1 00:12 .<br>
drwxr-xr-x 6 root root&nbsp;&nbsp; 59 Jun&nbsp; 1 00:12 ..<br>
-rw-r--r-- 1 root root 1.3G Jun 22 14:52 blockusage.tch<br>
-rw-r--r-- 1 root root&nbsp; 89M Jun 22 14:45 dirent.tcb<br>
-rw-r--r-- 1 root root&nbsp; 89M Jun 22 14:52 metadata.tcb</tt><br>
<br>
Mark.<br>
<blockquote
 cite="mid:BE6893A3-3CF3-4B26-B23D-3951C1BF5034@karlsbakk.net"
 type="cite"><br>
  <br>
roy
  <br>
--
  <br>
Roy Sigurd Karlsbakk
  <br>
(+47) 97542685
  <br>
<a class="moz-txt-link-abbreviated" href="mailto:roy@karlsbakk.net">roy@karlsbakk.net</a>
  <br>
<a class="moz-txt-link-freetext" href="http://blogg.karlsbakk.net/">http://blogg.karlsbakk.net/</a>
  <br>
--
  <br>
I all pedagogikk er det essensielt at pensum presenteres intelligibelt.
Det er et element&aelig;rt imperativ for alle pedagoger &aring; unng&aring; eksessiv
anvendelse av idiomer med fremmed opprinnelse. I de fleste tilfeller
eksisterer adekvate og relevante synonymer p&aring; norsk.
  <br>
  <br>
  <br>
_______________________________________________
  <br>
linux-lvm mailing list
  <br>
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
  <br>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
  <br>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>
  <br>
</blockquote>
<br>
</body>
</html>

--------------090604030903040506090309--
