From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] (no subject)
Message-Id: <20020118112816.A32516@sistina.com>
References: <200201170225.g0H2P4805926@kebi.com>
    <20020117115050.GD1066@tykepenguin.com>
    <20020117151328.A26850@sistina.com>
    <20020117151936.GF1066@tykepenguin.com>
    <20020117180111.A27850@sistina.com>
    <20020117172116.GJ1066@tykepenguin.com>
MIME-Version: 1.0
In-Reply-To: <20020117172116.GJ1066@tykepenguin.com>; from
    caulfield@sistina.com on Thu, Jan 17, 2002 at 05:21:16PM +0000
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
Date: Fri Jan 18 04:31:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 17, 2002 at 05:21:16PM +0000, Patrick Caulfield wrote:
> On Thu, Jan 17, 2002 at 06:01:11PM +0100, Heinz J . Mauelshagen wrote:
> > On Thu, Jan 17, 2002 at 03:19:36PM +0000, Patrick Caulfield wrote:
> > > On Thu, Jan 17, 2002 at 03:13:28PM +0100, Heinz J . Mauelshagen wrote:
> > > > 
> > > > Patrick,
> > > > 
> > > > could you proove what Chris pointed out in this thread:
> > > > 
> > > > <begin chris input>
> > > > All of the lvm10 utilities segfault on sparc. The root cause of the 
> > > > problem is that the shared library is compiled with both -fPIC and -pg. On 
> > > > sparc, this results in gcc outputting:
> > > > 
> > > > cc1: warning: -fPIC and profiling conflict: disabling -fPIC
> > > > 
> > > > This can be seen in the buildd logs:
> > > > http://buildd.debian.org/fetch.php?&pkg=lvm10&ver=1.0.1release-1&arch=sparc&stamp=1007871077&file=log&as=raw
> > > > 
> > > > Removing the -pg from the CFLAGS definition on line 73 of make.tmpl fixed 
> > > > the problem -- all LVM utilities worked fine.
> > > > <end chris input>
> > > 
> > > I can confirm that this is true on my box.
> > > 
> > > I removed -pg from make.tmpl.in some time ago (probably in response to a
> > > similar bug report!) but not early enough to reach 1.0.1.
> > 
> > Could you tweak configure for 1.0.2 then, please?
> 
> It's already gone. I see no reason to generate profiling code on users machines. 

True.

Thanks,
Heinz

> 
> patrick
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
