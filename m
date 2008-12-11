Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBBBwnhG030554
	for <linux-lvm@redhat.com>; Thu, 11 Dec 2008 06:58:49 -0500
Received: from mail-fx0-f10.google.com (mail-fx0-f10.google.com
	[209.85.220.10])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBBBwMBY016147
	for <linux-lvm@redhat.com>; Thu, 11 Dec 2008 06:58:22 -0500
Received: by fxm3 with SMTP id 3so364131fxm.3
	for <linux-lvm@redhat.com>; Thu, 11 Dec 2008 03:58:21 -0800 (PST)
Message-ID: <d66ef690812110358r6652c1d3taf0441d8521e1938@mail.gmail.com>
Date: Thu, 11 Dec 2008 19:58:21 +0800
From: "wu jessinay" <jessinay@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_96603_20654364.1228996701542"
Subject: [linux-lvm] another system-config-lvm bug
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

------=_Part_96603_20654364.1228996701542
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi .There is another system-config-lvm bug with swap entries.
If a lv has an entry in /etc/fstab with the type of swap.
such as
/dev/vg1/lv1    swap   swap  defaults 0 0

if you click the edit button and then click OK with no change made.
The entry will get removed from /etc/fstab.

Clearly there are several other bugs when a lv is of the swap type.
I would like to know if redhat is planing to enhance the function of
system-config-lvm.
Currently it can only support ext2&ext3 well.

Thanks

------=_Part_96603_20654364.1228996701542
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Hi .There is another system-config-lvm bug with swap entries.</div>
<div>If a lv has an entry in /etc/fstab&nbsp;with the type of&nbsp;swap.</div>
<div>such as </div>
<div>/dev/vg1/lv1&nbsp;&nbsp;&nbsp; swap&nbsp;&nbsp; swap&nbsp; defaults 0 0</div>
<div>&nbsp;</div>
<div>if you click the edit button and then click OK with no change made.</div>
<div>The entry will get removed from /etc/fstab.</div>
<div>&nbsp;</div>
<div>Clearly there are several other bugs when a lv is of the swap type.</div>
<div>I would like to know if redhat is planing to enhance the function of&nbsp;</div>
<div>system-config-lvm.</div>
<div>Currently it can only support ext2&amp;ext3 well.</div>
<div>&nbsp;</div>
<div>Thanks&nbsp;</div>

------=_Part_96603_20654364.1228996701542--
