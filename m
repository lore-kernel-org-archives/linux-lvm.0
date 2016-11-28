Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAS7hdfL013619
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2016 02:43:39 -0500
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B4B531B33A
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2016 07:43:38 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f82so145957093wmf.1
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2016 23:43:38 -0800 (PST)
MIME-Version: 1.0
From: Patrick Dung <mpatdung@gmail.com>
Date: Mon, 28 Nov 2016 15:43:36 +0800
Message-ID: <CAEtPA0CX_3j5du8ScgRCT8DPRiWiW1-Kt5dnHD+JvOePrcWkcg@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a114b137829f538054257a1dc
Subject: [linux-lvm] Is trim/discard supported on LVM RAID logical volume?
	(resent)
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

--001a114b137829f538054257a1dc
Content-Type: text/plain; charset=UTF-8

Hello,

In my old setting, fstrim is supported:
ext4 over LVM over MD software raid (mdadm) > SSD.

After reading the recommendation in RHEL 6
https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Storage_Administration_Guide/ch-ssd.html

I change to use raid 1 mirror using 'LVM RAID logical volume'. It make use
of MD raid internally.
But I found fstrim does not work anymore. Is the behavior expected?

Thanks and regards,
Patrick

--001a114b137829f538054257a1dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div id=3D"gmail-yiv9701195013yui_3_16_0_1_1480154771990_7=
669">Hello,<br></div><div id=3D"gmail-yiv9701195013yui_3_16_0_1_14801547719=
90_7626"><br></div><div id=3D"gmail-yiv9701195013yui_3_16_0_1_1480154771990=
_7627">In my old setting, fstrim is supported:</div>ext4 over LVM over MD s=
oftware raid (mdadm) &gt; SSD.<br id=3D"gmail-yiv9701195013yui_3_16_0_1_148=
0154771990_7618"><br id=3D"gmail-yiv9701195013yui_3_16_0_1_1480154771990_76=
19">After
 reading the recommendation in RHEL 6=20
<a href=3D"https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise=
_Linux/6/html/Storage_Administration_Guide/ch-ssd.html">https://access.redh=
at.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Storage_Administ=
ration_Guide/ch-ssd.html</a><br id=3D"gmail-yiv9701195013yui_3_16_0_1_14801=
54771990_7620"><br id=3D"gmail-yiv9701195013yui_3_16_0_1_1480154771990_7621=
">I change to use raid 1 mirror using &#39;LVM RAID logical volume&#39;. It=
 make use of MD raid internally.<br id=3D"gmail-yiv9701195013yui_3_16_0_1_1=
480154771990_7622"><div id=3D"gmail-yiv9701195013yui_3_16_0_1_1480154771990=
_7635">But I found fstrim does not work anymore. Is the behavior expected?<=
/div><div id=3D"gmail-yiv9701195013yui_3_16_0_1_1480154771990_7636"><br></d=
iv><div id=3D"gmail-yiv9701195013yui_3_16_0_1_1480154771990_7637">Thanks an=
d regards,</div>Patrick</div>

--001a114b137829f538054257a1dc--
