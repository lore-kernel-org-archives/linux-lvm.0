Return-Path: <ragnark@stine.vestdata.no>
Date: Fri, 9 Feb 2001 00:30:03 +0100
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] questions
Message-ID: <20010209003003.B29707@vestdata.no>
References: <20010208205551.C21949@vestdata.no> <200102082244.f18MiYt07465@webber.adilger.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200102082244.f18MiYt07465@webber.adilger.net>; from Andreas Dilger on Thu, Feb 08, 2001 at 03:44:33PM -0700
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Thu, Feb 08, 2001 at 03:44:33PM -0700, Andreas Dilger wrote:
> Ragnar Kj_rstad writes:
> > Is there a limit for the maximum size of a LVM diskgroup?
> > (internally in LVM-code, or because of other limits in the kernel)
> > The 2TB (1 TB) maximum devicesize in the linux-kernel doesn't apply, do=
es
> > it?
>=20
> Yes, even LVM has the 2TB limit at this point.  This is because LVM
> presents itself to the rest of the kernel as a block device (just like
> any other), so the kernel 2TB limit for block devices still holds.

For the volume, but not for the diskgroup, right?

> Heinz talked about allowing LVM to have PAGE_SIZE (4k) blocks (unlike
> the rest of the kernel, which uses 512 byte blocks) so it may be possible
> to go up to 16TB with LVM without a huge amount of kernel redesign.

This sounds really interesting.=20
What exactly would be needed to do that?
I believe there have been issues with lvm block sizes and XFS (maybe
other filesystems too). Would changing it to 4k create new issues?
Would it be possible to increese it even futher? if the filesystem used
more than 4k blocksize?


Thanks.



--=20
Ragnar Kj=EF=BF=BDrstad
BigStorage
