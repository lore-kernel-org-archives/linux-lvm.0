From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LV size increase
Message-ID: <20020816120104.A12990@sistina.com>
References: <000a01c2448e$cadcfbc0$ed9d70d5@o3games.com>
Mime-Version: 1.0
In-Reply-To: <000a01c2448e$cadcfbc0$ed9d70d5@o3games.com>; from jesava@mail.com on Thu, Aug 15, 2002 at 09:05:59PM +0200
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
Date: Fri Aug 16 05:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 15, 2002 at 09:05:59PM +0200, Josef Chlapowski wrote:
> Hi,
> 
> I just got more drives and want to add them to my volume but the max lv size of that volume is 1TB and the current size is like 900GB already so I can not add the new ones because of the size limit.

Even though LVs are limited to 1TB in your configuration, you can still add
new PVs to that VG making it larger than 1TB.
In that case you can have multiple LVs up to 1TB in size.

> Is it possible to change the max LV size without loosing any data?

No :-(

That's why you need to plan for your maximum LV size
requirements at VG creation.

> 
> Thanks i.A
> 
> - Josef

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
