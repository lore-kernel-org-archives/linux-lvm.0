From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Message-ID: <20011122203009.A557@sky.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] resize reiserfs
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
Date: Thu Nov 22 13:26:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,
I need to resize my lv /dev/store/data now.

I already added the 2nd HD (/dev/hdc1) to the vg store using vgextend
and extended the lv using lvextend.

Now I need to extend the reiserfs I got on this lv. I seached the web
and found the resize_reiserfs perl-script, but if I try it, I only get
this msg:
$#: ./resize_reiserfs --size +50G --lv /dev/store/data --dry-run         =
=20

  only 0 free PE's (0 K) left on VG store

Sure, I already added the PE=B4s to the lv.
What to do?

Uli

--=20
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
