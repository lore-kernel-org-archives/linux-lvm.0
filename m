Return-Path: <erik@bagfors.nu>
From: Erik =?ISO-8859-1?Q?B=E5gfors?= <erik@bagfors.nu>
Date: 11 Apr 2001 17:50:47 +0200
Message-Id: <987004247.3002.10.camel@detrius>
Mime-Version: 1.0
Subject: [linux-lvm] can't remove logical volume  under snapshot???
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-lvm@sistina.com

What does this mean??

detrius:/# lvremove  -v /dev/disk_vg/home_lv=20
lvremove -- locking logical volume manager
lvremove -- checking logical volume name "/dev/disk_vg/home_lv"
lvremove -- checking existence of volume group "disk_vg"
lvremove -- checking for active volume group "disk_vg"
lvremove -- getting status of volume group "disk_vg" from kernel
lvremove -- getting status of logical volume /dev/disk_vg/home_lv from
VGDA in kernel
lvremove -- can't remove logical volume "/dev/disk_vg/home_lv" under
snapshot

I've tried making a snapshot once but I removed that.  Does this lv
still think there is one???  How do I get past this?

/Erik

--=20
Erik B=EF=BF=BDgfors               | http://erik.bagfors.nu/   =20
erik@bagfors.nu            | Erik.Bagfors@engohol.se
Supporter of free software | GSM +46 733 279 273
fingerprint: 6666 A85B 95D3 D26B 296B 6C60 4F32 2C0B 693D 6E32
