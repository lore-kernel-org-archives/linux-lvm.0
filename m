From: "Sherpa Joe" <buici@hotmail.com>
Mime-Version: 1.0
Message-ID: <LAW12-F16wQqIMwkhTC0001ac45@hotmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Unable to find lvm2 partitions using kernel 2.6.1 (NOT available?)
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
Date: Tue Jan 20 20:42:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="windows-1252"
To: linux-lvm@sistina.com

I'm finding myself in a sticky situation.  I was trying to upgrade my ker=
nel=20
to 2.6.1 in order to get the new ipsec stack, but I'm not in a place wher=
e I=20
cannot run either the old 2.4.20 kernel, or the new one.

As part of this process, I upgraded the lvm2 utils (on Debian).  I think=20
this is what broke the 2.4.20 kernel because now I get a message about th=
e=20
tools using the 4.0.0 ioctls and the kernel supporting only 1.0.8.

The odd part is that I'd expect the 2.6.1 kernel to see the lvm2 partitio=
ns.=20
  vgscan and vgdisplay can see them, but all of them are marked as NOT=20
available.  There is no /proc/lvm as described in the HOWTO.  Also, I=20
compiled everything into the kernel directly, no lvm modules.

This has put me in a tight spot so I'll be grateful for any help offered.

I am wondering if I need to either a) compile a kernel with LVM as a modu=
le,=20
b) compile a new 2.4.20 kernel that has the latest LVM patch, or c) do=20
something really easy that I've overlooked.

Cheers.

_________________________________________________________________
Find high-speed =91net deals =97 comparison-shop your local providers her=
e.=20
https://broadband.msn.com
