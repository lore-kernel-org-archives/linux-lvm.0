From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] mounting reiserfs snaphost fails
Message-ID: <20020829130219.A32269@sistina.com>
References: <3D6DD029.1010905@dotcom.pl>
Mime-Version: 1.0
In-Reply-To: <3D6DD029.1010905@dotcom.pl>; from myciel@dotcom.pl on Thu, Aug 29, 2002 at 09:41:29AM +0200
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
Date: Thu Aug 29 06:18:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Did you put the VFS lock patch in?
You need that to be able to mount snapshots of *journaled* filesystems.

On Thu, Aug 29, 2002 at 09:41:29AM +0200, myciel wrote:
> Hi All
> 
> I can't mount reisefs snapshot:
> 
> mount: block device /dev/interia/intbackup is write-protected, mounting 
> read-only
> mount: wrong fs type, bad option, bad superblock on /dev/interia/intbackup,
>         or too many mounted file systems
> 
> 
> linux kernel 2.4.19 and lvm utils version 1.05.
> 
> any hints?
> 
> thanks
> 
> rafal
> 
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
