Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3783D5C8AE
	for <linux-lvm@redhat.com>; Thu, 11 May 2017 10:39:33 +0000 (UTC)
Received: from s96.linuxpl.com (s96.linuxpl.com [95.211.176.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C404585359
	for <linux-lvm@redhat.com>; Thu, 11 May 2017 10:39:29 +0000 (UTC)
Received: from [212.87.252.2] (helo=[10.2.56.200])
	by s96.linuxpl.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.88)
	(envelope-from <tomasz@lasko.pl>) id 1d8lVH-0005Z4-Lg
	for linux-lvm@redhat.com; Thu, 11 May 2017 12:39:27 +0200
From: Tomasz Lasko <tomasz@lasko.pl>
Message-ID: <d8bf4829-6136-4f44-68b1-661b3b6f98cb@lasko.pl>
Date: Thu, 11 May 2017 12:39:23 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------C0AD074F851416E027E09397"
Subject: [linux-lvm] Sector size is assumed 512
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
--------------C0AD074F851416E027E09397
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm not a part of the list or the project, just a random guy dropping by 
to say I found one suspicious thing:

after looking for what 's' size stands for, I found that your 
lvmcmdline.c source code 
<https://github.com/Jajcus/lvm2/blob/master/tools/lvmcmdline.c#L320> 
probably assumes that sector size is 512, but there are various sector 
sizes out in world (both for the hardware sector size and logical disk 
interfaces like SCSI) especially more and more popular 4096 byte sector 
size.

I wonder if apart of lvmcmdline.c above, also other parts of your 
software assume that sector size will always be 512. If yes, then I 
suggest rethinking if 4k sectors might break some operations in LVM.

By the way, I understand that when specifying command line parameter 
sector size, then it is the same for small 's' as capital 'S', right?  
And the same goes for bytes ('b' is the same as 'B'), right?

Best regards,
Tomasz Lasko



--------------C0AD074F851416E027E09397
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi, <br>
    <br>
    I'm not a part of the list or the project, just a random guy
    dropping by to say I found one suspicious thing:<br>
    <br>
    after looking for what 's' size stands for, I found that your <a
href="https://github.com/Jajcus/lvm2/blob/master/tools/lvmcmdline.c#L320">lvmcmdline.c
      source code</a> probably assumes that sector size is 512, but
    there are various sector sizes out in world (both for the hardware
    sector size and logical disk interfaces like SCSI) especially more
    and more popular 4096 byte sector size. <br>
    <br>
    I wonder if apart of lvmcmdline.c above, also other parts of your
    software assume that sector size will always be 512. If yes, then I
    suggest rethinking if 4k sectors might break some operations in LVM.<br>
    <br>
    By the way, I understand that when specifying command line parameter
    sector size, then it is the same for small 's' as capital 'S',
    right?  And the same goes for bytes ('b' is the same as 'B'), right?
    <br>
    <br>
    Best regards,<br>
    Tomasz Lasko<br>
    <br>
    <br>
  </body>
</html>

--------------C0AD074F851416E027E09397--
