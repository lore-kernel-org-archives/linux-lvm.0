Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p3CExPRJ015472
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 10:59:25 -0400
Received: from mail-iw0-f200.google.com (mail-iw0-f200.google.com
	[209.85.214.200])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3CExL6C013575
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 10:59:21 -0400
Received: by iwn3 with SMTP id 3so14074337iwn.3
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 07:59:21 -0700 (PDT)
MIME-Version: 1.0
Message-ID: <90e6ba6e8bdee982de04a0b9ef92@google.com>
Date: Tue, 12 Apr 2011 14:59:21 +0000
From: DarkNovaNick@gmail.com
Content-Type: multipart/alternative; boundary=90e6ba6e8bdee982d304a0b9ef8f
Subject: [linux-lvm] Testing TRIM with LVM
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

--90e6ba6e8bdee982d304a0b9ef8f
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes

I recently purchased a Crucial C300 SSD and set it up as my primary drive.  
I wanted to use LVM, and my reading indicates that LVM added support to  
pass-through TRIM commands with kernel 2.6.37. I'm running Ubuntu 10.10,  
but I installed the latest 11.04 kernel, so I'm running kernel 2.6.38-8. I  
added "discard" to fstab so my mountpoint looks like:

/dev/mapper/vg0-vol0 on / type ext4  
(rw,noatime,nodiratime,errors=remount-ro,discard,commit=0)

I found directions on various sites like:
http://duopetalflower.blogspot.com/2010/11/enterprise-kernel-6-has-ssd-trim.html
on how to confirm if TRIM is working. I ran (as root):

dd if=/dev/urandom of=tempfile count=100 bs=512k oflag=direct
hdparm --fibmap tempfile
(then took the first begin_LBA)
hdparm --read-sector 191710208 /dev/sda

and it printed:

/dev/sda:
reading sector 191710208: succeeded
3254 3a32 3834 313a 2b36 3030 303a 2030
4544 5542 2047 3728 3a29 5320 7661 6e69
2067 6e69 6564 2078 6f66 2072 7270 646f
............

Then I ran:
rm tempfile
sync
hdparm --read-sector 191710208 /dev/sda

and it still returned:
/dev/sda:
reading sector 191710208: succeeded
3254 3a32 3834 313a 2b36 3030 303a 2030
4544 5542 2047 3728 3a29 5320 7661 6e69
2067 6e69 6564 2078 6f66 2072 7270 646f
.............

If TRIM is working, the sector is supposed to contain all zeros.

Am I doing something wrong or do I need to do something more to get LVM to  
pass down the TRIM command?

Nick

--90e6ba6e8bdee982d304a0b9ef8f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I recently purchased a Crucial C300 SSD and set it up as my primary drive. =
I wanted to use LVM, and my reading indicates that LVM added support to pas=
s-through TRIM commands with kernel 2.6.37. I&#39;m running Ubuntu 10.10, b=
ut I installed the latest 11.04 kernel, so I&#39;m running kernel 2.6.38-8.=
 I added &quot;discard&quot; to fstab so my mountpoint looks like:<br /><br=
 />/dev/mapper/vg0-vol0 on / type ext4 (rw,noatime,nodiratime,errors=3Dremo=
unt-ro,discard,commit=3D0)<br /><br />I found directions on various sites l=
ike:<br />http://duopetalflower.blogspot.com/2010/11/enterprise-kernel-6-ha=
s-ssd-trim.html<br />on how to confirm if TRIM is working. I ran (as root):=
<br /><br />dd if=3D/dev/urandom of=3Dtempfile count=3D100 bs=3D512k oflag=
=3Ddirect<br />hdparm --fibmap tempfile<br />(then took the first begin_LBA=
)<br />hdparm --read-sector 191710208 /dev/sda<br /><br />and it printed:<b=
r /><br />/dev/sda:<br />reading sector 191710208: succeeded<br />3254 3a32=
 3834 313a 2b36 3030 303a 2030<br />4544 5542 2047 3728 3a29 5320 7661 6e69=
<br />2067 6e69 6564 2078 6f66 2072 7270 646f<br />............<br /><br />=
Then I ran:<br />rm tempfile<br />sync<br />hdparm --read-sector 191710208 =
/dev/sda<br /><br />and it still returned:<br />/dev/sda:<br />reading sect=
or 191710208: succeeded<br />3254 3a32 3834 313a 2b36 3030 303a 2030<br />4=
544 5542 2047 3728 3a29 5320 7661 6e69<br />2067 6e69 6564 2078 6f66 2072 7=
270 646f<br />.............<br /><br />If TRIM is working, the sector is su=
pposed to contain all zeros.<br /><br />Am I doing something wrong or do I =
need to do something more to get LVM to pass down the TRIM command?<br /><b=
r />Nick
--90e6ba6e8bdee982d304a0b9ef8f--
