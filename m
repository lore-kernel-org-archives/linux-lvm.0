Message-ID: <04f401c3255c$42401220$fc6a6d0a@corp.int.digex.com>
From: "Anastasios A. Papadopoulos \(Tas\)" <vze2sjj7@verizon.net>
References: <047501c3254d$6066b880$fc6a6d0a@corp.int.digex.com> <20030528194851.GG449@fib011235813.fsnet.co.uk>
Subject: Re: [linux-lvm] Building LVM 2 -- More information
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Wed May 28 16:00:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Yep.  It is RH 8, 2-4.20(-13.8).

I beg your indulgence while I show my ignorance;  How would I go about
building it not as a module?
Is there a guide somewhere I can follow?

Thanks
----- Original Message ----- 
From: "Joe Thornber" <thornber@sistina.com>
To: <linux-lvm@sistina.com>
Sent: Wednesday, May 28, 2003 3:48 PM
Subject: Re: [linux-lvm] Building LVM 2 -- More information


> On Wed, May 28, 2003 at 03:14:35PM -0400, Anastasios A. Papadopoulos (Tas)
wrote:
> >
> > ----- Original Message ----- 
> > From: Anastasios A. Papadopoulos (Tas)
> > To: linux-lvm@sistina.com
> > Sent: Wednesday, May 28, 2003 10:42 AM
> > Subject: Building LVM 2
> >
> >
> > I'm having a little trouble following directions:
> >
> > I'm trying to build a new kernel with 'dm'.
> >
> > Should I be issuing the 'make modules modules-install' after building
the
> > new kernel or not.
>
> If you are building dm as a module, yes.
>
> > I am getting the following errors during "make modules"
>
> The patches we provide have only been tested against a vanilla kernel
> tree, if you are trying to patch a redhat kernel you may have to do a
> little more work.  Which kernel are you patching ?
>
> - Joe
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
