Date: Fri, 16 Jun 2000 10:29:05 +0100 (IST)
From: Paul Jakma <paulj@itg.ie>
Subject: Re: [linux-lvm] LVM for Redhat 6.1 (2.2.12 kernel)
In-Reply-To: <DCBFB8E1BD8BD311A94D00A0C9CA44EA0CCCEB@storeage_nt>
Message-ID: <Pine.LNX.4.21.0006161022570.22397-100000@rossi.itg.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergey Vichik <SVichik@store-age.com>
Cc: "LVM list (E-mail)" <linux-lvm@msede.com>

On Fri, 16 Jun 2000, Sergey Vichik wrote:

> 	Is there some other patch that works for this kernel version ?
> Or if isn't, a patch to upgrade to another version, where LVM patches will
> work ?
> 

get stock 2.2.16+errata or 2.2.17pre and apply the 2.2.13 lvm 0.8i patch
to it. this worked for me. 

> 
> Serg.


--paulj

PS: heinz, can we please please have an official 0.8final patch for 2.2?

suse's backport is not in their 6.4 kernel-patches tarball. and having to
download an entire kernel tree is impractical..
