Date: Mon, 10 Sep 2001 13:15:16 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvcreate contiguous flag question
Message-ID: <20010910131516.D31313@sistina.com>
References: <3B9BD5BD.6060606@ida.xs4all.nl>
Mime-Version: 1.0
In-Reply-To: <3B9BD5BD.6060606@ida.xs4all.nl>; from lists@ida.xs4all.nl on Sun, Sep 09, 2001 at 10:49:01PM +0200
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Sep 09, 2001 at 10:49:01PM +0200, Jorg de Jong wrote:
> Hi,
> 
> I created a lv with the option --contiguous y.
> But since my disks are rather full the created lv was NOT contiguous.
> 
> Strange.
> 
> If I try to change the allocation policy from contiguous to next free and to
> contiugues again for this lv, it will fail. It will only let me set it to
> next free. This makes sence since the lv is already fragmented.
> 
> But why is a newly created lv that has a allocation policy contiguous
> but is fragmented non the less not reset to next free ? Or not created at all ?

It shouldn't be silently created next free.

Will check the code...

> 
> regards,
> 
> Jorg de Jong.
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
