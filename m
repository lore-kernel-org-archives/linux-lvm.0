From: Friedrich Lobenstock <fl@fl.priv.at>
Subject: Re: [linux-lvm] SuSe 7.3 snapshot / reiserfs /
In-Reply-To: <23601.1010510215@joergli.cocolab.de>
Message-ID: <Pine.LNX.4.33.0201081927510.31998-100000@www.scotty.co.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Date: Tue Jan  8 12:31:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Tue, 8 Jan 2002 18:16, J=FCrgen Vollmer wrote:

>
> (may be a silly question) where do I find that kernel sources??

IIRC ftp://ftp.suse.com/pub/people/mantel/next/
You just need to get the kernel RPMS and apply
eg.
  rpm -Uvh k_deflt-2.4.16-22.i386.rpm
  mk_initrd && lilo
reboot and that's it.

--=20
MfG / Regards
Friedrich Lobenstock
