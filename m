content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <A0F114871ED6044AB0E9A4173B5DCECB01113ADD@orsmsx406.jf.intel.com>
From: "Klingaman, Aaron L" <aaron.l.klingaman@intel.com>
Subject: [linux-lvm] root device problems with initrd and root on lvm
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
Date: Wed Oct  1 19:16:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

So, after a lot of testing and reboots, and reading through the mail
list archives, here is my problem:

appending "root=3D/dev/vg/root" to the kernel command line does't work:
'Cannot open root device "vg/root" or 00:00'

but when I use the real major/minor numbers ('root=3D3a01'), it works
correctly.

During startup, vgscan and vgactivate are working correctly and finding
the volumes, and I modified the initrd to do an ls -l on /dev/vg to get
the major/minor numbers. Somehow the mapping between /dev/vg/root to
3a01 isn't right.

I could just hardcode root=3D3a01 but I would rather not.

Any help would be appreciated.

(BTW, I'm not using lilo or grub, but kexec to load the kernel). I don't
think this is a problem as the kernel parameters are getting passed
correctly, and specifing root=3D3a01 allows the machine to boot).

Thank you,
Aaron
