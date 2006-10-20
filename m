Message-ID: <4538A48F.1050605@redhat.com>
Date: Fri, 20 Oct 2006 11:27:27 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Question about Physical volume
References: <45388202.7070305@nethinks.com> <4538961F.2030902@redhat.com>
	<4538A004.6030502@nethinks.com>
In-Reply-To: <4538A004.6030502@nethinks.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: tom@nethinks.com, LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thomas Marmetschke wrote:
> Hi,
> 
> many thanks for your mail.
> 
> Got Version 2.01.04-5 on debian stable.
> pvresize exist in the unstable tree of debian with Verson 2.02xx
> 
> Is there any other chance to resize the pv without pvresize?
> 
> -tom
> 

The pvresize tool is the right way to do this. You'd need to hack the
metadata by hand otherwise - updating your LVM2 tools even temporarily
to allow you to do this is probably an easier path.

Cheers,

Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFFOKSO6YSQoMYUY94RAr1JAKDgFDzTD/QBe+b3BeqruUBuJNmSjwCdGL+O
GPzpI/MPG+7DfX1VXdU/GiU=
=OqfJ
-----END PGP SIGNATURE-----
