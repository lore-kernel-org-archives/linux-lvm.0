Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBSFpm5A015726
	for <linux-lvm@redhat.com>; Fri, 28 Dec 2007 10:51:48 -0500
Received: from nz-out-0506.google.com (nz-out-0506.google.com [64.233.162.233])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBSFpRUY000677
	for <linux-lvm@redhat.com>; Fri, 28 Dec 2007 10:51:27 -0500
Received: by nz-out-0506.google.com with SMTP id r28so811312nza.36
	for <linux-lvm@redhat.com>; Fri, 28 Dec 2007 07:51:27 -0800 (PST)
Message-ID: <ae57fafd0712280751j65abea1fl6641b20f7bd94609@mail.gmail.com>
Date: Fri, 28 Dec 2007 10:51:26 -0500
From: "Reuben Budiardja" <reubendb@organizedhacks.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_11342_11267599.1198857086639"
Subject: [linux-lvm] File Descriptor left open message
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

------=_Part_11342_11267599.1198857086639
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,
I used to have LVM on my machine to combine the capacity of a hard drive and a
partition on a different drive as one volume group. I had problem with one of
the disk but I was able to remove all the data of the computer, and replace
the disk, and add another disk

Now I want to start over and create LVM again. However, I keep getting this
message:
# vgdisplay
File descriptor 128 left open
File descriptor 129 left open
  No volume groups found
# pvdisplay
File descriptor 128 left open
File descriptor 129 left open

What does this mean ? Also, in /etc/lvm I found archive/ and backup/ directory
which seems to refer to my old LVM, and also .cache. Are they safe to
remove ?

Thank you for any help.
RDB

------=_Part_11342_11267599.1198857086639
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<pre>Hello,<br>I used to have LVM on my machine to combine the capacity of a hard drive and a <br>partition on a different drive as one volume group. I had problem with one of <br>the disk but I was able to remove all the data of the computer, and replace 
<br>the disk, and add another disk<br><br>Now I want to start over and create LVM again. However, I keep getting this <br>message: <br># vgdisplay <br>File descriptor 128 left open<br>File descriptor 129 left open<br>  No volume groups found
<br># pvdisplay <br>File descriptor 128 left open<br>File descriptor 129 left open<br><br>What does this mean ? Also, in /etc/lvm I found archive/ and backup/ directory <br>which seems to refer to my old LVM, and also .cache. Are they safe to 
<br>remove ?<br><br>Thank you for any help.<br>RDB<br></pre>

------=_Part_11342_11267599.1198857086639--
