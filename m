Message-ID: <4808.24.46.54.254.1031320260.squirrel@mail.scottsavarese.com>
From: "Scott Savarese" <scott@scottsavarese.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] software mirroring
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
Date: Fri Sep  6 08:51:09 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I am trying to set up mirroring on my system with LVM. Is there a command
to do it in LVM, or do I need the raidtools as well?

The ultimate goal is a completely mirrored harddrive so that I if my boot
drive fails (on that disk are /, swap, and /boot) I can swap the two
drives and reboot.

Or is it preferered to create LV's with LVM, and then run RAID ontop of
the LVM disks? (and then mirror /boot seperately).

Thanks,
Scott
