Date: Thu, 11 Oct 2001 16:31:44 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] core dump - lvcreate
Message-ID: <20011011163144.C8752@sistina.com>
References: <3BC5A7D4.73EE8414@megacinema.com>
Mime-Version: 1.0
In-Reply-To: <3BC5A7D4.73EE8414@megacinema.com>; from mohan@megacinema.com on Thu, Oct 11, 2001 at 08:08:20AM -0600
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

Mohan,

please swicth optimization off in LVMs configure script and
regenerate/reinstall. This is caused by known optimzer flaw.

FYI: Recent LVM CVS has optimization off by default.

On Thu, Oct 11, 2001 at 08:08:20AM -0600, Mohan Reddy Amasa wrote:
> Hi Guys,
> Is this problem fixed in the latest code base? I created a bug 305 in
> bugzilla. Not sure what is my next step.
> Thanks
> Mohan
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
