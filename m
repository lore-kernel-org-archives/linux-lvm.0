Return-Path: <thornber@btconnect.com>
Date: Fri, 13 Jul 2001 09:39:46 +0100
Subject: Re: [linux-lvm] Oops ...
Message-ID: <20010713093946.C1563@btconnect.com>
References: <003601c10af5$102a56c0$0f01a8c0@ws1>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <003601c10af5$102a56c0$0f01a8c0@ws1>; from list@showme.wox.org on Thu, Jul 12, 2001 at 07:06:59PM +0200
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

All,

Do not use the current CVS code on existing VG's, and certainly not on
production systems.  I thought this had been mentioned on the list
before.

Changes have been made to the PE locations !

Bas: you need to roll back your tools to beta7, the CVS kernel driver
should be ok.

- Joe

On Thu, Jul 12, 2001 at 07:06:59PM +0200, Bas wrote:
> Hi,
> 
> I'm afraid I'm not able to get more details right now, if necessary I'll get
> 'm later on, but I don't like playing with my filesystems ...
> 
> Kernel 2.4.6
> CVS LVM of 11 July 2001
> an XFS enabled kernel
> devfs 1.82.
> 
> Boots fine, loads the LVM driver, but after it oopses after running
> vgchange -a y (line 4, linuxrc).
> 
> What can I do ?
> 
> Thanks,
> Bas.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
