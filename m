From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pv_read(): PV identifier invalid
Message-ID: <20020604152322.A17857@sistina.com>
References: <20020530114956.GC1155@kakerlak>
Mime-Version: 1.0
In-Reply-To: <20020530114956.GC1155@kakerlak>; from wodecki@gmx.de on Thu, May 30, 2002 at 01:49:56PM +0200
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
Date: Tue Jun  4 08:28:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 30, 2002 at 01:49:56PM +0200, Wiktor Wodecki wrote:
> Hello,
> 
> can anybody please tell me what the following means:
> 
> kakerlak:~# pvscan 
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ERROR "pv_read(): PV identifier invalid" reading physical volumes

If you don't have any partitions, which are of type Linux LVM, that means
LVM pvscan found some full disk device containing data which (almost) looks
like that of a PV.

You can savely ignore that message unless you've got PVs out there ;-)

> 
> this comes regardless if I have any LVM partitions on my system. On a
> sidenote, my primary master ide disk gets wrong CHS values assigned by
> linux. I did override them with the hda=xxxx,xxx,xx boot paramameter,
> but maybe that's the problem. LVM in Questions is 1.0.4 on kernel
> 2.4.19-pre7 with recent vm patches from andrea, netfilter stuff and a patch for my
> scsi adapter.
> 
> -- 
> Regards,
> 
> Wiktor Wodecki      |    http://johoho.eggheads.org
> wodecki@gmx.de      |    IRC: Johoho@IrcNET



-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
