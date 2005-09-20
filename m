Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8KKDtV19991
	for <linux-lvm@redhat.com>; Tue, 20 Sep 2005 16:13:55 -0400
Received: from mail4.mckesson.com (mail4.mckesson.com [143.112.129.39])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8KKDqxi020585
	for <linux-lvm@redhat.com>; Tue, 20 Sep 2005 16:13:52 -0400
From: "Allen, Jack" <Jack.Allen@McKesson.com>
Message-ID: <C28DB247D333BC47BBAAFDC914DE39010261F5D6@atlexc07ntms.mckesson.com>
Date: Tue, 20 Sep 2005 16:14:25 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C5BE1F.E58077B4"
Subject: [linux-lvm] Directly using a logical volume
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
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C5BE1F.E58077B4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

        I have a system connected to a SAN via Fibre Channel interface.
The system sees 3 disk sdb, sdc and sdd. I put them in a volume group
and then allocated some logical volumes. If I use the logical volume to
read and write to directly for my application, if there is an error on a
write, I assume the write system call will return an error. Or does the
write give a good return value after putting the data in some system
buffer to be written later? Then is the write of the system buffer fails
later, my program would not know.

Thanks: 
        Jack Allen 


------_=_NextPart_001_01C5BE1F.E58077B4
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>

<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2658.2">
<TITLE>Directly using a logical volume</TITLE>
</HEAD>
<BODY>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">I have a system connected to a SAN via Fibre Channel =
interface. The system sees 3 disk sdb, sdc and sdd. I put them in a =
volume group and then allocated some logical volumes. If I use the =
logical volume to read and write to directly for my application, if =
there is an error on a write, I assume the write system call will =
return an error. Or does the write give a good return value after =
putting the data in some system buffer to be written later? Then is the =
write of the system buffer fails later, my program would not =
know.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thanks:</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">Jack Allen</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C5BE1F.E58077B4--
