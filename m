Message-ID: <3DAEDEE5.4540B954@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] creating a LVM ontop of a cryptated (ppdd) loop back device
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
Date: Thu Oct 17 11:02:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I'm trying to cryptate my filesystems, and be able to take snapshots of
them.
I cannot get a snapshot of a cryptated LV to work (maybe because it is
readonly)
So i wanted to go the other way, and put the encryption in the bottom.
But, i cant create a VG ontop of a cryptated (ppdd) loop back device. It
works on a
unencrypted device. 

It pvcreates just fine, but when it comes to vgcreate, it says:
ve:/# pvcreate /dev/loop1
pvcreate -- physical volume "/dev/loop1" successfully created

ve:/# vgcreate vgt /dev/loop1
vgcreate -- no valid physical volumes in command line



Does anyone know any other encryption that works with LVM and/or allows
one to take snapshots?




JonB
