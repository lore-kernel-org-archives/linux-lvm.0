From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] offtopic but ...
Message-Id: <20020508182151.I18743@vestdata.no>
References: <20020508082357.B18631@connectlive.com>
    <Pine.LNX.4.33.0205081533090.3518-100000@diablo.unixag-zw.fh-kl.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0205081533090.3518-100000@diablo.unixag-zw.fh-kl.de>;
    from jovi@unixag-zw.fh-kl.de on Wed, May 08, 2002 at 04:12:48PM +0200
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
Date: Wed May  8 11:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Wed, May 08, 2002 at 04:12:48PM +0200, Oliver Jovic wrote:
> 			   application
> 				|
> +----------------------------------------------------------------------
> |
> |			virtual device
> |
> +----------------------------------------------------------------------
>     |             |            |            |
> +----------+ +----------+ +----------+ +----------+
> |          | |          | |          | |          |
> | /dev/hda | | /dev/hdb | | /dev/hdc | | /dev/hdd |
> |   ext3   | | reiserfs | |   xfs    | |  ext2    |
> +----------- +----------+ +----------+ +----------+
>  index file =3D=3D index file

There are many functions you loose if multiple seperate filesystems are
used. e.g:
what do you do when a file grow to no longer fit on it's original
disk? You can not easily move it (atomicly), and you can not
easily split it into multiple chunks.


If you don't need this functionality, the closest approximation to what
you want is a symlink-three.

Basicly you can create a very small filesystem with symlinks for each
and every file on your "virtual filesystem" (don't call it a virtual
device, because that's something different :) ). You can use raid to get
redundancy for the link-three, and as it is very small you don't loose a
lot of space.

You could extend this scheeme to implement a small kernel-module that
did :
* open("/mnt/hdX/file", O_CREATE)
* symlink("/mnt/hdX/file", "/mnt/virtual/file")
when your application does
* open("/mnt/virtual/file", O_CREATE)
to make it more seemless.


However, it's once you want it to be totally transparrent, and files to
migrate to the disk with more space that it gets complicated.



--=20
Ragnar Kj=F8rstad
Big Storage
