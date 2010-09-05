Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o85NLjep008429
	for <linux-lvm@redhat.com>; Sun, 5 Sep 2010 19:21:45 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o85NLYq0016857
	for <linux-lvm@redhat.com>; Sun, 5 Sep 2010 19:21:35 -0400
Received: from [192.168.10.38] (fairfax.gathman.org [72.209.196.211])
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o85NLXMg011072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 5 Sep 2010 19:21:34 -0400
Message-ID: <4C8425FD.6080603@bmsi.com>
Date: Sun, 05 Sep 2010 19:21:33 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <4c8249ae.07c1640a.2f38.ffff91c3@mx.google.com>	<Pine.LNX.4.64.1009051537580.17691@bmsred.bmsi.com>
	<4c83f84b.0639960a.28aa.4555@mx.google.com>
In-Reply-To: <4c83f84b.0639960a.28aa.4555@mx.google.com>
Content-Type: multipart/alternative;
	boundary="------------010903000208020702060305"
Subject: Re: [linux-lvm] Important diretories are missing after adding space.
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------010903000208020702060305
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/05/2010 04:06 PM, For Miscelenious wrote:
> Stuart, no offence can be taken ar all - I cam see two possibilities -
> u did smth very stupid or its a glitch.
> I actually selected "shutdown" option in kde.
>
> I cant say that fsck fixed - it reported a short read. I got
> completely shocked and just for the hell of it ran la just to observe
> that. Everything is "back".
Check /var/log/messages for I/O errors on sdb.
> Since then I copied all files. To backup lv and ran that fack. Last
> reported no problem.
>
> You mentioned something about extended partitions?
If sdb1 had been the extended partition, then it overlaps both sdb5 and
sdb6, so that building a PV/filesystem on sdb5 would overwrite the
existing filesystem on sdb1.  That would have come under the "very
stupid" category.  (I.e. don't try to add sdb2 as a PV!  Does EL5
prevent this somehow?  I don't have anything expendable attached to test
on...)

--------------010903000208020702060305
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
</head>
<body text="#000000" bgcolor="#ffffff">
On 09/05/2010 04:06 PM, For Miscelenious wrote:
<blockquote cite="mid:4c83f84b.0639960a.28aa.4555@mx.google.com"
 type="cite">
  <style type="text/css">body {word-wrap: break-word; background-color:#ffffff;}</style>
  <div style="font-family: sans-serif; font-size: 16px;">Stuart, no
offence can be taken ar all - I cam see two possibilities - u did smth
very stupid or its a glitch. <br>
I actually selected "shutdown" option in kde.<br>
  <br>
I cant say that fsck fixed - it reported a short read. I got completely
shocked and just for the hell of it ran la just to observe that.
Everything is "back".<br>
  </div>
</blockquote>
Check /var/log/messages for I/O errors on sdb.<br>
<blockquote cite="mid:4c83f84b.0639960a.28aa.4555@mx.google.com"
 type="cite">
  <div style="font-family: sans-serif; font-size: 16px;">Since then I
copied all files. To backup lv and ran that fack. Last reported no
problem.<br>
  <br>
You mentioned something about extended partitions?</div>
</blockquote>
If sdb1 had been the extended partition, then it overlaps both sdb5 and
sdb6, so that building a PV/filesystem on sdb5 would overwrite the
existing filesystem on sdb1.  That would have come under the "very
stupid" category.  (I.e. don't try to add sdb2 as a PV!  Does EL5
prevent this somehow?  I don't have anything expendable attached to
test on...)<br>
</body>
</html>

--------------010903000208020702060305--
