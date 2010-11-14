Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAEN0gmY019924
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 18:00:42 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAEN0RMq000409
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 18:00:28 -0500
Received: from melissa.gathman.org (fairfax.gathman.org [72.209.196.211])
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oAEN0Roi015843
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 18:00:27 -0500
Message-ID: <4CE06A08.1050209@bmsi.com>
Date: Sun, 14 Nov 2010 18:00:24 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <606057079.20101114024527@snet.sk>
In-Reply-To: <606057079.20101114024527@snet.sk>
Content-Type: multipart/alternative;
	boundary="------------050001040105060204020101"
Subject: Re: [linux-lvm] LVM volume umask change
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
--------------050001040105060204020101
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/13/2010 08:45 PM, Marek Soha wrote:
> When I create file/directory in LVM volume, it is created with
> permissions (mode) 666. I need to get 644.
> I changed umask in /etc/lvm/lvm.conf, but it did not helped.
> Any ideas?
lvm.conf has nothing to do with any filesystems (and associated files
and directories) you might happen to create on a logical volume.

Your question is a basic unix question.  Try "man umask".

--------------050001040105060204020101
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    On 11/13/2010 08:45 PM, Marek Soha wrote:<br>
    <blockquote cite="mid:606057079.20101114024527@snet.sk" type="cite">
      <pre wrap="">When I create file/directory in LVM volume, it is created with
permissions (mode) 666. I need to get 644.
I changed umask in /etc/lvm/lvm.conf, but it did not helped.
Any ideas?
</pre>
    </blockquote>
    <big>lvm.conf has nothing to do with any filesystems (and associated
      files and directories) you might happen to create on a logical
      volume.<br>
      <br>
      Your question is a basic unix question.&nbsp; Try "man umask".<br>
    </big>
  </body>
</html>

--------------050001040105060204020101--
