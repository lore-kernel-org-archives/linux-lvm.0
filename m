From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Invalidate: Busy Buffer
Message-ID: <20011107143338.A6920@sistina.com>
References: <20011107093717.ZIE13894.fep32-svc.tin.it@[127.0.0.1]>
Mime-Version: 1.0
In-Reply-To: <20011107093717.ZIE13894.fep32-svc.tin.it@[127.0.0.1]>; from mikyy@tin.it on Wed, Nov 07, 2001 at 10:37:17AM +0100
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
Date: Wed Nov  7 07:37:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Nov 07, 2001 at 10:37:17AM +0100, mikyy@tin.it wrote:
> Hello,
> 
> I am running a "clean" 2.4.13 kernel patched with the latest LVM tools (LVM 1.0.1-rc4) and compiled (as a module) with gcc 3.0 on Suse 7.1 with reiserfs 3.6.x filesystems and I am getting a "invalidate: busy buffer" message..

Older kernels were quiet about this.
No negative impact on LVM/your data is caused by this.

We'll check, if we need the invalidation still...

> I tryed to search if anyone posted a similar message but did not find the answer.
> 
> Could you please help me?
> Please cc me as I am not subscribed to this mailing list.
> 
> Thanks and cheers,
> 
> Michele
> 
> 
> 
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
