Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n94HBPmZ018051
	for <linux-lvm@redhat.com>; Sun, 4 Oct 2009 13:11:25 -0400
Received: from smtp2b.orange.fr (smtp2b.orange.fr [80.12.242.144])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n94HBDPj012343
	for <linux-lvm@redhat.com>; Sun, 4 Oct 2009 13:11:13 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2b29.orange.fr (SMTP Server) with ESMTP id DE3477000083
	for <linux-lvm@redhat.com>; Sun,  4 Oct 2009 19:11:12 +0200 (CEST)
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2b29.orange.fr (SMTP Server) with ESMTP id D26677000088
	for <linux-lvm@redhat.com>; Sun,  4 Oct 2009 19:11:12 +0200 (CEST)
Received: from gillibert.homelinux.net
	(ACaen-251-1-56-4.w83-115.abo.wanadoo.fr [83.115.198.4])
	by mwinf2b29.orange.fr (SMTP Server) with ESMTP id 91E8E7000083
	for <linux-lvm@redhat.com>; Sun,  4 Oct 2009 19:11:12 +0200 (CEST)
Received: from fixlaptop ([192.168.1.209]
	helo=fixlaptop.gillibert.homelinux.net)
	by gillibert.homelinux.net with esmtp (Exim 4.69)
	(envelope-from <rcvxdg@gmail.com>) id 1MuU9j-0005Sr-UX
	for linux-lvm@redhat.com; Sun, 04 Oct 2009 18:41:55 +0200
Date: Sun, 4 Oct 2009 19:11:06 +0200
From: =?UTF-8?B?QW5kcsOp?= Gillibert <rcvxdg@gmail.com>
Subject: Re: [linux-lvm] Unmounting file system hangs up...
Message-ID: <20091004191106.08a50ebf@fixlaptop.gillibert.homelinux.net>
In-Reply-To: <f6d6a910910040823lffdc70fkff4d2e4a15d49349@mail.gmail.com>
References: <f6d6a910910040718n6286e9c1t3ae507cde17bc4bf@mail.gmail.com>
	<20091004163835.3b5dffec@fixlaptop.gillibert.homelinux.net>
	<f6d6a910910040823lffdc70fkff4d2e4a15d49349@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Thinking Outside the Well <rod.rook@gmail.com> wrote:

> I agree you are right on your suggestion that Fedora is trying to umount a
> network file system. I think it actually is trying to umount a CentOS file
> system installed in another hard drive. The reason why I think that way is
> that whenever I log on to CentOS, it complains that something is wrong wi=
th
> the file system and checks it
>=20
Not properly unmounting a network (NFS, CIFS, etc.) mount point shouldn't b=
reak the target file system in any way, and shouldn't cause fsck to report =
errors.
Is CentOS hard drive on another computer?
In that case, what network file system protocol is used, if any?
If it's local hard drive, then, it's probably mounted as local file system =
(ext3 or other), and, not properly unmounting it, may cause fsck to complai=
n.

The contents of /etc/fstab and /etc/mtab or /proc/mounts may help you.

fstab contains a static list of fs mounted at boot time.
mtab and /proc/mounts contain the list of currently mounted file systems, i=
ncluding ones that might have been automatically mounted by your desktop en=
vironment when HAL notified it.

--=20
Andr=C3=A9 Gillibert
