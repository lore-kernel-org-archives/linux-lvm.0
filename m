From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm 0.8 to 1.0 transition?
Message-Id: <20020227102700.C19249@sistina.com>
References: <3C7BC9BB.F1ABAC3@fl.priv.at>
MIME-Version: 1.0
In-Reply-To: <3C7BC9BB.F1ABAC3@fl.priv.at>; from fl@fl.priv.at on Tue,
    Feb 26, 2002 at 06:45:31PM +0100
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
Date: Wed Feb 27 03:27:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 26, 2002 at 06:45:31PM +0100, Friedrich Lobenstock wrote:
> Anything special I have to take care if I make a transition from
> lvm 0.8 to lvm 1.0? 
> 
> Otherwise I would do the same as described in
> http://www.sistina.com/lvm_howtos/lvm_howto/Moving_a_volume_group_to_.html

In case you just want to update your LVM software, you don't need to
vgexport/vgimport your VGs as described under that URL.

Presuming that you took backups of your data and metadata (/etc/lvmconf/*)
and don't have root on a LV, you just need to install the new LVM software
(take LVM 1.0.3!), and run "vgscan;vgchange -ay" after the successfull
installation and reboot. "vgscan;vgchange -ay" is probably in your system
startup script anyway.

To be save, you could copy your LVM 0.8 software to /sbin/lvm-0.8 (tools) and
/lib/lvm-0.8 (library) respectively. Make your LVM 0.8 capable kernel
bootable too.

With these preperations, you still can boot into single user for LVM 0.8
recovery in case something goes wrong.

> 
> 
> -- 
> MfG / Regards
> Friedrich Lobenstock
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
