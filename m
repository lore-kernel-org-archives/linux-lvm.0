From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] [ecizhang@sh163.net: help]
Message-ID: <20011217122751.D28720@sistina.com>
References: <20011212191047.C16479@colombina.comedia.it>
Mime-Version: 1.0
In-Reply-To: <20011212191047.C16479@colombina.comedia.it>; from bluca@comedia.it on Wed, Dec 12, 2001 at 07:10:47PM +0100
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
Date: Mon Dec 17 05:27:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Steven,

partitions on software RAID devices are not supported.
Did you really run pvcreate on /dev/md0 directly as you mentioned below?

On Wed, Dec 12, 2001 at 07:10:47PM +0100, Luca Berra wrote:
> ----- Forwarded message from ecizhang@sh163.net -----
> 
> From: ecizhang@sh163.net
> To: Luca Berra <bluca@comedia.it>
> Subject: help
> Date: Wed, 12 Dec 2001 17:15:12 GMT
> X-mailer: Orizone Rockmail System v1.5
> 
> Hi, Sir,
> 
> I successfully create a RAID5 device (with type code 0x8e for the
> partitions ) using "mkraid /dev/md0"
> but when i try to "pvcreate" on /dev/md0, i got an error, which said
> "error parameter".
> All the version of software are the newest, and all are built in
> the kernel of Linux, 
> Can you tell me why? How to solve the problem:
> Create a PV on top of RAID0/1/5?
> 
> Thanks a lot
> Steven 
> 
> ----- End forwarded message -----
> 
> -- 
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
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
