Message-ID: <85063BBE668FD411944400D0B744267A8885F8@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] vgscan 1.0.1-rc2 + kernel 2.4.10
Date: Wed, 26 Sep 2001 17:57:16 -0500
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Also, I get this message as someone other than root, but looks EXACTLY like
what you've posted. 

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: Gonyou, Austin [mailto:austin@coremetrics.com]
> Sent: Wednesday, September 26, 2001 5:53 PM
> To: 'linux-lvm@sistina.com'
> Subject: RE: [linux-lvm] vgscan 1.0.1-rc2 + kernel 2.4.10
> 
> 
> I only get this when I run the command as someone other than root. 
> 
> -- 
> Austin Gonyou
> Systems Architect, CCNA
> Coremetrics, Inc.
> Phone: 512-796-9023
> email: austin@coremetrics.com 
> 
> > -----Original Message-----
> > From: Andre Margis [mailto:andre@sam.com.br]
> > Sent: Wednesday, September 26, 2001 1:48 PM
> > To: linux-lvm@sistina.com
> > Subject: [linux-lvm] vgscan 1.0.1-rc2 + kernel 2.4.10
> > 
> > 
> > I'm using lvm 1.0.1-rc2 under kernel 2.4.9 and work fine.
> > 
> > When using with kernel 2.4.10 vgscan hang, running vgscan -d, 
> > the log is 
> > listed above:
> > 
> > <1> lvm_get_iop_version -- CALLED
> > <22> lvm_check_special -- CALLED
> > <22> lvm_check_special -- LEAVING
> > <1> lvm_get_iop_version -- AFTER ioctl ret: 0
> > <1> lvm_get_iop_version -- LEAVING with ret: 10
> > <1> lvm_lock -- CALLED
> > <22> lvm_check_special -- CALLED
> > <22> lvm_check_special -- LEAVING
> > 
> > 
> > I have two servers Dell 8450 and they have the same problem.
> > 
> > 
> > and no more messages
> > 
> > 
> > 
> > Thank's in advance
> > 
> > 
> > 
> > Andre
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
