From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM non-bug: md10 and higher broken
Message-Id: <20020204190858.GB17405@colombina.comedia.it>
References: <003a01c1ad59$54e409d0$216410ac@tao.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <003a01c1ad59$54e409d0$216410ac@tao.co.uk>
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
Date: Mon Feb  4 13:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 04, 2002 at 08:52:53AM -0000, William Blunn wrote:
> Doesn't seem to be a bug in LVM, but it seems that the problem is
> tickled when migrating from a multiple-MD-devices system to an LVM
> system.
> 
> LVM 1.0.1 / kernel 2.2.20
> 
> I am using /dev/md0 through /dev/md10 for my existing (non-LVM) system.
> 
> I put in additional disks, set them up on /dev/md11, and created a PV on
> /dev/md11.
I wouldn't bet my data on 2.2.x device stacking code, while
i am sure that 2.4 works.
your mileage may vary

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
