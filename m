Return-Path: <russell@coker.com.au>
From: Russell Coker <russell@coker.com.au>
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
Date: Fri, 8 Jun 2001 04:28:36 +0200
References: <NBBBKLKHMJHIJLHOGAOJGECDIPAA.steve.wray@the.net.nz> <3B1FFEF8.38A5146A@wrkhors.com>
In-Reply-To: <3B1FFEF8.38A5146A@wrkhors.com>
MIME-Version: 1.0
Message-Id: <01060804283606.26916@lyta>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Steven Lembark <lembark@wrkhors.com>

On Friday 08 June 2001 00:23, Steven Lembark wrote:
> > Proportionally, how much slower is it? 50%? 25%? 12%?
> > less than 1% slower?
> > Does it really matter?
>
> For things like /, /tmp or primary swap even a few % can
> make a difference (especially on newer drives that use
> variable sector allocation).  This is something the system
> hits frequently with quite a bit of data.

However if you use two partitions at opposite ends of the drive then the=20
seek times will kill performance...

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
