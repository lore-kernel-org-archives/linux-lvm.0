Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9C97Nkq007104
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 05:07:23 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.179])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9C97F8r009136
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 05:07:15 -0400
Received: by py-out-1112.google.com with SMTP id 57so549720pya
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 02:07:10 -0700 (PDT)
Message-ID: <88134f8b0610120207g4faaa0f2q27fc86f368a90fac@mail.gmail.com>
Date: Thu, 12 Oct 2006 11:07:10 +0200
From: "Olivier Verloove" <olivier.verloove@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_40270_25375555.1160644030264"
Subject: [linux-lvm] Mounting hardware snapshots/clones on the same host ?
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

------=_Part_40270_25375555.1160644030264
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I've seen this question a few times in the archives but without any answer.

Is there a way to activate/mount a copy of a volume group taken with a
disk-array based point-in-time copy on the same host ?

The
issue is that the disk-array based software will copy all information on
the disk including PVID/VGID's which is confusing for Linux's LVM.

Special tools are available on other platforms (vgchgid on HP-UX, recreatevg
on AIX) for this purpose.

Thanks in advance.

Best regards,
Olivier

------=_Part_40270_25375555.1160644030264
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,<br><br>I've seen this question a few times in the archives but without any answer.<br><br>Is there a way to activate/mount a copy of a volume group taken with a disk-array based point-in-time copy on the same host ?
<br><br>The issue&nbsp;is&nbsp;that&nbsp;the&nbsp;disk-array&nbsp;based&nbsp;software&nbsp;will&nbsp;copy&nbsp;all&nbsp;information&nbsp;on&nbsp;<br>the&nbsp;disk&nbsp;including&nbsp;PVID/VGID's which is confusing for Linux's LVM.<br> <br>Special tools are available on other platforms (vgchgid on HP-UX, recreatevg on AIX)&nbsp;for&nbsp;this&nbsp;purpose.
<br> <br>Thanks in advance.<br><br>Best regards,<br>Olivier<br>

------=_Part_40270_25375555.1160644030264--
