Return-Path: <ralph@oro.net>
Date: Tue, 27 Mar 2001 12:23:11 -0800
From: Ralph Jennings <ralph@oro.net>
Subject: Re: [linux-lvm] lvmgui 0.2 release
Message-ID: <20010327122311.A25656@d3.front>
References: <3ABDD38D.A841FFD3@ida.xs4all.nl> <wxx1yrkklzx.fsf@fjorir.ifi.uio.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wxx1yrkklzx.fsf@fjorir.ifi.uio.no>; from terjekv@math.uio.no on Tue, Mar 27, 2001 at 04:02:10AM +0200
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

On Tue, Mar 27, 2001 at 04:02:10AM +0200, Terje Kvernes wrote:
> Jorg de Jong <jorg.de.jong@ida.xs4all.nl> writes:
> > + New Features / Enhancements / Bug Fixes
> > 
> > - added images for LV and PV. 
> > - extend/reduce a VG
> > - extend/reduce a LV
> > - added vgscan in menu
> > - changed File->Rescan to File->Refresh
> 
>   sounds cute. I was actually thinking of writing something like this
>   myself, but can't really decide on what language to do it in. :)

How about Tcl/Tk?  Quick and easy to learn (a bit C, and Perl combined).
I picked it up quick by hacking allready made scripts, and I didn't know
any perl, but I know some C.  And you've got a good one allready made,
"/usr/src/linux/scripts/kconfig.tk" (might have to do "make xconfig" to
create it though).  Not as pretty as java, or C, but much faster than C
to create, and will run on most systems.

 -Me
