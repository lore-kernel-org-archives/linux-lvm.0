Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n12FKiYK017611
	for <linux-lvm@redhat.com>; Mon, 2 Feb 2009 10:20:44 -0500
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.246])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n12FKTJd009000
	for <linux-lvm@redhat.com>; Mon, 2 Feb 2009 10:20:29 -0500
Received: by an-out-0708.google.com with SMTP id b2so543628ana.36
	for <linux-lvm@redhat.com>; Mon, 02 Feb 2009 07:20:29 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 2 Feb 2009 16:20:28 +0100
Message-ID: <81c921f30902020720y2bc262e7qe69a4be771738472@mail.gmail.com>
From: Javier Barroso <javibarroso@gmail.com>
Content-Type: multipart/alternative; boundary=001636e911c23d83270461f11854
Subject: [linux-lvm] LVM on iscsi multipathed disks fails to shutdown
	(possible not in redhat)
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

--001636e911c23d83270461f11854
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi list,

I'm on debian lenny, but I supposed it is a common question for lvm users
(in debian lists I didn't get any response)

Currently, I have next config:

multipath is used for get two iscsi path like a disk.

This disk is a pv, and is the uniq pv in my vg. My vg has a lv who is
mounted on /home

My system is hanging on lvchange process when it is shutdowing (or
rebooting). It is likely it is waiting for the device who multipath down
before.

I had to comment vgchange line from /etc/init.d/lvm2 in stop function,
so my system is rebooting fine. (On redhat perhaps I had to comment it in
/etc/init.d/lvm2-monitor)

Do you think this change could cause troubles for the future, is
possible corruption? I think if my lvm system were clustered, 'lvchange
-an must be activate', but if my system is standalone, is it necessary ?

So do you have any tip ?

Thank you

Sorry for my english

--001636e911c23d83270461f11854
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi list,<br><br>I&#39;m on debian lenny, but I supposed it is a common question for lvm users (in debian lists I didn&#39;t get any response)<br>
<br>
Currently, I have next config:<br>
<br>
multipath is used for get two iscsi path like a disk.<br>
<br>
This disk is a pv, and is the uniq pv in my vg. My vg has a lv who is<br>
mounted on /home<br>
<br> My system is hanging on lvchange process when it is shutdowing (or<br>
rebooting). It is likely it is waiting for the device who multipath down<br>
before.<br>
<br>
I had to comment vgchange line from /etc/init.d/lvm2 in stop function,<br>
so my system is rebooting fine. (On redhat perhaps I had to comment it in /etc/init.d/lvm2-monitor)<br>
<br>
Do you think this change could cause troubles for the future, is<br>
possible corruption? I think if my lvm system were clustered, &#39;lvchange<br>
-an must be activate&#39;, but if my system is standalone, is it necessary ?<br>
<br>
So do you have any tip ?<br>
<br>
Thank you<br>
<br>
Sorry for my english

--001636e911c23d83270461f11854--
