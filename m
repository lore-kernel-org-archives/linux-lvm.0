Subject: Re: [linux-lvm] XFS crash on lvm
From: Christophe Zwecker <doc@zwecker.de>
In-Reply-To: <1017874608.931.1426.camel@jen.americas.sgi.com>
References: <1017872898.18631.8.camel@dumbo.zwecker.de>
    <1017874608.931.1426.camel@jen.americas.sgi.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1017908119.5373.3.camel@fry.sysctl-office.de>
MIME-Version: 1.0
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
Date: Thu Apr  4 02:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Steve Lord <lord@sgi.com>
Cc: linux-lvm@sistina.com

im gonna kill myself!  :-)

the 200gb volume was made of a 160gb and  a 40 gb partition. I order for
the kernel to see the whole 160gb I had applied the ide patch to the
kernel, which I forgot to apply to 2.4.18!!

so now Im rebuilding 2.4.18-xfs with new ide driver, pretty sure
everything be back after reboot, I alrady had used the xfs patch from
below.

damn, Im stupid :-)

thx for your help anyways, you mentioning the patch made it click :-.)

regards,

Christophe

On Thu, 2002-04-04 at 00:56, Steve Lord wrote:
> On Wed, 2002-04-03 at 16:28, Christophe Zwecker wrote:
> > Hi,
> > 
> > I use 2.4.18-xfs with lvm-tools-1.0.1rc4_iop10-fr2
> > lvm-base-1.2-fr1
> > 
> > I havw a 200GB lv. I had 2.4.16 running after fiddling with usb the
> > whole machine crashed, reboot, the fs was corrupt. I had to zerosize the
> > journal log, xfs_repair, everything in lost+found.
> 
> Are you running on ide with write caching enabled? corruption after a
> crash is possible in that configuration. Also the forced shutdown path
> did used to corrupt the filesystem, so once you hit a forced shutdown
> it is possible to end up with a zeroed superblock and lose your root
> directory too. That is fixed in current code - which is difficult to get
> right now. There are ftp mirrors, here is one:
> 
> 	ftp://ftp.thebarn.com/mirror/SGI


Christophe Zwecker                     mail: doc@zwecker.de
Hamburg, Germany                        fon: +49 179 3994867
http://www.zwecker.de

"Who is General Failure ?  And why is he reading my disk ??"
