From: Peter Skensved <peter@sno.Phy.Queensu.CA>
Subject: Re: [linux-lvm] LVM limit on PE's/size?
Message-ID: <20011129114031.A15298@jay.phy.queensu.ca>
References: <200111291636.fATGa3L15288@jay.phy.queensu.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200111291636.fATGa3L15288@jay.phy.queensu.ca>; from MAILER-DAEMON@sno.Phy.Queensu.CA on Thu, Nov 29, 2001 at 11:36:03AM -0500
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
Date: Thu Nov 29 10:38:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

      
>In general you should plan for the largest possible Logical Volume size
>during the lifetime of a Volume Group and set the Physical Extent size
>(vgcreate -s) acordingly. Even though Linux does not support more than 2TB
>per block device today, it will be in the future and you won't suffer from
>the LVM1 constraint ITR.
>
>Regards,
>Heinz    -- The LVM Guy --
>

    Is there any way to change the PE size `after the fact ' ?  I have a
255.99 GB logical volume ( three 80 GB drives ) with PE size set to 4 Mb.
Is there a non-destructive way to increase the PE size so that I can add
more drives ? Or do I have to back everything up and start from scratch ?
                                                   peter

----

Peter Skensved                          Email : peter@SNO.Phy.QueensU.CA
Dept. of Physics,                       Phone:  (613) 533-2676
Queen's University,                     Fax:    (613) 533-6813
Kingston, Ontario,
Canada
