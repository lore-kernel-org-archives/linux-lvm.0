From: "James Kelty" <jamesk@ashlandagency.com>
Subject: RE: [linux-lvm] LVM and 2.4.13
Message-ID: <JLEILPHBKFODIOEDIAKMIELCCHAA.jamesk@ashlandagency.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <000601c1617b$96dfde10$0101a8c0@mdmiller.com>
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
Date: Tue Oct 30 15:25:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thanks to everyone!  The optimization changes worked perfectly.

-James


-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
Behalf Of Mitch Miller
Sent: Tuesday, October 30, 2001 11:47 AM
To: linux-lvm@sistina.com
Subject: RE: [linux-lvm] LVM and 2.4.13


James,

> When I try to create the logical volume,
> I get a Seg Fault and core dump.

Take a look at Sistina's web page, and search Bugzilla for core dump.  There
is a documented issue with the version of GCC you are using, which is
happening because of broken compiler optimizations.  As I recall, there are
two workarounds.  First, you can edit your make file, and change -O2 to -O
or you can edit the source and add a printf() statement inside the function
which the compiler is to optimize by making it an inline function.

I chose the 2nd fix so I didn't have to get rid of all optimizations, but
that fix has to be applied in a number of places to make sure that all
command line tools get fixed appropriately.  The first fix has the benefit
of being changed in one place, and the entire works after recompilation, at
the cost of compiler optimization.

-- Mitch

P.S.  Seems like there is also another version of GCC which you can use, but
I don't know which one.



_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
