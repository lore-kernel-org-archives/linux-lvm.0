Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAF2c6KK030966
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 21:38:06 -0500
Received: from web38301.mail.mud.yahoo.com (web38301.mail.mud.yahoo.com
	[209.191.125.17])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id mAF2bqPe009004
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 21:37:52 -0500
Date: Fri, 14 Nov 2008 18:37:51 -0800 (PST)
From: Michael Jensen <beachhangar@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-558339160-1226716671=:96084"
Message-ID: <878853.96084.qm@web38301.mail.mud.yahoo.com>
Subject: [linux-lvm] Editing LVM 2 metadata
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

--0-558339160-1226716671=:96084
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

I have a need to edit the metadata on an LVM2 PV.=A0 It is a storage manage=
d snapshot of a LVM VG.=0A=0AIt appears I can alter the metadata contents t=
hat are in the first 128KB of the device (/dev/sda) using dd and vi.=0A=0AH=
owever, after I edited the LABELONE area where the binary copy of the PV UU=
ID is stored (200x offset area) and the ASCII version at 12b0x and 16b0x an=
d reboot - vgscan no longer recognizes the VG.=0A=0AQuestion - are all the =
UUID's - VG, LV, PV generated as a self-check hash to ensure they haven't b=
een bit-picked or otherwise compromised by the storage??=0A=0AI have downlo=
aded the source, but am not sure yet where to find the code that generates =
the UUID strings.=0A=0AThanks,=0AMike=0A=0A=0A      
--0-558339160-1226716671=:96084
Content-Type: text/html; charset=us-ascii

<html><head><style type="text/css"><!-- DIV {margin:0px;} --></style></head><body><div style="font-family:times new roman, new york, times, serif;font-size:12pt"><DIV>I have a need to edit the metadata on an LVM2 PV.&nbsp; It is a storage managed snapshot of a LVM VG.</DIV>
<DIV>&nbsp;</DIV>
<DIV>It appears I can alter the metadata contents that are in the first 128KB of the device (/dev/sda) using dd and vi.</DIV>
<DIV>&nbsp;</DIV>
<DIV>However, after I edited the LABELONE area where the binary copy of the PV UUID is stored (200x offset area) and the ASCII version at 12b0x and 16b0x and reboot - vgscan no longer recognizes the VG.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Question - are all the UUID's - VG, LV, PV generated as a self-check hash to ensure they haven't been bit-picked or otherwise compromised by the storage??</DIV>
<DIV>&nbsp;</DIV>
<DIV>I have downloaded the source, but am not sure yet where to find the code that generates the UUID strings.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks,</DIV>
<DIV>Mike</DIV></div><br>

      </body></html>
--0-558339160-1226716671=:96084--
