Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02C463091380
	for <linux-lvm@redhat.com>; Wed, 26 Sep 2018 04:49:39 +0000 (UTC)
Received: from mail.desktop.co.za (mail.desktop-ns.co.za [169.255.228.2])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C002337E7B
	for <linux-lvm@redhat.com>; Wed, 26 Sep 2018 04:49:34 +0000 (UTC)
From: Jaco van Niekerk <jaco@desktop.co.za>
Date: Wed, 26 Sep 2018 04:50:16 +0000
Message-ID: <83AC2A1B573A1341BD85C441C9109F5928EF35C7@desktoptdc.desktop.local>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_83AC2A1B573A1341BD85C441C9109F5928EF35C7desktoptdcdeskt_"
MIME-Version: 1.0
Subject: [linux-lvm] Correct way to remove LVM Snapshot
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

--_000_83AC2A1B573A1341BD85C441C9109F5928EF35C7desktoptdcdeskt_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

I will like to confirm the correct way to remove an LVM snapshot?

Create my Logical Volume and snapshot:
lvcreate --addtag pacemaker --name lv_iscsi_lun1 --size 100G vg_iscsi --con=
fig 'activation { volume_list =3D [ "@pacemaker" ]}'
lvcreate --addtag pacemaker --name lv_iscsi_lun1_snap --snapshot --size 10G=
 /dev/vg_iscsi/lv_iscsi_lun1 --config 'activation { volume_list =3D [ \"@pa=
cemaker\" ]}'

Do I have to Merge the Snapshot first before I can remove it?
lvremove /dev/vg_iscsi/lv_iscsi_lun1_snap

More Info:
lv_iscsi_lun1 is a ISCSI target for a KVM virtual server.

Trouble experienced:
I lost my hole Volume Group after removing the Logical Volume Snapshot.

Regards

--

Jaco van Niekerk


--_000_83AC2A1B573A1341BD85C441C9109F5928EF35C7desktoptdcdeskt_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body text=3D"#000000" bgcolor=3D"#FFFFFF">
<p>Hi</p>
<p>I will like to confirm the correct way to remove an LVM snapshot?</p>
Create my Logical Volume and snapshot:<br>
lvcreate --addtag pacemaker --name lv_iscsi_lun1 --size 100G vg_iscsi --con=
fig 'activation { volume_list =3D [ &quot;@pacemaker&quot; ]}'<br>
lvcreate --addtag pacemaker --name lv_iscsi_lun1_snap --snapshot --size 10G=
 /dev/vg_iscsi/lv_iscsi_lun1 --config 'activation { volume_list =3D [ \&quo=
t;@pacemaker\&quot; ]}'<br>
<br>
Do I have to Merge the Snapshot first before I can remove it?<br>
lvremove /dev/vg_iscsi/lv_iscsi_lun1_snap<br>
<br>
More Info:<br>
lv_iscsi_lun1 is a ISCSI target for a KVM virtual server.<br>
<br>
Trouble experienced:<br>
I lost my hole Volume Group after removing the Logical Volume Snapshot. <br=
>
<p>Regards<br>
</p>
<div class=3D"moz-signature">-- <br>
<p style=3D"font-family: Arial; background-color: rgb(255, 255,=0A=
        255); margin-bottom: 6pt; margin-top: 6pt;">
<span style=3D"font-size: 13.3333px;">Jaco van Niekerk</span></p>
<br>
</div>
</body>
</html>

--_000_83AC2A1B573A1341BD85C441C9109F5928EF35C7desktoptdcdeskt_--
