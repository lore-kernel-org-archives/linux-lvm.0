Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u56LHdE5009817
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 6 Jun 2016 17:17:39 -0400
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E4CE50F5C
	for <linux-lvm@redhat.com>; Mon,  6 Jun 2016 21:17:37 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id k23so246865755oih.0
	for <linux-lvm@redhat.com>; Mon, 06 Jun 2016 14:17:37 -0700 (PDT)
MIME-Version: 1.0
From: Bertrand Paquet <bertrand.paquet@doctolib.fr>
Date: Mon, 6 Jun 2016 23:17:36 +0200
Message-ID: <CAN1xZsc8Rkd0rwmp=2dSDGjD8vmud0r_eFfUet0Ls6GyfHkrmQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a11428dec0078160534a29ac1
Subject: [linux-lvm] Dmcache crash
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

--001a11428dec0078160534a29ac1
Content-Type: text/plain; charset=UTF-8

Hi all,

The dmcache setup on one production server crashed this afternoon. The
error in syslog is below.

After a reboot, logical volumes are still here, but inactive.

# lvs -a
  LV              VG      Attr       LSize   Pool  Origin       Data%
 Meta%  Move Log Cpy%Sync Convert
  cache           storage Cwi---C--- 834.41g

  [cache_cdata]   storage Cwi------- 834.41g

  [cache_cmeta]   storage ewi-------  16.00g

  [lvol0_pmspare] storage ewi-------  16.00g

  tank            storage Cwi---C---   5.00t cache [tank_corig]

  [tank_corig]    storage owi---C---   5.00t

I'm not able to activate them.

# vgchange -ay
  Check of pool storage/cache failed (status:1). Manual repair required!
  0 logical volume(s) in volume group "storage" now active

Any idea to bring back the volume online, or at least to recover the data ?

Kernel : 4.3.0-0.bpo.1-amd64 #1 SMP Debian 4.3.5-1~bpo8+1 (2016-02-23)
x86_64 GNU/Linux
Distro : debian jessie

Any help will be greatly appreciated.

Regards,

Bertrand

