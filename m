From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvcreate error
Message-ID: <20030107000654.A10176@sistina.com>
References: <1041637712.1854.10.camel@rich-laptop>
Mime-Version: 1.0
In-Reply-To: <1041637712.1854.10.camel@rich-laptop>; from rturner@san.rr.com on Fri, Jan 03, 2003 at 03:48:31PM -0800
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
Date: Mon Jan  6 17:18:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 03, 2003 at 03:48:31PM -0800, richard turner wrote:
> i am trying to create a pv on an entire disk /dev/hdb with the following
> command:
> pvcreate -ff -y /dev/hdb
> 
> it returns the following error:
> pvcreate --device "/dev/hdb" has a partition table
> 
> fdisk, sfdisk and all other methods prove there is not a partition table
> on /dev/hdb
> 
> using lvm 1.0.1 with mandrake8.2 kernel 2.4.18-6
> 
> what is causing pvcreate to think i have a partition table on /dev/hdb?

The identifier at the end of the first sector.

dd if=/dev/zero of=/dev/hdb bs=512 count=1

should make pvcreate happy ;)

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
