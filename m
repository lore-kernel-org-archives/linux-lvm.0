Return-Path: <ragnark@stine.vestdata.no>
Date: Tue, 14 Aug 2001 01:49:51 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010814014951.H26064@vestdata.no>
References: <20010811235718.A20414@linux.com> <20010812200701.A657@btconnect.com> <20010812221650.A6589@vestdata.no> <20010813100858.C362@btconnect.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010813100858.C362@btconnect.com>; from thornber@btconnect.com on Mon, Aug 13, 2001 at 10:08:58AM +0100
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

On Mon, Aug 13, 2001 at 10:08:58AM +0100, Joe Thornber wrote:
> > Why will liblvm disappear? To me using a library interface seems much
> > nicer than wrapping applications.
> 
> Because it's means there's yet another interface (along with the
> command line tools, and ioctl's) to constrain any implementation
> changes.  Command line tool interface will not change.  liblvm (if it
> still existed as a shared library) will change drastically between 1.0
> and 2.0 - not least because it in turn reflects the driver ioctl
> interface.

I'm not complaining if it's changing, but if it's going away, that's bad
:(

> The experimental branch has a single lvm tool, with liblvm statically
> linked into it.  There's no need for the outside world to know about
> liblvm.
> 
> It may be a good idea for Sistina to produce a tiny 'wrap the tools'
> library for use by gui implementors.

yach! An uncomplete list of uglyness:
* Errorhandling
* fork/exec
* having to format input arguments as strings (and quote them)
* having to parse output data from strings 


-- 
Ragnar Kjorstad
Big Storage
