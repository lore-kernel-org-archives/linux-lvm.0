From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] cronjob and logcheck
Message-Id: <20020212164212.A3728@sistina.com>
References: <20020212152744.GA30150@sky.net>
MIME-Version: 1.0
In-Reply-To: <20020212152744.GA30150@sky.net>; from U.Wiederhold@gmx.net
    on Tue, Feb 12, 2002 at 04:27:44PM +0100
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
Date: Tue Feb 12 09:43:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 12, 2002 at 04:27:44PM +0100, Ulrich Wiederhold wrote:
> Hi,
> I have 2 questions:
> 
> 1. What for is this cron-job?
> */10 *  * * *   root    /sbin/lvmsadc > /var/log/lvm >/dev/null 2>&1

It does io statistics samples on all your logical volumes which
can be retrieved by "lvmsar /var/log/lvm".

> 
> 2. I use logcheck and these msg are annoying:
> Feb 12 14:20:01 home /USR/SBIN/CRON[28697]: (root) CMD (/sbin/lvmsadc >
> /var/log/lvm >/dev/null 2>&1)

Because the cron entry doesn't create any STDOUT/STDERR anyway,
that shouldn't happen.

> 
> Why don't you create some logcheck "information" files in a next
> lvm-version, that display the really important msg and ignore the usual
> ones?

Why don't you deactivate the cron entry for lvmsadc until you really
want logical volume io statistics?

> 
> 
> Thanks.
> Uli
> 
> -- 
> 'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
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
