From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: software RAID over LVM
Message-Id: <20020201101429.A15135@sistina.com>
References: <20020131211002.29032.qmail@mailshell.com>
MIME-Version: 1.0
In-Reply-To: <20020131211002.29032.qmail@mailshell.com>; from
    lvm@agilecat.mailshell.com on Thu, Jan 31, 2002 at 01:10:00PM -0800
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
Date: Fri Feb  1 03:19:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 31, 2002 at 01:10:00PM -0800, lvm@agilecat.mailshell.com wrote:
> Thanks for all the input.
> 
> I wanted to use software RAID on top of LVM
> because I like the flexibility of giving each
> logical volume their own unique mirror.
> This is one feature in Veritas VxVM that
> I really like.
> 
> I know you have to break the mirrors
> everytime you change the underlying LVs.
> Not considering management issues, I wanted
> to know if it is safe and supposed to work.

In your individual case it is a possibility.
OTOH it is not in 99.9% of production configurations.

Throw bills at us and we can probably help it ;-))

> 
> Thanks.
> 
> Paul
> 
> _______________________________________________________
> The FREE service that prevents junk email http://www.mailshell.com
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
