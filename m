Return-Path: <bluca@comedia.it>
Date: Sun, 17 Dec 2000 10:47:10 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Debian packaging
Message-ID: <20001217104710.A9917@colombina.comedia.it>
References: <Pine.LNX.4.30.0012141645040.17005-100000@falka.mfa.kfki.hu> <00121417221738.00826@lyta>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00121417221738.00826@lyta>; from russell@coker.com.au on Thu, Dec 14, 2000 at 05:22:17PM +0100
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
Content-Transfer-Encoding: 7bit
To: Linux-LVM@sistina.com

On Thu, Dec 14, 2000 at 05:22:17PM +0100, Russell Coker wrote:
> Yes.  My package will differ quite a bit from the existing Debian package.  
> Also I plan to make everything use shared libraries.  ls, cp, and mv are not 
> statically linked so I don't think that there is any need for statically 
> linked lvm utilities.  My lvm package will be considerably smaller than the 
> current one (which is necessary for boot support).

this is something i could never understand in current linux distros :(

> One other thing, it seems that the protocol is changing often.  How should 
> this be managed in Debian packages?  I had thought of doing lvm22 and lvm24 
> as package names for the 2.2.x and 2.4.x kernels, but now I get the 
> impression that the interfaces will change between those series.  Also 0.8.1, 
> 0.9, and 0.8i all seem to have different protocol versions.

The protocol is kernel independent, the protocol changes between lvm releases

> This has two problems, one is that users won't know which one they need, the 
> other is how to manage an upgrade of a kernel!

if luser has 2.2 kernel she must have patched it to support LVM so she probably knows
what she's doing.

> I was thinking that perhaps what I should do is have /sbin/lvm-ver and 
> /lib/lvm-ver directories where "ver" is the version of LVM in question.  Then 
> at boot time there is a script that determines the version of LVM in the 
> kernel and creates sym-links from /sbin and /lib to the correct directories.  
> This is REALLY ugly, but it enables a user to cleanly have a machine that can 
> be booted on 2.2 or 2.4 kernel and just work each time you boot it.
> 
> Any better suggestions?
you should look at the wrapper i posted some days ago.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
