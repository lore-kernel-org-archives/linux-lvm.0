From: Andre Margis <andre@sam.com.br>
Subject: Re: [linux-lvm] vgscan 1.0.1-rc2 + kernel 2.4.10
Date: Thu, 27 Sep 2001 12:05:15 -0300
References: <Pine.LNX.4.33.0109261252450.23800-100000@ct41987-a.jfrvil1.in.home.com> <01092615474801.01062@dpd16> <3BB2C142.20604@st-peter.stw.uni-erlangen.de>
In-Reply-To: <3BB2C142.20604@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Message-Id: <01092712051501.01050@dpd16>
Content-Transfer-Encoding: 8bit
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
To: linux-lvm@sistina.com

I found the error, my /proc/partitions have thousands and thousands of lines!


maybe a kernel bug!


Thank's


Andre



> have you tried the cvs lvm-1.0.1rc2
> i have it working without PBs with 2.4.10-xfs cvs kernel
>
> Andre Margis wrote:
> >I'm using lvm 1.0.1-rc2 under kernel 2.4.9 and work fine.
> >
> >When using with kernel 2.4.10 vgscan hang, running vgscan -d, the log is
> >listed above:
> >
> ><1> lvm_get_iop_version -- CALLED
> ><22> lvm_check_special -- CALLED
> ><22> lvm_check_special -- LEAVING
> ><1> lvm_get_iop_version -- AFTER ioctl ret: 0
> ><1> lvm_get_iop_version -- LEAVING with ret: 10
> ><1> lvm_lock -- CALLED
> ><22> lvm_check_special -- CALLED
> ><22> lvm_check_special -- LEAVING
> >
> >
> >I have two servers Dell 8450 and they have the same problem.
> >
> >
> >and no more messages
> >
> >
> >
> >Thank's in advance
> >
> >
> >
> >Andre
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@sistina.com
> >http://lists.sistina.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
