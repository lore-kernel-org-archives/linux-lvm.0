Date: Thu, 23 Aug 2001 17:20:42 +0100
Subject: Re: [linux-lvm] min() and max() problems with 2.4.8 and 1.0.1
Message-ID: <20010823172041.A1701@btconnect.com>
References: <B45465FD9C23D21193E90000F8D0F3DF0178FD08@mailsrv.linkvest.com> <20010823172746.A2020@totoro.ovh.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010823172746.A2020@totoro.ovh.net>; from totoro@ovh.net on Thu, Aug 23, 2001 at 05:27:46PM +0200
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

On Thu, Aug 23, 2001 at 05:27:46PM +0200, Totoro wrote:
> On Thu, Aug 23, 2001 at 11:36:37AM +0200, Jean-Eric Cuendet wrote:
> > 
> > Hi,
> > I just patched my kernel with 1.0.1rc1 and have problems with min() and
> > max() functions. They are not found in lvm.c and lvm-snap.c .
> > 
> > FYI, I have also ext3, acls and quota3 patches applied. Could they make
> > that?
> No, the 1.0.1rc1 is against 2.4.9 and uses the new min() and max()
> created by Linus.
> I don't know if 1.0.1rc1 was maid to be compatible with 2.4.8.
> 1.0.0 works fine on 2.4.8.

I put this code in to support older kernels:

#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 4, 9)
#undef min
#undef max
#define min(type, a, b) (((a) < (b)) ? (a) : (b))
#define max(type, a, b) (((a) > (b)) ? (a) : (b))
#endif

I tested 2.4.8 and Alasdair tested 2.4.7.

- Joe
