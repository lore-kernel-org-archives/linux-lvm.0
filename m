Date: Thu, 21 Sep 2000 11:12:57 +0200
From: =?iso-8859-1?Q?Erik_B=E5gfors?= <bagfors@pdc.kth.se>
Subject: Re: [linux-lvm] LVM + online resizing e2fs patches
Message-ID: <20000921111257.A28300@pdc.kth.se>
References: <01C022D8.286A2860.smdenton@bellsouth.net> <200009202039.e8KKdkm25172@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200009202039.e8KKdkm25172@webber.adilger.net>; from adilger@turbolinux.com on Wed, Sep 20, 2000 at 02:39:46PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Andreas Dilger <adilger@turbolinux.com>
Cc: "smdenton@bellsouth.net" <smdenton@bellsouth.net>, "'linux-lvm@msede.com'" <linux-lvm@msede.com>

On Wed, Sep 20, 2000 at 02:39:46PM -0600, Andreas Dilger wrote:
> The ext2online patch was written originally on 2.0, and it has moved
> relatively unscathed through 2.3.99.  However, recent changes in the
> VFS and ext2 code have likely broken the patch (I'm currently developing
> on 2.2, and haven't had a chance/filesystem-I-want-to-destroy for testing
> on 2.4.0-current).  So, yes ext2online will work with 2.2.13.

Any idea when you will try 2.4.x?

My dream is really a Journaling filesystem with online resize for 2.4.x.
:)

/Erik
--=20
Erik B=EF=BF=BDgfors               | Center for Parallel Computers
http://erik.bagfors.nu/    | http://www.pdc.kth.se/
erik@bagfors.nu            | bagfors@pdc.kth.se =20
Supporter of free software | GSM +46 70 398 54 43=20
fingerprint: 6666 A85B 95D3 D26B 296B 6C60 4F32 2C0B 693D 6E32
