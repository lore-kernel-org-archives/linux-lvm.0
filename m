Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBGLKer06948
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 16:20:40 -0500
Received: from kumc-smtpout.kumc.edu (kumc-smtpout.kumc.edu [169.147.4.11])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBGLKT3Z020692
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 16:20:29 -0500
Message-Id: <s1c1a7b7.076@kumc-smtpout.kumc.edu>
Date: Thu, 16 Dec 2004 15:20:07 -0600
From: "Nicoya Helm" <NHELM2@kumc.edu>
Subject: RE: [linux-lvm] How to increase/decrease space
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

>>> AdabalaP@schneider.com 12/16/04 2:05 PM >>> 
>Thanks Nicoya. I was successfully able to increase the size of the
"/usr"
>file system, By using "resize2fs" command.

>Now, that i am able to increase the FS size, how do i go about
reducing the
>FS size with out the data loss, especially with "/" file system ?

That part I don't have experience with, but obviously the first step is
to reduce the amount of actual data on the FS so that it is less than
the size you want to shrink it to. If you are using LVM 1, you can use
e2fsadm to shrink the LV and the FS in one step, but there is no e2fsadm
for LVM2 .  For LVM 2 you have to do the 2-step resize2fs and lvreduce
as described in this post to another list:

http://www.balug.org/pipermail/balug-talk/2002-April/000310.html 

>While increasing the space on a LV, Do i need to do lvresize,
lvextend,
>resize2fs or just lvextend and resize2fs ?

You should only need to do lvresize _or_ lvextend, then resize2fs.  



Nicoya Helm
Project Manager, Network Services
University of Kansas Medical Center
nhelm2@kumc.edu
