Return-Path: <ragnark@stine.vestdata.no>
Date: Tue, 14 Aug 2001 19:50:23 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010814195022.C22309@vestdata.no>
References: <20010811235718.A20414@linux.com> <20010812200701.A657@btconnect.com> <20010814150418.E6463@mail.wave.co.nz> <20010814091401.A322@btconnect.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010814091401.A322@btconnect.com>; from thornber@btconnect.com on Tue, Aug 14, 2001 at 09:14:02AM +0100
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

On Tue, Aug 14, 2001 at 09:14:02AM +0100, Joe Thornber wrote:
> On Tue, Aug 14, 2001 at 03:04:18PM +1200, Mark van Walraven wrote:
> > On Sun, Aug 12, 2001 at 08:07:02PM +0100, Joe Thornber wrote:
> > > I would much rather see people wrapping the tools than using liblvm, in fact
> > > liblvm will probably disappear in the future.
> > 
> > I think it is a bad idea to eliminte liblvm.  Shared libraries are much
> > easier use to use from programs.  For example, it is much easier in a perl
> > script to use zlib than to run gzip as a subprocess in a bulletproof way.
> 
> I'm just worried about the interface to liblvm changing and breaking
> tools.  Let's wait a bit to see where experimental goes, and then see
> how much the library had to change.

I don't understand why the library interface would need to change more often than the command
line interface?


-- 
Ragnar
