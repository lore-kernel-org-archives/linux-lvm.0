Date: Sat, 18 Mar 2000 20:16:40 +0000 (GMT)
From: James Pattinson <jamesp@subdimension.com>
Subject: [linux-lvm] 0.8i --> 0.8final
Message-ID: <Pine.LNX.4.10.10003182012380.17608-100000@greebo.jj.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi

I tried to migrate my system (currently running 2.2.14 / 0.8i with devfs)
to 2.3.99-pre1 with the lvm patch applied. I built the new user space
tools and copied the new vgscan and vgchange and liblvm.so to my initrd
image (as i'm using root on LVM) and tried to boot. It failed as the
vgscan reported no volume groups! I was unable to debug further as I can't
boot into anything using this new kernel now - so i've reverted to 2.2.14.
Any ideas?

CHeers!

James
