From: Marc Grimme <grimme@atix.de>
Subject: Re: [linux-lvm] ERROR "parameter error" setting up snapshot copy
    on write exception table
Message-Id: <49950000.1011609134@methusalix>
In-Reply-To: <200201201741.g0KHfEX13025@in-cadcae4.ing.temic.de>
References: <200201201741.g0KHfEX13025@in-cadcae4.ing.temic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Date: Mon Jan 21 04:33:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com, Emanuel Quass <emanuel.quass@temic.com>

Last time I had this problem, I just rebooted the machine and everything=20
was back to normal.
But I don't know the reason was and anything.
It just worked after a reboot. Sounds a bit like Windows :-).

--On Sonntag, Januar 20, 2002 18:41:13 +0100 Emanuel Quass=20
<emanuel.quass@temic.com> wrote:

> Hi
>
> I had a very strange error on our Linux-server! Maybe someone can help me
> because it's our production server. I rebooted the Server and afterwards
> I had an error like:
>
> vgchange -- ERROR "parameter error" setting up snapshot copy on write
> exception table for "/dev/datenvg/mailsnap"
>
> I use a 2.4.17 kernel with lvm-1.0.1 I just upgraded from 2.4.9 with "LVM
> version 1.0.1-rc2(30/08/2001)" (thats whats written inside the module)
>
> There are 2 logical columes inside "/dev/datenvg" 1. daten 2. mail and of
> the second lv I made a snapshot. After the reboot ..... (see above)
>
> Is there a chance of getting the data back?
>
> Thanks in advance
>
> 	Emanuel Quass
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html



--

Gruss/Regards,

Marc Grimme

**
ATIX - Gesellschaft f=FCr Informationstechnologie und Consulting mbH
Einsteinstrasse 10
D-85716 Unterschleissheim
Tel.: +49-89 31 78 7 42 4
http://www.atix.de/            http://www.san-time.org/
