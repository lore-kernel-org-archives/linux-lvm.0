From: Kai Weber <lists@glorybox.de>
Subject: Re: [linux-lvm] Strange file system errors
Message-ID: <20040116173018.GA32555@glorybox.de>
References: <20040114113509.GA745@glorybox.de> <20040114142444.GA2837@redhat.com> <20040114234311.GA2199@glorybox.de> <1074125783.18105.55.camel@gecko.indygecko.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1074125783.18105.55.camel@gecko.indygecko.com>
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
Date: Fri Jan 16 12:31:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

* Jord Tanner <jord@indygecko.com>:

> Try the tests again with write caching off. You can do this with "hdparm
> -W0 /dev/hdX"

Thanks for your help. Until today I can not force the filesystem
corruption with write caching off. Your tip seems to work. The downsize
of disabled write caching seems to be a slightly slower system when
writing large files to the disks.

OK. End Of Topic. and now to something completely different.

--=20
  Kai Weber
=BB kai.weber@glorybox.de
  http://www.glorybox.de
