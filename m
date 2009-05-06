Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n46Nrqub030009
	for <linux-lvm@redhat.com>; Wed, 6 May 2009 19:53:52 -0400
Received: from yx-out-2324.google.com (yx-out-2324.google.com [74.125.44.28])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n46NrdNH016795
	for <linux-lvm@redhat.com>; Wed, 6 May 2009 19:53:39 -0400
Received: by yx-out-2324.google.com with SMTP id 8so230974yxg.81
	for <linux-lvm@redhat.com>; Wed, 06 May 2009 16:53:39 -0700 (PDT)
MIME-Version: 1.0
Sender: jgspratt@gmail.com
Date: Wed, 6 May 2009 16:53:39 -0700
Message-ID: <1f04f6fa0905061653k57d9bc8ekc0e55f809e98126a@mail.gmail.com>
From: Gordon Fogus <gordon.fogus@gmail.com>
Content-Type: multipart/alternative; boundary=001e680f1bb8c24f260469471a28
Subject: [linux-lvm] LVM and Truecrypt
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

--001e680f1bb8c24f260469471a28
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello all,

I am trying to create a 10TB network share (like a NAS share, but with
permission levels) on a dedicated GNU+Linux server to be used on a
Linux/Windows network.

I must use truecrypt for full drive encryption.
I need the disks to be independently mountable (no striping, parity bits or
files spanning across physical drives) (this is because I am afraid of
massive data loss from a mainboard failure.  If you can show me that this
fear is unfounded and that I would definitely be able to recover my data
after a mainboard failure, then I would not hesitate to use files spanning
across drives).
Most importantly, the combined space of the disks (10TB) must appear as 10TB
on the network, not 10 @ 1TB drives (if I were using 1TB drives, for
example).
Resonable continuous write speed is also a factor for me.
It is essential that this drive space can be "mounted" (i.e., "mount network
drive") on a Windows machine.
Different folders must be able to have different permissionn levels for
different users, similar to the permission levels available in Microsoft
shares (write new files/edit files/delete files/make new folders/delete
folders/etc.).  After someone connects to the file server, he must not be
able to access every file, only those specificly shared to him.

Can someone point me to info on using truecrypt with LVM?

(I am new to GNU+Linux.  File serving on a Windows Active Directory server
is... unpredictable.)

Gordon

--001e680f1bb8c24f260469471a28
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello all,<br><br>I am trying to create a 10TB network share (like a NAS sh=
are, but with permission levels) on a dedicated GNU+Linux server to be used=
 on a Linux/Windows network.<br><br>I must use truecrypt for full drive enc=
ryption.=A0 <br>
I need the disks to be independently mountable (no striping, parity bits or=
 files spanning across physical drives) (this is because I am afraid of mas=
sive data loss from a mainboard failure.=A0 If you can show me that this fe=
ar is unfounded and that I would definitely be able to recover my data afte=
r a mainboard failure, then I would not hesitate to use files spanning acro=
ss drives).=A0 <br>
Most importantly, the combined space of the disks (10TB) must appear as 10T=
B on the network, not 10 @ 1TB drives (if I were using 1TB drives, for exam=
ple).=A0 <br>Resonable continuous write speed is also a factor for me.<br>
It is essential that this drive space can be &quot;mounted&quot; (i.e., &qu=
ot;mount network drive&quot;) on a Windows machine.<br>Different folders mu=
st be able to have different permissionn levels for different users, simila=
r to the permission levels available in Microsoft shares (write new files/e=
dit files/delete files/make new folders/delete folders/etc.).=A0 After some=
one connects to the file server, he must not be able to access every file, =
only those specificly shared to him.<br>
<br>Can someone point me to info on using truecrypt with LVM?=A0 <br><br>(I=
 am new to GNU+Linux.=A0 File serving on a Windows Active Directory server =
is... unpredictable.)<br><br>Gordon<br>

--001e680f1bb8c24f260469471a28--
