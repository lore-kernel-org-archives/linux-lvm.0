From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] (no subject)
Message-Id: <20020117151328.A26850@sistina.com>
References: <200201170225.g0H2P4805926@kebi.com>
    <20020117115050.GD1066@tykepenguin.com>
MIME-Version: 1.0
In-Reply-To: <20020117115050.GD1066@tykepenguin.com>; from
    caulfield@sistina.com on Thu, Jan 17, 2002 at 11:50:50AM +0000
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
Date: Thu Jan 17 08:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Patrick,

could you proove what Chris pointed out in this thread:

<begin chris input>
All of the lvm10 utilities segfault on sparc. The root cause of the 
problem is that the shared library is compiled with both -fPIC and -pg. On 
sparc, this results in gcc outputting:

cc1: warning: -fPIC and profiling conflict: disabling -fPIC

This can be seen in the buildd logs:
http://buildd.debian.org/fetch.php?&pkg=lvm10&ver=1.0.1release-1&arch=sparc&stamp=1007871077&file=log&as=raw

Removing the -pg from the CFLAGS definition on line 73 of make.tmpl fixed 
the problem -- all LVM utilities worked fine.
<end chris input>

Thanks,
Heinz

On Thu, Jan 17, 2002 at 11:50:50AM +0000, Patrick Caulfield wrote:
> On Thu, Jan 17, 2002 at 11:25:04AM +0900, Sil Lee wrote:
> >    Hi.
> > 
> >    I Have a problem to use LVM on Sun Sparc 20...
> >    when I try to perform a pvcreate a segmentation fault error
> >    occur.
> > 
> 
> Hmmm, it's not getting very far. In fact it's not even getting into pvcreate at
> all - that strace output is just getting the shared libraries mapped in and
> starting libc.
> 
> I'm actually impressed you got that far - I've never managed to get Linux 2.4 to
> run successfully on a 32bit SPARC machine.
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
