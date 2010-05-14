Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4EBX4nn000435
	for <linux-lvm@redhat.com>; Fri, 14 May 2010 07:33:04 -0400
Received: from november.openminds.be (november.openminds.be [195.47.215.47])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4EBWnAB024469
	for <linux-lvm@redhat.com>; Fri, 14 May 2010 07:32:49 -0400
Received: from bugoff-laptop.openminds.be (d51A4F555.access.telenet.be
	[81.164.245.85])
	by november.openminds.be (Postfix) with ESMTP id ACC1D11DF426
	for <linux-lvm@redhat.com>; Fri, 14 May 2010 13:32:47 +0200 (CEST)
From: Bram Gillemon <bram@x-plose.be>
Content-Type: multipart/alternative; boundary=Apple-Mail-12--823175963
Date: Fri, 14 May 2010 13:32:47 +0200
Message-Id: <1628AF8F-F9D2-4984-A081-903512E711E3@x-plose.be>
Mime-Version: 1.0 (Apple Message framework v1078)
Subject: [linux-lvm] lvm + dmmapper on a 2.6.32.10 kernel
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


--Apple-Mail-12--823175963
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

I'm having some problems with lvm + dmmapper on my own compiled =
2.6.32.10 kernel, I'm not sure if the problem is with dmmapper or with =
my kernel, so i hope someone can help me or point me into the right =
direction.

When I try to create a lvm volume i recieve the following error:

bram-PC:~# lvcreate -L 10485760k -n test5-root xendomains
 device-mapper: table ioctl failed: No such device or address
 Aborting. Failed to activate new LV to wipe the start of it.

Sometimes it works to create a lvm volume, but when i try to create a =
mapper on the device i recieve errors like this:

bram-PC:~# echo "0 $( blockdev --getsize /dev/xendomains/test-root ) =
linear /dev/xendomains/test-root 0" | dmsetup create test-root-dm
/dev/xendomains/test-root: No such file or directory
Invalid format on line 1 of table on stdin
Command failed


and dmesg tells me:

[29955.397572] device-mapper: ioctl: device doesn't appear to be in the =
dev hash table.


The reason i build my own kernel is i want to run xen 4.0, my config is =
available on pastebin:

http://pastebin.com/T6ntfKme


I compiled dmmapper as a module or built-in i always have these errors.

I know i don't have much info to post here cause i don't have any idea =
what you need to know, just ask and i'll post it :)

Can someone help me to find a solution to this problem, or help me to =
build a bug report (if it's a bug ;) )

Kr,
Bram

--Apple-Mail-12--823175963
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
">Hi,<br><br>I'm having some problems with lvm + dmmapper on my own =
compiled 2.6.32.10 kernel, I'm not sure if the problem is with dmmapper =
or with my kernel, so i hope someone can help me or point me into the =
right direction.<br><br>When I try to create a lvm volume i recieve the =
following error:<br><br>bram-PC:~# lvcreate -L 10485760k -n test5-root =
xendomains<br>&nbsp;device-mapper: table ioctl failed: No such device or =
address<br>&nbsp;Aborting. Failed to activate new LV to wipe the start =
of it.<br><br>Sometimes it works to create a lvm volume, but when i try =
to create a mapper on the device i recieve errors like =
this:<br><br>bram-PC:~# echo "0 $( blockdev --getsize =
/dev/xendomains/test-root ) linear /dev/xendomains/test-root 0" | =
dmsetup create test-root-dm<br>/dev/xendomains/test-root: No such file =
or directory<br>Invalid format on line 1 of table on stdin<br>Command =
failed<br><br><br>and dmesg tells me:<br><br>[29955.397572] =
device-mapper: ioctl: device doesn't appear to be in the dev hash =
table.<br><br><br>The reason i build my own kernel is i want to run xen =
4.0, my config is available on pastebin:<br><br><a =
href=3D"http://pastebin.com/T6ntfKme">http://pastebin.com/T6ntfKme</a><br>=
<br><br>I compiled dmmapper as a module or built-in i always have these =
errors.<br><br>I know i don't have much info to post here cause i don't =
have any idea what you need to know, just ask and i'll post it =
:)<br><br>Can someone help me to find a solution to this problem, or =
help me to build a bug report (if it's a bug ;) =
)<br><br>Kr,<br>Bram<br></body></html>=

--Apple-Mail-12--823175963--