Error log :
Jun  6 11:58:06 xxxx kernel: [3015831.571379] device-mapper: array:
array_block_check failed: blocknr 1082331758718 != wanted 16969
Jun  6 11:58:06 xxxx kernel: [3015831.571453] device-mapper: block manager:
array validator check failed for block 16969
Jun  6 11:58:06 xxxx kernel: [3015831.571515] device-mapper: cache: 252:3:
demotion failed; couldn't update on disk metadata
Jun  6 11:58:06 xxxx kernel: [3015831.571578] device-mapper: cache: 252:3:
metadata operation 'dm_cache_remove_mapping' failed: error = -15
Jun  6 11:58:06 xxxx kernel: [3015831.571664] device-mapper: cache: 252:3:
aborting current metadata transaction
Jun  6 11:58:06 xxxx kernel: [3015831.572836] device-mapper: cache: 252:3:
switching cache to read-only mode
Jun  6 11:58:06 xxxx kernel: [3015831.572840] device-mapper: cache: 252:3:
demotion failed; couldn't update on disk metadata
Jun  6 11:58:06 xxxx kernel: [3015831.572901] device-mapper: cache: 252:3:
metadata operation 'dm_cache_remove_mapping' failed: error = -22
Jun  6 11:58:06 xxxx kernel: [3015831.572973] device-mapper: cache: 252:3:
demotion failed; couldn't update on disk metadata
Jun  6 11:58:06 xxxx kernel: [3015831.573034] device-mapper: cache: 252:3:
metadata operation 'dm_cache_remove_mapping' failed: error = -22
Jun  6 11:58:06 xxxx kernel: [3015831.573103] device-mapper: cache: 252:3:
demotion failed; couldn't copy block
Jun  6 11:58:11 xxxx kernel: [3015836.425768] Aborting journal on device
dm-3-8.
Jun  6 11:58:11 xxxx kernel: [3015836.425853] Buffer I/O error on dev dm-3,
logical block 671121408, lost sync page write
Jun  6 11:58:11 xxxx kernel: [3015836.425939] JBD2: Error -5 detected when
updating journal superblock for dm-3-8.
Jun  6 11:58:11 xxxx kernel: [3015836.444140] Buffer I/O error on dev dm-3,
logical block 0, lost sync page write
Jun  6 11:58:11 xxxx kernel: [3015836.444234] EXT4-fs error (device dm-3):
ext4_journal_check_start:56: Detected aborted journal
Jun  6 11:58:11 xxxx kernel: [3015836.444311] EXT4-fs (dm-3): Remounting
filesystem read-only
Jun  6 11:58:11 xxxx kernel: [3015836.444352] EXT4-fs (dm-3): previous I/O
error to superblock detected
Jun  6 11:58:11 xxxx kernel: [3015836.444428] Buffer I/O error on dev dm-3,
logical block 0, lost sync page write
Jun  6 11:58:15 xxxx kernel: [3015840.507213] migration_success_pre_commit:
12194 callbacks suppressed
Jun  6 11:58:15 xxxx kernel: [3015840.507217] device-mapper: cache: 252:3:
promotion failed; couldn't update on disk metadata
Jun  6 11:58:15 xxxx kernel: [3015840.507291] device-mapper: cache: 252:3:
metadata operation 'dm_cache_insert_mapping' failed: error = -22
Jun  6 11:58:19 xxxx kernel: [3015844.720334] device-mapper: cache: 252:3:
promotion failed; couldn't update on disk metadata
Jun  6 11:58:19 xxxx kernel: [3015844.720406] device-mapper: cache: 252:3:
metadata operation 'dm_cache_insert_mapping' failed: error = -22
Jun  6 11:59:15 xxxx kernel: [3015901.091051] device-mapper: cache: 252:3:
demotion failed; couldn't update on disk metadata
Jun  6 11:59:15 xxxx kernel: [3015901.091124] device-mapper: cache: 252:3:
metadata operation 'dm_cache_remove_mapping' failed: error = -22
Jun  6 11:59:15 xxxx kernel: [3015901.091207] device-mapper: cache: 252:3:
demotion failed; couldn't update on disk metadata
Jun  6 11:59:15 xxxx kernel: [3015901.091274] device-mapper: cache: 252:3:
metadata operation 'dm_cache_remove_mapping' failed: error = -22
Jun  6 11:59:15 xxxx kernel: [3015901.091482] device-mapper: cache: 252:3:
demotion failed; couldn't update on disk metadata
Jun  6 11:59:15 xxxx kernel: [3015901.091551] device-mapper: cache: 252:3:
metadata operation 'dm_cache_remove_mapping' failed: error = -22
Jun  6 11:59:15 xxxx kernel: [3015901.091622] device-mapper: cache: 252:3:
demotion failed; couldn't update on disk metadata
Jun  6 11:59:15 xxxx kernel: [3015901.091689] device-mapper: cache: 252:3:
metadata operation 'dm_cache_remove_mapping' failed: error = -22
Jun  6 11:59:15 xxxx kernel: [3015901.092341] device-mapper: cache: 252:3:
demotion failed; couldn't update on disk metadata
Jun  6 11:59:15 xxxx kernel: [3015901.092409] device-mapper: cache: 252:3:
metadata operation 'dm_cache_remove_mapping' failed: error = -22
Jun  6 11:59:30 xxxx kernel: [3015915.162952] migration_success_pre_commit:
1194 callbacks suppressed
Jun  6 11:59:30 xxxx kernel: [3015915.162955] device-mapper: cache: 252:3:
promotion failed; couldn't update on disk metadata
Jun  6 11:59:30 xxxx kernel: [3015915.163034] device-mapper: cache: 252:3:
metadata operation 'dm_cache_insert_mapping' failed: error = -22
Jun  6 11:59:38 xxxx kernel: [3015923.147099] device-mapper: cache: 252:3:
promotion failed; couldn't update on disk metadata
Jun  6 11:59:38 xxxx kernel: [3015923.147183] device-mapper: cache: 252:3:
metadata operation 'dm_cache_insert_mapping' failed: error = -22
Jun  6 11:59:39 xxxx kernel: [3015924.308771] device-mapper: cache: 252:3:
promotion failed; couldn't update on disk metadata
Jun  6 11:59:39 xxxx kernel: [3015924.308846] device-mapper: cache: 252:3:
metadata operation 'dm_cache_insert_mapping' failed: error = -22
Jun  6 11:59:59 xxxx kernel: [3015944.161468] device-mapper: cache: 252:3:
promotion failed; couldn't update on disk metadata
Jun  6 11:59:59 xxxx kernel: [3015944.161541] device-mapper: cache: 252:3:
metadata operation 'dm_cache_insert_mapping' failed: error = -22
Jun  6 12:00:01 xxxx kernel: [3015946.457345] device-mapper: cache: 252:3:
promotion failed; couldn't update on disk metadata
Jun  6 12:00:01 xxxx kernel: [3015946.457416] device-mapper: cache: 252:3:
metadata operation 'dm_cache_insert_mapping' failed: error = -22
Jun  6 12:00:42 xxxx kernel: [3015987.290496] device-mapper: cache: 252:3:
promotion failed; couldn't update on disk metadata
Jun  6 12:00:42 xxxx kernel: [3015987.290569] device-mapper: cache: 252:3:
metadata operation 'dm_cache_insert_mapping' failed: error = -22

