Message-ID: <382152F9.3AE204E5@rz.rwth-aachen.de>
Date: Thu, 04 Nov 1999 10:33:46 +0100
From: "Frau A. Lorenz" <lorenz@rz.rwth-aachen.de>
MIME-Version: 1.0
Subject: [linux-lvm] Plattenwanderung
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM-Mailingliste <linux-lvm@msede.com>

Hallo,

ich m�chte meine logical Volume Group virt1_vg, welche sich auf zwei
SCSI-Platten verteilt von einem Rechner auf einen anderen verlagern.
Mu� ich au�er
   vgexport virt1_vg
   vgimport virt1_vg /dev/sd[bc]1
noch etwas beachten, vielleicht ein vgmknodes oder so ???

Gruss Andrea
