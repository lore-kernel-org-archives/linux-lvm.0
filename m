Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k998Bhtm018963
	for <linux-lvm@redhat.com>; Mon, 9 Oct 2006 04:11:43 -0400
Received: from bay0-omc1-s31.bay0.hotmail.com (bay0-omc1-s31.bay0.hotmail.com
	[65.54.246.103])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k998BbWO025101
	for <linux-lvm@redhat.com>; Mon, 9 Oct 2006 04:11:37 -0400
Message-ID: <BAY122-F341CBA1207CBA2BCB8EB090160@phx.gbl>
From: "Sundeep Saini" <sundeep_saini@hotmail.com>
Date: Mon, 09 Oct 2006 13:41:18 +0530
Mime-Version: 1.0
Subject: [linux-lvm] Linux LVM Physical Layout Structure
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
Content-Type: text/html; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

<html><div style='background-color:'><DIV class=RTE>
<P><BR>HI,<BR>I have a query about the physical layout of the LVM. Using some hexeditor i tried to find out the VGDA structure. But i am not getting any specific structure at starting of PV.<BR>As The Volume Group Descriptor Area (VGDA) functions similar to the partition table for LVM. It is stored at the beginning at the beginning of each physical volume.&nbsp; </P>
<P>Earlier i worked on HP-UX LVM and i read that i impementation of LVM is similar in both.</P>
<P>I want to get the information of the PE map and if i extend some LV and create 2-3 segments then how i will be able to know the PE chain.</P>
<P>I got some structure on HDD that contain some ASCII values as the output of #lvdisplay ot vgdisplay</P>
<P>Please give some guidance to find the internal layout of LVM on HDD.</P>
<P>Thanks in Advance<BR><BR></P>
<DIV></DIV><FONT color=#000000></DIV>
<DIV></DIV></FONT></div></html>