--001a11428dec0078160534a29ac1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>The dmcache setup on one produc=
tion server crashed this afternoon. The error in syslog is below.</div><div=
><br></div><div>After a reboot, logical volumes are still here, but inactiv=
e.</div><br># lvs -a<br>=C2=A0 LV =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0VG =C2=A0 =C2=A0 =C2=A0Attr =C2=A0 =C2=A0 =C2=A0 LSize =C2=A0 Pool =
=C2=A0Origin =C2=A0 =C2=A0 =C2=A0 Data% =C2=A0Meta% =C2=A0Move Log Cpy%Sync=
 Convert<br>=C2=A0 cache =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 storage Cwi---C=
--- 834.41g =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>=C2=
=A0 [cache_cdata] =C2=A0 storage Cwi------- 834.41g =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>=C2=A0 [cache_cmeta] =C2=A0 storage =
ewi------- =C2=A016.00g =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <br>=C2=A0 [lvol0_pmspare] storage ewi------- =C2=A016.00g =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>=C2=A0 tank =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0storage Cwi---C--- =C2=A0 5.00t cache [tank_=
corig] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<b=
r>=C2=A0 [tank_corig] =C2=A0 =C2=A0storage owi---C--- =C2=A0 5.00t =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<div>=C2=A0<br></div><div><div>I&#39;m not a=
ble to activate them.</div><div><br></div># vgchange -ay<br>=C2=A0 Check of=
 pool storage/cache failed (status:1). Manual repair required!<br>=C2=A0 0 =
logical volume(s) in volume group &quot;storage&quot; now active</div><div>=
<br></div><div>Any idea to bring back the volume online, or at least to rec=
over the data ?</div><div><br></div><div>Kernel : 4.3.0-0.bpo.1-amd64 #1 SM=
P Debian 4.3.5-1~bpo8+1 (2016-02-23) x86_64 GNU/Linux</div><div>Distro : de=
bian jessie</div><div><br></div>







<div>Any help will be greatly appreciated.</div><div><br></div><div>Regards=
,</div><div><br></div><div>Bertrand<br><div><br></div><div>Error log :=C2=
=A0</div><div><div>Jun =C2=A06 11:58:06 xxxx kernel: [3015831.571379] devic=
e-mapper: array: array_block_check failed: blocknr 1082331758718 !=3D wante=
d 16969</div><div>Jun =C2=A06 11:58:06 xxxx kernel: [3015831.571453] device=
-mapper: block manager: array validator check failed for block 16969</div><=
div>Jun =C2=A06 11:58:06 xxxx kernel: [3015831.571515] device-mapper: cache=
: 252:3: demotion failed; couldn&#39;t update on disk metadata</div><div>Ju=
n =C2=A06 11:58:06 xxxx kernel: [3015831.571578] device-mapper: cache: 252:=
3: metadata operation &#39;dm_cache_remove_mapping&#39; failed: error =3D -=
15</div><div>Jun =C2=A06 11:58:06 xxxx kernel: [3015831.571664] device-mapp=
er: cache: 252:3: aborting current metadata transaction</div><div>Jun =C2=
=A06 11:58:06 xxxx kernel: [3015831.572836] device-mapper: cache: 252:3: sw=
itching cache to read-only mode</div><div>Jun =C2=A06 11:58:06 xxxx kernel:=
 [3015831.572840] device-mapper: cache: 252:3: demotion failed; couldn&#39;=
