From: Kai Weber <lists@glorybox.de>
Message-ID: <20031211225454.GB32442@glorybox.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Error: Unable to unlink device node
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
Date: Thu Dec 11 16:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,

I get the following error/warning when I shutdown my system:

Unable to unlink device node for 'datavg-swap'
/dev/datavg/swap: unlink failed: Read only file system

This message is printed for every of my LV's. What does this message
mean?

PS: It's a Debian Sid System. Maybe it has to do with the invocation of
the halt-script in /etc/init.d?

Kai
--=20
   =BB kai weber
   _ http://www.glorybox.de _ icq 102024972 _ pgp 0x594D4132
