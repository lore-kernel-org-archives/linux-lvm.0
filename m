Message-Id: <200201211146.g0LBkui23525@in-cadcae4.ing.temic.de>
From: Emanuel Quass <emanuel.quass@temic.com>
Subject: Re: [linux-lvm] ERROR "parameter error" setting up snapshot copy
    on write exception table
References: <200201201741.g0KHfEX13025@in-cadcae4.ing.temic.de>
    <49950000.1011609134@methusalix>
In-Reply-To: <49950000.1011609134@methusalix>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Date: Mon Jan 21 05:47:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Marc Grimme <grimme@atix.de>, linux-lvm@sistina.com

Hi

I rebooted the server several times (and tried several kernel-versions) but 
every time I got the same error!
The problem is (afaik see) the snapshot. I think if I can get rid of the 
snapshot everything will work all right. But I am not able to remove the 
snapshot because the Volumegroup is not active ...... 

Is there a way to remove the snapshot (the volumegroup can't be made active) 
without touching the other logical volumes ?


Am Montag, 21. Januar 2002 11:32 schrieb Marc Grimme:
> Last time I had this problem, I just rebooted the machine and everything
> was back to normal.
> But I don't know the reason was and anything.
> It just worked after a reboot. Sounds a bit like Windows :-).
>
> --On Sonntag, Januar 20, 2002 18:41:13 +0100 Emanuel Quass
>
> <emanuel.quass@temic.com> wrote:
> > Hi
> >
> > I had a very strange error on our Linux-server! Maybe someone can help me
> > because it's our production server. I rebooted the Server and afterwards
> > I had an error like:
> >
> > vgchange -- ERROR "parameter error" setting up snapshot copy on write
> > exception table for "/dev/datenvg/mailsnap"
> >
> > I use a 2.4.17 kernel with lvm-1.0.1 I just upgraded from 2.4.9 with "LVM
> > version 1.0.1-rc2(30/08/2001)" (thats whats written inside the module)
> >
> > There are 2 logical columes inside "/dev/datenvg" 1. daten 2. mail and of
> > the second lv I made a snapshot. After the reboot ..... (see above)
> >
> > Is there a chance of getting the data back?
> >
> > Thanks in advance
> >
> > 	Emanuel Quass
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

+++++++++++++++++++++++++++++++++++

Conti TEMIC microelectronic GmbH

+++++++++++++++++++++++++++++++++++
Emanuel Quass
Ringlerstrasse 17
D-85057 Ingolstadt
phone : +49 841 881 2798
fax   : +49 841 881 2550
email :  emanuel.quass@temic.com
+++++++++++++++++++++++++++++++++++
