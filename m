Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9I8e0ct013577
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2007 04:40:00 -0400
Received: from post.berlin.i-dmedia.com (post.berlin.i-dmedia.com
	[62.159.214.250])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9I8dxjh027899
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2007 04:39:59 -0400
Received: from localhost (localhost [127.0.0.1])
	by post.berlin.i-dmedia.com (Postfix) with ESMTP id 9989B2F1B5
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2007 10:40:10 +0200 (CEST)
Received: from post.berlin.i-dmedia.com ([127.0.0.1])
	by localhost (post.berlin.i-dmedia.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id OTdN6RrKh5Fz for <linux-lvm@redhat.com>;
	Thu, 18 Oct 2007 10:40:09 +0200 (CEST)
Received: from x1.ads.i-dmedia.com (x1.berlin.i-dmedia.com [10.1.69.45])
	by post.berlin.i-dmedia.com (Postfix) with ESMTP id 393872F1B4
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2007 10:40:09 +0200 (CEST)
Message-ID: <47171BD6.3090709@idmedia.com>
Date: Thu, 18 Oct 2007 10:39:50 +0200
From: Falko Zurell <falko.zurell@idmedia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] very slow fw performance when snapshots active
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi List,

I have an actual CentOS Linux with LVM on hardware RAID1+0.

fs layout looks like this:

[root@C20-DB1-00 ~]# lvs
  LV     VG   Attr   LSize   Origin Snap%  Move Log Copy%
  LVOpt  VG0  -wi-ao 300.00G
  LVRoot VG0  -wi-ao  43.94G
  LVSwap VG0  -wi-ao  23.44G

Then I create a snapshot vor VG0/LVOpt with 40 GB size.

Then I edit a 2 GB text file on /opt (XFS filesystem) with vi (just
hitting "enter" and save this minor change). This will take minutes to
finish the vi during saving.
I see the kcopyd in the process list which fills up the snapshot.

When the snapshot is off then saving the same file with the same minor
change will take only seconds.

I understand that snapshots are copy-on-write. But I can't explain why
this takes minutes for a 2 GB file which has changed only in a few bytes.

Shouldn't only the changed blocks be copied to the snapshot space? Even
if only whole PEs are copied then it shouldn't take only seconds to copy
to the snapshot.

- From the actual point of view activating snapshots on this database
machine absolutly kills performance.

Did I something wrong on that?
- --

Falko Zurell
Skype: zero_data
/i-d media AG
Ohlauer Stra=EF=BF=BDe 43
D-10999 Berlin

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHFxvWsdVNK8p2VTARArgkAJ9KK9hpQBH6gxhzMQiYdZMH87Q0GwCgwOSy
w9tcXzNveVWCnTfB4EO5bKU=3D
=3Du+DI
-----END PGP SIGNATURE-----
