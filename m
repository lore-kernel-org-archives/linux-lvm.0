Return-Path: <thornber@btconnect.com>
Date: Wed, 9 May 2001 09:29:03 +0100
Subject: Re: [linux-lvm] Patching my kernel.
Message-ID: <20010509092903.C809@66bassett.freeserve.co.uk>
References: <989363474.1329.2.camel@localhost> <20010509085110.G23157@colombina.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010509085110.G23157@colombina.comedia.it>; from bluca@comedia.it on Wed, May 09, 2001 at 08:51:10AM +0200
From: Joe Thornber <thornber@btconnect.com>
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
To: linux-lvm@sistina.com

On Wed, May 09, 2001 at 08:51:10AM +0200, Luca Berra wrote:
> On Tue, May 08, 2001 at 07:11:14PM -0400, Rupert Heesom wrote:
> > I had previously patched the kernel (stock 2.4.3) with the beta 6 patch.
> > 
> > Now I'm trying to update to beta 7.  I tried patching the kernel is
> > exactly the same way as before (maybe a mistake).  Most of the output is
> > pasted in here (at the end).  I'm concerned about the prompts I got -
> > 
> > "Reversed (or previously applied) patch detected!  Assume -R? [n]"
> are you starting with a clean kernel or with the kernel you previously
> patched with b6?
> the former is the correvt approach,
> the latter....

The problem is that the patches mentioned in the fragments file
(LVM/PATCHES/fragments-*) for your kernel should only be applied once.
So either do as Luca says and go back to a clean kernel.  Or just
empty the fragments file (do not delete it, and do keep a back up in
case you go back to a clean kernel at some point).

- Joe

> 
> 
> L.
> -- 
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
