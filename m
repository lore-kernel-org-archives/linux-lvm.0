From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm and Debian
Message-Id: <20020118140222.B794@sistina.com>
References: <E16RWI7-00083Z-00@arwen.dev33.cvf>
    <20020118104418.GA29876@balu.kawo2.rwth-aachen.de>
    <E16RWih-0000HQ-00@arwen.dev33.cvf>
    <20020118115639.GA30348@balu.kawo2.rwth-aachen.de>
MIME-Version: 1.0
In-Reply-To: <20020118115639.GA30348@balu.kawo2.rwth-aachen.de>;
    from mdobel@kawo2.rwth-aachen.de on Fri, Jan 18, 2002 at 12:56:39PM +0100
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
Date: Fri Jan 18 07:06:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 18, 2002 at 12:56:39PM +0100, Markus Dobel wrote:
> On Fri, Jan 18, 2002 at 11:58:03AM +0100, Pierrick PONS wrote:
> >
> > There's a thing I don't understand : is the lvm_1.0.1rc4 patch still in the 
> > 2.4.17 kernel or do I have to patch my 2.4.17 kernel to use lvm and lvm 
> > commands ?
> 
> There is some kind of LVM 1.0.1rc4 (therefore called 1.0.1rc4(ish)) in
> kernel 2.4.17.
> 
> > I thought that using a 2.4.17 kernel permitted to have lvm fonctionalities and 
> > not to be obliged to patch the kernel.
> 
> No, you don't *need* to patch the kernel to have LVM. It's in the
> kernel, just in an older version.

In case you want to go with LVM 1.0.1 (which is the actual release you
can get from www.sistina.com) and want to have the recent driver fixes
in the kernel as well, you still need to patch it following the instructions
in INSTALL and PATCHES/README.
1.0.1 for eg. addresses devfs and unresolved symbol issues.

> 
> Regards, Markus
> 
> -- 
> Free the Fluffy Bunny.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
