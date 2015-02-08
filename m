Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t18J0Exx017677
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2015 14:00:14 -0500
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t18J0BYD032248
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2015 14:00:13 -0500
Received: by mail-wg0-f41.google.com with SMTP id b13so2892693wgh.0
	for <linux-lvm@redhat.com>; Sun, 08 Feb 2015 11:00:11 -0800 (PST)
Received: from [10.0.1.5] (cpc27-hudd10-2-0-cust190.4-1.cable.virginm.net.
	[86.18.68.191]) by mx.google.com with ESMTPSA id
	dz10sm11130436wib.17.2015.02.08.11.00.09 for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 08 Feb 2015 11:00:10 -0800 (PST)
From: "Drew..." <1drew345@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_F4B31A39-FAEA-48C1-89C7-2F99158AA573"
Message-Id: <646AF90A-464B-44EC-BE14-FCD4F888A3CB@gmail.com>
Date: Sun, 8 Feb 2015 18:59:37 +0000
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Subject: [linux-lvm] LVM disk power management
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


--Apple-Mail=_F4B31A39-FAEA-48C1-89C7-2F99158AA573
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,
I have 3 physical disks forming one volume group, with one logical =
volume.
If i try to issue a standby command to the logical volume i get the =
following error..
sudo hdparm -y /dev/mapper/VG0-LVstorage

/dev/mapper/VG0-LVstorage:

 issuing standby command

 HDIO_DRIVE_CMD(standby) failed: Inappropriate ioctl for device

But if i issue a standby command to the individual disks in the volume =
group..
sudo hdparm -y /dev/sda1 /dev/sdb1 /dev/sdc1

/dev/sda1:

 issuing standby command

/dev/sdb1:

 issuing standby command

/dev/sdc1:

 issuing standby command
This works fine!=20
Is addressing individual disks the normal way to to spin down disks in a =
lvm volume group or will this cause file corruption.
And if not, is there a safe way to achieve this or is it just not =
possible to spin down disks in a lvm.
I would be grateful of any advice you could offer. I have spent some =
time searching around for some information on this & i can not find any =
documented on this anywhere.
Thanks,
Kind regards,
Drew=

--Apple-Mail=_F4B31A39-FAEA-48C1-89C7-2F99158AA573
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"border: 0px; margin: 0px; padding: 7px 0px; =
color: rgb(51, 51, 51); font-size: 13px; line-height: =
19.006000518798828px; font-family: sans-serif !important;" =
class=3D"">Hi,<br class=3D"">I have 3 physical disks forming one volume =
group, with one logical volume.<br class=3D"">If i try to issue a =
standby command to the logical volume i get the following =
error..</div><div class=3D"codebox" style=3D"border: 1px solid rgb(187, =
204, 221); margin: 0.75em 1em; padding: 0px; background-color: rgb(235, =
241, 245); color: rgb(34, 34, 34); font-size: 13px; line-height: =
19.006000518798828px; font-family: sans-serif !important;"><pre =
style=3D"border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 0px; =
font-size: 1em; overflow: auto; width: 1029px; direction: ltr;" =
class=3D""><code style=3D"font-size: 1em; padding: 0.5em; display: =
inline-block;" class=3D"">sudo hdparm -y /dev/mapper/VG0-LVstorage

/dev/mapper/VG0-LVstorage:

 issuing standby command

 HDIO_DRIVE_CMD(standby) failed: Inappropriate ioctl for =
device</code></pre></div><br style=3D"color: rgb(51, 51, 51); font-size: =
13px; line-height: 19.006000518798828px; font-family: sans-serif =
!important;" class=3D""><span style=3D"color: rgb(51, 51, 51); =
font-family: sans-serif; font-size: 13px; line-height: =
19.006000518798828px;" class=3D"">But if i issue a standby command to =
the individual disks in the volume group..</span><br class=3D""><div =
class=3D"codebox" style=3D"border: 1px solid rgb(187, 204, 221); margin: =
0.75em 1em; padding: 0px; background-color: rgb(235, 241, 245); color: =
rgb(34, 34, 34); font-size: 13px; line-height: 19.006000518798828px; =
font-family: sans-serif !important;"><pre style=3D"border: 0px; =
margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 1em; =
overflow: auto; width: 1029px; direction: ltr;" class=3D""><code =
style=3D"font-size: 1em; padding: 0.5em; display: inline-block;" =
class=3D"">sudo hdparm -y /dev/sda1 /dev/sdb1 /dev/sdc1

/dev/sda1:

 issuing standby command

/dev/sdb1:

 issuing standby command

/dev/sdc1:

 issuing standby command</code></pre></div><div style=3D"border: 0px; =
margin: 0px; padding: 7px 0px; color: rgb(51, 51, 51); font-size: 13px; =
line-height: 19.006000518798828px; font-family: sans-serif !important;" =
class=3D"">This works fine!&nbsp;<br class=3D"">Is addressing individual =
disks the normal way to to spin down disks in a lvm volume group or will =
this cause file corruption.</div><div style=3D"border: 0px; margin: 0px; =
padding: 7px 0px; color: rgb(51, 51, 51); font-size: 13px; line-height: =
19.006000518798828px; font-family: sans-serif !important;" class=3D"">And =
if not, is there a safe way to achieve this or is it just not possible =
to spin down disks in a lvm.</div><div style=3D"border: 0px; margin: =
0px; padding: 7px 0px; color: rgb(51, 51, 51); font-size: 13px; =
line-height: 19.006000518798828px; font-family: sans-serif !important;" =
class=3D"">I would be grateful of any advice you could offer. I have =
spent some time searching around for some information on this &amp; i =
can not find any documented on this anywhere.</div><div style=3D"border: =
0px; margin: 0px; padding: 7px 0px; color: rgb(51, 51, 51); font-size: =
13px; line-height: 19.006000518798828px; font-family: sans-serif =
!important;" class=3D"">Thanks,</div><div style=3D"border: 0px; margin: =
0px; padding: 7px 0px; color: rgb(51, 51, 51); font-size: 13px; =
line-height: 19.006000518798828px; font-family: sans-serif !important;" =
class=3D"">Kind regards,</div><div style=3D"border: 0px; margin: 0px; =
padding: 7px 0px; color: rgb(51, 51, 51); font-size: 13px; line-height: =
19.006000518798828px; font-family: sans-serif !important;" =
class=3D"">Drew</div></body></html>=

--Apple-Mail=_F4B31A39-FAEA-48C1-89C7-2F99158AA573--
