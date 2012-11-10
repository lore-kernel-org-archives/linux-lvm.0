Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qAA7XCt2027755
	for <linux-lvm@redhat.com>; Sat, 10 Nov 2012 02:33:12 -0500
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qAA7XAmI031304
	for <linux-lvm@redhat.com>; Sat, 10 Nov 2012 02:33:11 -0500
Received: by mail-la0-f46.google.com with SMTP id h6so3959124lag.33
	for <linux-lvm@redhat.com>; Fri, 09 Nov 2012 23:33:10 -0800 (PST)
MIME-Version: 1.0
From: Vladimir <tetlika@gmail.com>
Date: Sat, 10 Nov 2012 09:32:49 +0200
Message-ID: <CACYV5xxpUn0Mi=nDZC+dtp+Kke_O=Bw+TRhrcA+JeaA-qgVmxQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=bcaec554025a7fa5ca04ce1f14ea
Subject: [linux-lvm] lvm backup/restore on Amaxon ebs volumes
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

--bcaec554025a7fa5ca04ce1f14ea
Content-Type: text/plain; charset=ISO-8859-1

hi!

I'm creating my lvm volume on amazon ec2 in such a way:

mdadm --verbose --create /dev/md0 --level=0 --chunk=256
--raid-devices=/dev/sdh1 /dev/sdh2 /dev/sdh3 /dev/sdh4
blockdev --setra 128 /dev/md0
blockdev --setra 128 /dev/sdh1
blockdev --setra 128 /dev/sdh2
blockdev --setra 128 /dev/sdh3
blockdev --setra 128 /dev/sdh4
dd if=/dev/zero of=/dev/md0 bs=512 count=1
pvcreate /dev/md0
vgcreate vg0 /dev/md0
lvcreate -l 100%vg -n data vg0
mke2fs -t ext4 -F /dev/vg0/data
echo '/dev/vg0/data /data ext4 defaults,auto,noatime,nodiratime,noexec 0 0'
| tee -a /etc/fstab
mount /data

so I have 4 ebs volumes : /dev/sdh1-4

to back it up, I'm dismounting  /data (to make snapshots consistent) and
making ebs snapshots of each volume

to restore I'm just attaching volumes created from snapshots (not taking
care of order) and issuing :

vgchange -ay

and magically data is restored and everything's fine (just need to mount
/dev/vg0/data)

Am I doing everything correctly, does the order of volumes matters?

--bcaec554025a7fa5ca04ce1f14ea
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

hi!<div><br></div><div>I&#39;m creating my lvm volume on amazon ec2 in such=
 a way:</div><div><br></div><div>mdadm --verbose --create /dev/md0 --level=
=3D0 --chunk=3D256 --raid-devices=3D/dev/sdh1 /dev/sdh2 /dev/sdh3 /dev/sdh4=
</div>

<div><div>blockdev --setra 128 /dev/md0</div></div><div>blockdev --setra 12=
8 /dev/sdh1</div><div>blockdev --setra 128 /dev/sdh2</div><div>blockdev --s=
etra 128 /dev/sdh3</div><div>blockdev --setra 128 /dev/sdh4</div><div>
dd if=3D/dev/zero of=3D/dev/md0 bs=3D512 count=3D1</div>
<div><div>pvcreate /dev/md0</div><div>vgcreate vg0 /dev/md0</div><div>lvcre=
ate -l 100%vg -n data vg0</div></div><div>mke2fs -t ext4 -F /dev/vg0/data</=
div><div><div>echo &#39;/dev/vg0/data /data ext4 defaults,auto,noatime,nodi=
ratime,noexec 0 0&#39; | tee -a /etc/fstab</div>

</div><div>mount /data</div><div><br></div><div>so I have 4 ebs volumes : /=
dev/sdh1-4</div><div><br></div><div>to back it up, I&#39;m dismounting =A0/=
data (to make snapshots consistent) and making ebs snapshots of each volume=
</div>

<div><br></div><div>to restore I&#39;m just attaching volumes created from =
snapshots (not taking care of order) and issuing :</div><div><br></div><div=
>vgchange -ay</div><div><br></div><div>and magically data is restored and e=
verything&#39;s fine (just need to mount /dev/vg0/data)</div>

<div><br></div><div>Am I doing everything correctly, does the order of volu=
mes matters?</div>

--bcaec554025a7fa5ca04ce1f14ea--
