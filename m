Date: Mon, 17 Jul 2000 00:44:20 +0100
From: Steve McIntyre <stevem@chiark.greenend.org.uk>
Subject: [linux-lvm] Problems with pvmove?
Message-ID: <20000717004420.A4161@chiark.greenend.org.uk>
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Love the lvm code - I've been using it for a few months now and it's
been great so far. However, now I'm trying to do something more
complicated with it...

I'm trying to replace one of the disks in my array. I have enough
space to move things around, so now I'm using pvmove to move the
contents of /dev/sde1 to /dev/sdj1. I'm getting problems:

# pvmove -d -vv /dev/sde1 /dev/sdj1

...
vg_check_name -- vg_name: "vg_scratch"
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
vg_check_name -- LEAVING with ret: 0
pe_lock_internal -- LEAVING with ret: -6
pvmove -- ERROR -204 pv_move_pe

pv_move_pes -- LEAVING with ret: -204
pvmove -- ERROR -204 moving physical extents
# 

Checking pe_lock_internal, errno -6 (-ENXIO) is coming from an ioctl
call into kernel. Any ideas?

-- 
Steve McIntyre, Cambridge, UK.                   stevem@chiark.greenend.org.uk
I sent ten dollars to death.net and all I got was... well, nothing.
"Can't keep my eyes from the circling sky,                 +------------------
"Tongue-tied & twisted, Just an earth-bound misfit, I..."  |Finger for PGP key
