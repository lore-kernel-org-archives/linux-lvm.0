From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm metadata
Message-ID: <20031111160213.F28265@sistina.com>
References: <200311111144.36636.benoit.peccatte@enst-bretagne.fr>
Mime-Version: 1.0
In-Reply-To: <200311111144.36636.benoit.peccatte@enst-bretagne.fr>; from benoit.peccatte@enst-bretagne.fr on Tue, Nov 11, 2003 at 11:44:36AM +0100
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
Date: Tue Nov 11 09:03:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benoit <benoit.peccatte@enst-bretagne.fr>
Cc: mge@sistina.com, linux-lvm@sistina.com

On Tue, Nov 11, 2003 at 11:44:36AM +0100, Benoit wrote:
> Hello,
> 
> I'm wondering why lvm metadata isn't stored directly into physical volumes. It 
> would then be possible to read it without having acces to any filesystem. 

It is.

> You may ask why. Then is my second question, why aren't vgscan and vgchange 
> implemented in kernel and called at boot time ? This would make us be able to 
> consider logical volumes as standard partitions and mount them easily, even 
> as /

That's what an initrd/initramfs is for ;)

> 
> Thank you,
> Benoit.
> 
> PS: Please cc-me with the anser as I'm not subscribed to the list.
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
