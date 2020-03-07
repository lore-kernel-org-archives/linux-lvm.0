Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 417E810031FC
	for <linux-lvm@redhat.com>; Sat,  7 Mar 2020 13:27:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B0A08007A4
	for <linux-lvm@redhat.com>; Sat,  7 Mar 2020 13:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail-mta.intra.vleo.net (Postfix) with ESMTP id 3D23FBFDE0
	for <linux-lvm@redhat.com>; Sat,  7 Mar 2020 14:27:19 +0100 (CET)
Received: from mail-mta.intra.vleo.net ([127.0.0.1])
	by localhost (mail-mta.intra.vleo.net [127.0.0.1]) (amavisd-new,
	port 10032) with ESMTP id LaCqjHG_gGFN for <linux-lvm@redhat.com>;
	Sat,  7 Mar 2020 14:27:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail-mta.intra.vleo.net (Postfix) with ESMTP id 9DDD8BFDE6
	for <linux-lvm@redhat.com>; Sat,  7 Mar 2020 14:27:18 +0100 (CET)
Received: from mail-mta.intra.vleo.net ([127.0.0.1])
	by localhost (mail-mta.intra.vleo.net [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id IMKK4c1fbuRK for <linux-lvm@redhat.com>;
	Sat,  7 Mar 2020 14:27:18 +0100 (CET)
Received: from [192.168.0.12] (unknown [78.10.207.83])
	by mail-mta.intra.vleo.net (Postfix) with ESMTPSA id 64DC4BFDE0
	for <linux-lvm@redhat.com>; Sat,  7 Mar 2020 14:27:18 +0100 (CET)
From: Andrea Leofreddi <a.leofreddi@vleo.net>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Message-Id: <DDA58569-96D2-4DD7-821B-4B948BC2C21C@vleo.net>
Date: Sat, 7 Mar 2020 14:26:32 +0100
Content-Type: multipart/signed;
	boundary="Apple-Mail=_97C8B73C-B463-4EB7-9D7D-B75971B14B69";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Subject: [linux-lvm] lvm+ sanlock snapshot issue
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

--Apple-Mail=_97C8B73C-B463-4EB7-9D7D-B75971B14B69
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hello,
I'm running into an unexpected behaviour on lvm and sanlock: if I create a =
snapshot on an inactive logical volume the operation succeeds but the origi=
n lv gets locked (while reported as inactive by lvm).

I get the same result both with the stock lvm from Ubuntu 18 and the latest=
 master version from https://github.com/lvmteam/lvm2.git. Follows the proce=
dure to reproduce the issue:

1. Setup a shared volume group vg01 and some (inactive) logical volumes as =
follow:

```
root@lvm2:~# lvs -o +lv_uuid
  LV   VG   Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync C=
onvert LV UUID
  lv   vg01 -wi------- 12.00m                                              =
       YzSN30-OE1O-TMqI-ali5-gm1x-Ws8J-Re1bFR
  lv2  vg01 -wi------- 12.00m                                              =
       FoNx4D-jbOO-HRl7-OJNT-AtQi-d4Cw-lHLG5S
```

Lvmlockctl consistently reports both lv and lv2 as unlocked:

```
root@lvm2:~# lvmlockctl -i
VG vg01 lock_type=3Dsanlock Dhth4G-Fool-tugB-hcjK-ZAL4-cXnM-Q3A4x0
LS sanlock lvm_vg01
LK VG un ver 29
LK GL un ver 0
LK LV un FoNx4D-jbOO-HRl7-OJNT-AtQi-d4Cw-lHLG5S
LK LV un YzSN30-OE1O-TMqI-ali5-gm1x-Ws8J-Re1bFR
```

2. Then create a snapshot of lv2:

```
root@lvm2:~/lvm2# lvcreate -L 12m -s lv2 -n vg01/lv2-snap
  Logical volume "lv2-snap" created.
```

Lvm still thinks lv2 is inactive

```
root@lvm2:~/lvm2# lvs -o +lv_uuid
  LV       VG   Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sy=
nc Convert LV UUID
  lv       vg01 -wi------- 12.00m                                          =
           YzSN30-OE1O-TMqI-ali5-gm1x-Ws8J-Re1bFR
  lv2      vg01 owi---s--- 12.00m                                          =
           FoNx4D-jbOO-HRl7-OJNT-AtQi-d4Cw-lHLG5S
  lv2-snap vg01 swi---s--- 12.00m      lv2                                 =
           Tu3XQP-Bkcu-cQP5-XWY3-7CMc-9Fqa-b0y2m0
```

However `lv2` is still locked for lvmlockctl:

```
root@lvm2:~/lvm2# lvmlockctl -i
VG vg01 lock_type=3Dsanlock Dhth4G-Fool-tugB-hcjK-ZAL4-cXnM-Q3A4x0
LS sanlock lvm_vg01
LK VG un ver 31
LK GL un ver 0
LK LV ex FoNx4D-jbOO-HRl7-OJNT-AtQi-d4Cw-lHLG5S <=3D=3D locked
LK LV un YzSN30-OE1O-TMqI-ali5-gm1x-Ws8J-Re1bFR
```

Trying to activate lv2 on another host will fail; issuing `lvchange -a n lv=
2` from the locking host will fix it.

Looking a bit deeper in lvcreate, it seems that the leaked lock happens at =
`metadata/lv_manip.c:8082`:

```
#0  lockd_lv_name (cmd=3D0x555555c5f3b0, vg=3D0x5555564aa110, lv_name=3D0x5=
555564aa6d0 "lv2", lv_id=3D0x5555564aa5b0, lock_args=3D0x5555564aa6d8 "1.0.=
0:71303168",
    def_mode=3D0x555555787fb1 "ex", flags=3D2) at locking/lvmlockd.c:2195
#1  0x00005555556cab0c in lockd_lv (cmd=3D0x555555c5f3b0, lv=3D0x5555564aa5=
90, def_mode=3D0x555555787fb1 "ex", flags=3D2) at locking/lvmlockd.c:2387
#2  0x00005555556cb6f2 in lockd_init_lv (cmd=3D0x555555c5f3b0, vg=3D0x55555=
64aa110, lv=3D0x5555564aaf98, lp=3D0x7fffffffe250) at locking/lvmlockd.c:26=
82
#3  0x000055555565aabe in _lv_create_an_lv (vg=3D0x5555564aa110, lp=3D0x7ff=
fffffe250, new_lv_name=3D0x7fffffffe82e "lv2-snap") at metadata/lv_manip.c:=
8082
#4  0x000055555565c743 in lv_create_single (vg=3D0x5555564aa110, lp=3D0x7ff=
fffffe250) at metadata/lv_manip.c:8496
#5  0x00005555555ab271 in _lvcreate_single (cmd=3D0x555555c5f3b0, vg_name=
=3D0x555555c97318 "vg01", vg=3D0x5555564aa110, handle=3D0x555555c96f00)@=
lvcreate.c:1737
```

Any idea what's going on?


Kind regards,

   Andrea Leofreddi


--Apple-Mail=_97C8B73C-B463-4EB7-9D7D-B75971B14B69
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTxzL1W/Yxwdi2DEQhK7O661wR3DAUCXmOhCAAKCRBK7O661wR3
DERyAJ9J/3hwQNaXF+gV1+YjMDYxwiF5KACfTbsuY2QUhMqy+TfVlPSlN8691K4=
=lC6C
-----END PGP SIGNATURE-----

--Apple-Mail=_97C8B73C-B463-4EB7-9D7D-B75971B14B69--
