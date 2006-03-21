Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2LIXSe3017299
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2006 13:33:28 -0500
Received: from linux.interlinx.bc.ca (linux.interlinx.bc.ca [66.11.173.224])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2LIXQe6027333
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2006 13:33:26 -0500
Received: from pc.ilinx (pc.ilinx [10.75.22.1])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by linux.interlinx.bc.ca (Postfix) with ESMTP id DE31ED5CD0
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2006 13:33:24 -0500 (EST)
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-p12D78GtUw4Ha9YQTb2M"
Date: Tue, 21 Mar 2006 13:33:24 -0500
Message-Id: <1142966004.18275.35.camel@pc>
Mime-Version: 1.0
Subject: [linux-lvm] snapshots filling and hanging up processes
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--=-p12D78GtUw4Ha9YQTb2M
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I am using LVM2 on FC4 (2.6.15-1.1831_FC4smp) and snapshots.  The
problem seems to be that when a snapshot fills up it craps out.  Trying
to extend it ends up hanging the lvextend process and a reboot is
needed.  After which though the snapshot is corrupted beyond repair.

While hung, lvextend's stack trace looks like:

lvextend      D ffff8100d1b00050     0 14786   7501               18185 (NO=
TLB)
ffff810105b7fc68 0000000000000086 ffff8101115afc00 ffffffff8016594c
       0000000000000000 0000000000000000 ffff81011748cbe8 0000000000000000
       0000000000000000 000000000001facf
Call Trace:<ffffffff8016594c>{wait_on_page_writeback_range+203}
       <ffffffff8806b694>{:dm_mod:dev_suspend+0} <ffffffff801650c7>{__filem=
ap_fdatawrite_range+87}
       <ffffffff8806b694>{:dm_mod:dev_suspend+0} <ffffffff80357567>{__down_=
write+137}
       <ffffffff88067c0f>{:dm_mod:dm_suspend+368} <ffffffff80137e56>{defaul=
t_wake_function+0}
       <ffffffff8035746c>{__down_read+50} <ffffffff8806b694>{:dm_mod:dev_su=
spend+0}
       <ffffffff8806b7b0>{:dm_mod:dev_suspend+284} <ffffffff8806a68c>{:dm_m=
od:ctl_ioctl+536}
       <ffffffff8019c84e>{do_ioctl+94} <ffffffff8019caf2>{vfs_ioctl+649}
       <ffffffff8019cb66>{sys_ioctl+91} <ffffffff8010fc60>{tracesys+209}

Trying to look at the volume in this state yields:

    # /usr/sbin/lvdisplay /dev/vg0/centos4.2-i386-boulder
[ I have to hit INTR here]
      CTRL-c detected: giving up waiting for lock
      /var/lock/lvm/V_vg0: flock failed: Interrupted system call
      Can't lock vg0: skipping

Is this a known issue (in this kernel or otherwise)?  Is it fixed in a
later FC kernel like kernel-2.6.15-1.1833_FC4.x86_64.rpm  or
kernel-2.6.15-1.2054_FC5.x86_64.rpm?

Thots?

b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-p12D78GtUw4Ha9YQTb2M
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEIEb0l3EQlGLyuXARAq8AAJ9OEQZRpR4l1jTYsP7qYXSr8iNxzwCgtmrI
3ly0nBGWhbIeWoT/qTrqrNs=
=gYPf
-----END PGP SIGNATURE-----

--=-p12D78GtUw4Ha9YQTb2M--
