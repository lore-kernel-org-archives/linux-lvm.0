Return-Path: <thornber@btconnect.com>
Date: Wed, 9 May 2001 16:03:19 +0100
Subject: Re: [linux-lvm] Patching my kernel.
Message-ID: <20010509160319.C898@66bassett.freeserve.co.uk>
References: <989363474.1329.2.camel@localhost> <20010509085110.G23157@colombina.comedia.it> <989404772.3725.0.camel@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <989404772.3725.0.camel@localhost>; from raheesom@navpoint.com on Wed, May 09, 2001 at 06:39:31AM -0400
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

On Wed, May 09, 2001 at 06:39:31AM -0400, Rupert Heesom wrote:
> On 09 May 2001 08:51:10 +0200, Luca Berra wrote:
> > On Tue, May 08, 2001 at 07:11:14PM -0400, Rupert Heesom wrote:
> > > I had previously patched the kernel (stock 2.4.3) with the beta 6 patch.
> > > 
> > > Now I'm trying to update to beta 7.  I tried patching the kernel is
> > > exactly the same way as before (maybe a mistake).  Most of the output is
> > > pasted in here (at the end).  I'm concerned about the prompts I got -
> > > 
> > > "Reversed (or previously applied) patch detected!  Assume -R? [n]"
> > are you starting with a clean kernel or with the kernel you previously
> > patched with b6?
> > the former is the correvt approach,
> > the latter....
> 
> I was not using a clean kernel.  I'll try that.
> 
> BTW, I know there's a way to keep the config from the "used kernel", so
> that I don't have to guess the settings again for my system (I made
> several config errors last time).  Can you remind me how to migrate the
> .config file across to a new source tree?   I'll try & find some docs on
> how to do this, but have forgotten where I last read about it.

Just keep a copy of the .config file, when you untar a new kernel
tree copy the .config file back and do a 'make oldconfig', you will be
prompted for any new options.

I tend to have a few of these .config's for different setups.  eg. 

config-2.2-new_raid-lvm-kdb
config-2.2-lvm-kdb
etc.

- Joe

> 
> -- 
> regs
> rupert
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
