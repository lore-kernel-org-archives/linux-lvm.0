Message-ID: <3BB941F5.F22E3159@americasm01.nt.com>
Date: Mon, 01 Oct 2001 23:26:29 -0500
From: "Joe Harvell" <harvell@nortelnetworks.com>
MIME-Version: 1.0
References: <3A7B17B2.8A75537B@asosa.org> <Pine.LNX.4.21.0102021002400.23087-100000@compath.asosa.org> <20010203144323.A704@guldukat.muon>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] how to upgrade from rh70 to rh71
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Greg Stovall <gstovall@nortelnetworks.com>, Mark Flacy <flacy@nortelnetworks.com>, Jim Wolff <jwolff@nortelnetworks.com>, William Mcnamara <wmcnamar@nortelnetworks.com>

Hmm:

I never really thought about this when I decided to put all my filesystems on
LVM logical volumes; but how am I going to be able to upgrade to RedHat 7.1?
If I remember correctly, the installer has its own custom kernel and root
filesystem to boot into for the upgrade.

My setup is two IDE disks with 4 RAID-1 devices.  I have an LVM volume group
(/dev/w0) on one of these (/dev/md2), that has all my filesystems on it (except
/boot).

/dev/w0/root
/dev/w0/var
/dev/w0/usr
/dev/w0/home
/dev/w0/opt.

So the redhat upgrade kernel will need to have support for RAID and LVM.  And
it will need to run vgscan, and vgchange -ay.  And it will need to have devfs
support or it will need to use mknod to make the directories enumerated above.
Does anyone know if it does all these things?

Am I going to have to use my own rescue disk as the platform from which to
manually do the upgrade (by issuing the appropriate rpm commands?

Has anyone with a similar configuration done this?

---
Joe Harvell