t update on disk metadata</div><div>Jun =C2=A06 11:58:06 xxxx kernel: [3015=
831.572901] device-mapper: cache: 252:3: metadata operation &#39;dm_cache_r=
emove_mapping&#39; failed: error =3D -22</div><div>Jun =C2=A06 11:58:06 xxx=
x kernel: [3015831.572973] device-mapper: cache: 252:3: demotion failed; co=
uldn&#39;t update on disk metadata</div><div>Jun =C2=A06 11:58:06 xxxx kern=
el: [3015831.573034] device-mapper: cache: 252:3: metadata operation &#39;d=
m_cache_remove_mapping&#39; failed: error =3D -22</div><div>Jun =C2=A06 11:=
58:06 xxxx kernel: [3015831.573103] device-mapper: cache: 252:3: demotion f=
ailed; couldn&#39;t copy block</div><div>Jun =C2=A06 11:58:11 xxxx kernel: =
[3015836.425768] Aborting journal on device dm-3-8.</div><div>Jun =C2=A06 1=
1:58:11 xxxx kernel: [3015836.425853] Buffer I/O error on dev dm-3, logical=
 block 671121408, lost sync page write</div><div>Jun =C2=A06 11:58:11 xxxx =
kernel: [3015836.425939] JBD2: Error -5 detected when updating journal supe=
rblock for dm-3-8.</div><div>Jun =C2=A06 11:58:11 xxxx kernel: [3015836.444=
140] Buffer I/O error on dev dm-3, logical block 0, lost sync page write</d=
iv><div>Jun =C2=A06 11:58:11 xxxx kernel: [3015836.444234] EXT4-fs error (d=
evice dm-3): ext4_journal_check_start:56: Detected aborted journal</div><di=
v>Jun =C2=A06 11:58:11 xxxx kernel: [3015836.444311] EXT4-fs (dm-3): Remoun=
ting filesystem read-only</div><div>Jun =C2=A06 11:58:11 xxxx kernel: [3015=
836.444352] EXT4-fs (dm-3): previous I/O error to superblock detected</div>=
<div>Jun =C2=A06 11:58:11 xxxx kernel: [3015836.444428] Buffer I/O error on=
 dev dm-3, logical block 0, lost sync page write</div><div>Jun =C2=A06 11:5=
8:15 xxxx kernel: [3015840.507213] migration_success_pre_commit: 12194 call=
backs suppressed</div><div>Jun =C2=A06 11:58:15 xxxx kernel: [3015840.50721=
7] device-mapper: cache: 252:3: promotion failed; couldn&#39;t update on di=
sk metadata</div><div>Jun =C2=A06 11:58:15 xxxx kernel: [3015840.507291] de=
vice-mapper: cache: 252:3: metadata operation &#39;dm_cache_insert_mapping&=
#39; failed: error =3D -22</div><div>Jun =C2=A06 11:58:19 xxxx kernel: [301=
5844.720334] device-mapper: cache: 252:3: promotion failed; couldn&#39;t up=
date on disk metadata</div><div>Jun =C2=A06 11:58:19 xxxx kernel: [3015844.=
720406] device-mapper: cache: 252:3: metadata operation &#39;dm_cache_inser=
t_mapping&#39; failed: error =3D -22</div><div>Jun =C2=A06 11:59:15 xxxx ke=
rnel: [3015901.091051] device-mapper: cache: 252:3: demotion failed; couldn=
&#39;t update on disk metadata</div><div>Jun =C2=A06 11:59:15 xxxx kernel: =
[3015901.091124] device-mapper: cache: 252:3: metadata operation &#39;dm_ca=
che_remove_mapping&#39; failed: error =3D -22</div><div>Jun =C2=A06 11:59:1=
5 xxxx kernel: [3015901.091207] device-mapper: cache: 252:3: demotion faile=
d; couldn&#39;t update on disk metadata</div><div>Jun =C2=A06 11:59:15 xxxx=
 kernel: [3015901.091274] device-mapper: cache: 252:3: metadata operation &=
