Date: Mon, 12 Jun 2000 19:08:24 -0400
From: zoo1@corecomm.net
Subject: [linux-lvm] vgscan fails to find vg
Message-ID: <20000612190824.A7258@bar.nowhere>
Reply-To: zoo1@corecomm.net
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

i'm trying to convert my old mandrake 6.0 system to lvm, using a
2.4.0test kernel, lvm-0.8final and devfs, and i'm having a hard time
getting my rc scripts to work. on bootup, vgscan fails to find the vg
for no reason i can think of.

i'm working around this with the kludge of vgexport on shutdown and
vgimport on bootup, which works, but just doesn't seem right. i've got a
32KB debug output file of vgscan failing; what would be the best way of
submitting it to whom?
