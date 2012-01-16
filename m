Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q0GDM18S022323
	for <linux-lvm@redhat.com>; Mon, 16 Jan 2012 08:22:01 -0500
Received: from mail-lpp01m010-f46.google.com (mail-lpp01m010-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0GDM0dw021363
	for <linux-lvm@redhat.com>; Mon, 16 Jan 2012 08:22:01 -0500
Received: by lahc1 with SMTP id c1so1188033lah.33
	for <linux-lvm@redhat.com>; Mon, 16 Jan 2012 05:21:59 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 16 Jan 2012 18:51:59 +0530
Message-ID: <CALe_PVkSZD-ij5D7HQiKoL=obeQMuV3ZnJfd9f_1rocFdkt71A@mail.gmail.com>
From: Kiran Rao <techie.curious@gmail.com>
Content-Type: multipart/alternative; boundary=f46d040169897622a204b6a51992
Subject: [linux-lvm] Resizing a logical volume which is mounted (at /home)
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

--f46d040169897622a204b6a51992
Content-Type: text/plain; charset=ISO-8859-1

To start off, here's an overview of my configuration. I'm dual-booting
Windows XP and Fedora Core 16. When I installed FC 16, here's how I created
the partitions:

1) Volume Group (vg_me) - ~73 GB

Out of this, the following are the logical volumes:
a) lvhome (mount point - /home) - ~48GB
b) lvroot (mount point - /) ~10GB
c) lvvar (mount point - /var) ~15GB

So, there's no free space left on the volume group.

Now, I feel the 48GB is not really necessary for the /home. I want to
redistribute the space among the 3 logical volumes within this VG, or
create a new one (/tech).  In either case, I want to take the additional
space (around 20GB) from lvhome and give it to either / or to /tech.

Now, I tried the GUI (system-config-lvm) tool to do this. I can click on
lvhome and try to resize it. However, the problem is that since I am logged
in as a non-root user, the /home is mounted. Resizing requires one to
unmount it, but the unmount operation fails since I am mounted.

How do I work around this?

--f46d040169897622a204b6a51992
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

To start off, here&#39;s an overview of my configuration. I&#39;m dual-boot=
ing=20
Windows XP and Fedora Core 16. When I installed FC 16, here&#39;s how I=20
created the partitions:<br><br>1) Volume Group (vg_me) - ~73 GB<br><br>
Out of this, the following are the logical volumes:<br>a) lvhome (mount poi=
nt - /home) - ~48GB<br>b) lvroot (mount point - /) ~10GB<br>c) lvvar (mount=
 point - /var) ~15GB<br><br>So, there&#39;s no free space left on the volum=
e group.<br>

<br>Now, I feel the 48GB is not really necessary for the /home. I want=20
to redistribute the space among the 3 logical volumes within this VG, or
 create a new one (/tech).=A0 In either case, I want to take the=20
additional space (around 20GB) from lvhome and give it to either / or to
 /tech.<br>
<br>Now, I tried the GUI (system-config-lvm) tool to do this. I can=20
click on lvhome and try to resize it. However, the problem is that since
 I am logged in as a non-root user, the /home is mounted. Resizing=20
requires one to unmount it, but the unmount operation fails since I am=20
mounted.<br>
<br>How do I work around this?

--f46d040169897622a204b6a51992--
