Message-Id: <200206070858.g578wfi22035@mail.pronto.tv>
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
References: <OF73D30ECA.36498F9C-ONC1256BD0.004E5691@kancelar.seznam.cz> <200206061435.g56EZpl28164@mail.pronto.tv> <20020606232137.GB479@frodo>
In-Reply-To: <20020606232137.GB479@frodo>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Re: mkfs - cannot set blocksize
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
Date: Fri Jun  7 03:59:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Nathan Scott <nathans@sgi.com>, Marek.Les@firma.seznam.cz
Cc: linux-xfs@oss.sgi.com, linux-lvm@sistina.com

> 4K pagesize, not blocksize.  [filesystem] blocksizes smaller than 4K
> are also supported.  Thats unrelated to this problem though, which is
> related to the device driver blocksize... mkfs is trying to tell the
> device to do IOs in 512 byte chunks, but its not listening.  There's
> some corner cases where mkfs will fail if the device driver ignores
> its request to change the device block size.

ok. sorry. rephrasing.

Linux on IA32 does not support blocksize > pagesize, which means Linux on=
=20
IA32 supports 512, 1024, 2048 and 4096 bytes per block
--=20
Roy Sigurd Karlsbakk, Datavaktmester

Computers are like air conditioners.
They stop working when you open Windows.
