Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n42H0lEk021188
	for <linux-lvm@redhat.com>; Sat, 2 May 2009 13:00:47 -0400
Received: from out1.smtp.messagingengine.com (out1.smtp.messagingengine.com
	[66.111.4.25])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n42H0Nwn021732
	for <linux-lvm@redhat.com>; Sat, 2 May 2009 13:00:23 -0400
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 21FC8339090
	for <linux-lvm@redhat.com>; Sat,  2 May 2009 13:00:23 -0400 (EDT)
Received: from [190.55.205.114] (unknown [190.55.205.114])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 88260592DC
	for <linux-lvm@redhat.com>; Sat,  2 May 2009 13:00:22 -0400 (EDT)
Message-ID: <49FC7C24.6030702@fastmail.fm>
Date: Sat, 02 May 2009 14:00:20 -0300
From: sebastian muniz <sjmuniz@fastmail.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] lvm ownership of special access node
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Hello list.
First post. Sorry  if this has already been discussed. I have search a=20
while with no luck.
I need to mount a home directory for a user from a lvolume.
For instance, I created
  ACTIVE            '/dev/vg1/sebahome' [5.00 GB] inherit

and need it mounted on /home/seba
However, when I mount it on /home/seba permissions get root:root

orion:~# ls -ld /home/seba
drwxr-xr-x 4 root root 4096 2009-05-02 02:34 /home/seba

I think that

seba@orion:~$ ls -la /dev/vg1/sebahome
lrwxrwxrwx 1 root root 24 2009-05-02 04:25 /dev/vg1/sebahome ->=20
/dev/mapper/vg1-sebahome
seba@orion:~$ ls -la /dev/mapper/vg1-sebahome
brw-rw---- 1 root disk 254, 3 2009-05-02 04:25 /dev/mapper/vg1-sebahome

is the reason.
Is there any way to create the special access node with other owner:group
like the
vxassist --user --group in veritas?
Or is there any mount option I am now aware of?

Thanks in advance,
Sebastian Mu=EF=BF=BDiz
