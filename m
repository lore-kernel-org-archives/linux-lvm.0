Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r6937Jx4024243
	for <linux-lvm@redhat.com>; Mon, 8 Jul 2013 23:07:19 -0400
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6937I4d024544
	for <linux-lvm@redhat.com>; Mon, 8 Jul 2013 23:07:18 -0400
Received: by mail-ve0-f179.google.com with SMTP id d10so4170101vea.24
	for <linux-lvm@redhat.com>; Mon, 08 Jul 2013 20:07:18 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 8 Jul 2013 23:07:18 -0400
Message-ID: <CAAksFbsN743ZFD9TOSAT=p582Ki0Wr-Z++Hd0m8uyVou=Z=Hmw@mail.gmail.com>
From: Jeffrey Forbes <piconewton@gmail.com>
Content-Type: multipart/alternative; boundary=20cf307c9f32742b4604e10b7545
Subject: [linux-lvm] LVM failure after upgrade to Fedora 19
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

--20cf307c9f32742b4604e10b7545
Content-Type: text/plain; charset=ISO-8859-1

I recently upgrade to Fedora 19 from 17. Fedup did not work correctly, so I
did a clean install on the system disk.
However, I have a data disk that is raid-1 and has a volume group and
logical volumes that were create under Fedora 17
and was not giving any errors. Now with Fedora 19 on mounting the logical
volume, the following errors are reported:

[  130.432660] Buffer I/O error on device dm-1, logical block 119570432
[  130.432664] lost page write due to I/O error on dm-1
[  130.432674] JBD2: Error -5 detected when updating journal superblock for
dm-1-8.
[  130.432701] Aborting journal on device dm-1-8.
[  130.432705] Buffer I/O error on device dm-1, logical block 119570432
[  130.432706] lost page write due to I/O error on dm-1
[  130.432708] JBD2: Error -5 detected when updating journal superblock for
dm-1-8.
[  218.261625] EXT4-fs (dm-1): previous I/O error to superblock detected
[  218.261640] Buffer I/O error on device dm-1, logical block 0
[  218.261642] lost page write due to I/O error on dm-1
[  218.261644] EXT4-fs error (device dm-1): __ext4_journal_start_sb:60:
Detected aborted journal
[  218.261647] EXT4-fs (dm-1): Remounting filesystem read-only
[  218.261649] EXT4-fs (dm-1): previous I/O error to superblock detected
[  218.261653] Buffer I/O error on device dm-1, logical block 0
[  218.261654] lost page write due to I/O error on dm-1


I don't think that this is a hardware problem as everything was working
fine before the upgrade to Fedora 19

Any suggestions are welcome.

Jeff

--20cf307c9f32742b4604e10b7545
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I recently upgrade to Fedora 19 from 17. Fedup did not work correctly, so I=
 did a clean install on the system disk.<br>However, I have a data disk tha=
t is raid-1 and has a volume group and logical volumes that were create und=
er Fedora 17<br>
and was not giving any errors. Now with Fedora 19 on mounting the logical v=
olume, the following errors are reported:<br><br>[=A0 130.432660] Buffer I/=
O error on device dm-1, logical block 119570432<br>[=A0 130.432664] lost pa=
ge write due to I/O error on dm-1<br>
[=A0 130.432674] JBD2: Error -5 detected when updating journal superblock f=
or dm-1-8.<br>[=A0 130.432701] Aborting journal on device dm-1-8.<br>[=A0 1=
30.432705] Buffer I/O error on device dm-1, logical block 119570432<br>[=A0=
 130.432706] lost page write due to I/O error on dm-1<br>
[=A0 130.432708] JBD2: Error -5 detected when updating journal superblock f=
or dm-1-8.<br>[=A0 218.261625] EXT4-fs (dm-1): previous I/O error to superb=
lock detected<br>[=A0 218.261640] Buffer I/O error on device dm-1, logical =
block 0<br>
[=A0 218.261642] lost page write due to I/O error on dm-1<br>[=A0 218.26164=
4] EXT4-fs error (device dm-1): __ext4_journal_start_sb:60: Detected aborte=
d journal<br>[=A0 218.261647] EXT4-fs (dm-1): Remounting filesystem read-on=
ly<br>
[=A0 218.261649] EXT4-fs (dm-1): previous I/O error to superblock detected<=
br>[=A0 218.261653] Buffer I/O error on device dm-1, logical block 0<br>[=
=A0 218.261654] lost page write due to I/O error on dm-1<br><br><br>I don&#=
39;t think that this is a hardware problem as everything was working fine b=
efore the upgrade to Fedora 19<br>
<br>Any suggestions are welcome.<br><br>Jeff <br>

--20cf307c9f32742b4604e10b7545--
