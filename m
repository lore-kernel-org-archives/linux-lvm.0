From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] NBD-2.4.26
Message-Id: <20020308093838.B519@sistina.com>
References: <20020307141913.34861.qmail@web13008.mail.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <20020307141913.34861.qmail@web13008.mail.yahoo.com>;
    from pdkharche@yahoo.com on Thu, Mar 07, 2002 at 06:19:13AM -0800
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
Date: Fri Mar  8 02:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Mar 07, 2002 at 06:19:13AM -0800, Prashant Kharche wrote:
> Hi!
>    I want to test LVM on a SAN.. But i dont have a
> SAN.. SO im trying to use Network Block Device -
> 2.4.26 to export partitions to other client 
> machines.. if im wrong please correct me.. But when i
> mount the partitions on the client machine..

With mountinge you mean NBD client accessability?

> LVM
> version 1.0.2 is not able to recognize the VG already
> present on that partition.. what should i do now..

Did you run pvcreate on the NBDs?
Did you vgcreate a volume group using them?

> 
> Or is there any other way to emulate a SAN.. 

It doesn't make a SAN to use NBD to access remote block devices
on another machine. You need multiple of those to 'fake' one (IOW:
no specific SAN hardware) plus SAN software like a shared disk filesystem
(for eg. GFS) to really get use out of it.

In order to have a real one you need SAN hardware such us fibre-channel
hubs and the like.
> 
> 
> 
> 
> 
> __________________________________________________
> Do You Yahoo!?
> Try FREE Yahoo! Mail - the world's greatest free email!
> http://mail.yahoo.com/
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