#39;dm_cache_remove_mapping&#39; failed: error =3D -22</div><div>Jun =C2=A0=
6 11:59:15 xxxx kernel: [3015901.091482] device-mapper: cache: 252:3: demot=
ion failed; couldn&#39;t update on disk metadata</div><div>Jun =C2=A06 11:5=
9:15 xxxx kernel: [3015901.091551] device-mapper: cache: 252:3: metadata op=
eration &#39;dm_cache_remove_mapping&#39; failed: error =3D -22</div><div>J=
un =C2=A06 11:59:15 xxxx kernel: [3015901.091622] device-mapper: cache: 252=
:3: demotion failed; couldn&#39;t update on disk metadata</div><div>Jun =C2=
=A06 11:59:15 xxxx kernel: [3015901.091689] device-mapper: cache: 252:3: me=
tadata operation &#39;dm_cache_remove_mapping&#39; failed: error =3D -22</d=
iv><div>Jun =C2=A06 11:59:15 xxxx kernel: [3015901.092341] device-mapper: c=
ache: 252:3: demotion failed; couldn&#39;t update on disk metadata</div><di=
v>Jun =C2=A06 11:59:15 xxxx kernel: [3015901.092409] device-mapper: cache: =
252:3: metadata operation &#39;dm_cache_remove_mapping&#39; failed: error =
=3D -22</div><div>Jun =C2=A06 11:59:30 xxxx kernel: [3015915.162952] migrat=
ion_success_pre_commit: 1194 callbacks suppressed</div><div>Jun =C2=A06 11:=
59:30 xxxx kernel: [3015915.162955] device-mapper: cache: 252:3: promotion =
failed; couldn&#39;t update on disk metadata</div><div>Jun =C2=A06 11:59:30=
 xxxx kernel: [3015915.163034] device-mapper: cache: 252:3: metadata operat=
ion &#39;dm_cache_insert_mapping&#39; failed: error =3D -22</div><div>Jun =
=C2=A06 11:59:38 xxxx kernel: [3015923.147099] device-mapper: cache: 252:3:=
 promotion failed; couldn&#39;t update on disk metadata</div><div>Jun =C2=
=A06 11:59:38 xxxx kernel: [3015923.147183] device-mapper: cache: 252:3: me=
tadata operation &#39;dm_cache_insert_mapping&#39; failed: error =3D -22</d=
iv><div>Jun =C2=A06 11:59:39 xxxx kernel: [3015924.308771] device-mapper: c=
ache: 252:3: promotion failed; couldn&#39;t update on disk metadata</div><d=
iv>Jun =C2=A06 11:59:39 xxxx kernel: [3015924.308846] device-mapper: cache:=
 252:3: metadata operation &#39;dm_cache_insert_mapping&#39; failed: error =
=3D -22</div><div>Jun =C2=A06 11:59:59 xxxx kernel: [3015944.161468] device=
-mapper: cache: 252:3: promotion failed; couldn&#39;t update on disk metada=
ta</div><div>Jun =C2=A06 11:59:59 xxxx kernel: [3015944.161541] device-mapp=
er: cache: 252:3: metadata operation &#39;dm_cache_insert_mapping&#39; fail=
ed: error =3D -22</div><div>Jun =C2=A06 12:00:01 xxxx kernel: [3015946.4573=
45] device-mapper: cache: 252:3: promotion failed; couldn&#39;t update on d=
isk metadata</div><div>Jun =C2=A06 12:00:01 xxxx kernel: [3015946.457416] d=
evice-mapper: cache: 252:3: metadata operation &#39;dm_cache_insert_mapping=
&#39; failed: error =3D -22</div><div>Jun =C2=A06 12:00:42 xxxx kernel: [30=
15987.290496] device-mapper: cache: 252:3: promotion failed; couldn&#39;t u=
pdate on disk metadata</div><div>Jun =C2=A06 12:00:42 xxxx kernel: [3015987=
.290569] device-mapper: cache: 252:3: metadata operation &#39;dm_cache_inse=
rt_mapping&#39; failed: error =3D -22</div></div><div><br></div></div></div=
>

--001a11428dec0078160534a29ac1--
