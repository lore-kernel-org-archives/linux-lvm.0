Date: Tue, 28 Aug 2001 17:38:28 +0100
Subject: Re: [linux-lvm] Bug in the min and max macros in lvm-snap.c
Message-ID: <20010828173828.A1414@btconnect.com>
References: <00aa01c12fc9$5f3cda00$3300a8c0@local> <20010828171909.B338@dardhal.mired.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010828171909.B338@dardhal.mired.net>; from jdomingo@internautas.org on Tue, Aug 28, 2001 at 05:19:09PM +0000
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

On Tue, Aug 28, 2001 at 05:19:09PM +0000, Jos? Luis Domingo L?pez wrote:
> On Tuesday, 28 August 2001, at 07:57:20 -0600,
> Hostmaster (www) wrote:
> 
> > Hi,
> > 
> > I'm installing the lvm_1.0.1-rc1 patch to a RedHat install (kernel 2.4.3-12).
> > 
> > After installing the kernel patch, the kernel build was failing on the min and max macros in lvm-snap.c.
> >
> Maybe I'm wrong, but AFAIR Linus changed max and min macros on 2.4.9, so
> they are not backwards compatible. As lvm_1.0.1-rc1 was intended for
> kernel 2.4.9, I suppose it used those new max/min macros, so LVM 1.0.1-rc1
> doesn't work with kernels < 2.4.9.

It should work with both 2.4.9 kernels and older ones.  I just checked
CVS and the lvm-snap.c looks correct.
