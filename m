Date: Tue, 18 Sep 2001 12:20:18 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvreduce
Message-ID: <20010918122018.A28031@sistina.com>
References: <Pine.A41.4.31.0109180504240.109452-100000@pascal.math.yorku.ca>
Mime-Version: 1.0
In-Reply-To: <Pine.A41.4.31.0109180504240.109452-100000@pascal.math.yorku.ca>; from lukacs@mathstat.yorku.ca on Tue, Sep 18, 2001 at 05:09:36AM -0400
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

G'abor,

the warning lvreduce displays is ment to make the user aware, that the end
of the LV, which could still hold valid data, will be dropped.

BTW: you can avoid the confirmation with "lvreduce -f".

On Tue, Sep 18, 2001 at 05:09:36AM -0400, G'abor Luk'acs wrote:
> Hi,
> 
> 
> I am in the process of installin Linux 8.0, and I have downloaded and
> compiled lvm version 1.0, I patched the kernel, compiled it, etc. So
> everything semes to work, except for one thing: lvreduce somehow damages
> the whole volume group in a way that it becomes inconsistent.

What does vgck tell you about it?

> 
> Everything else seems to work fine, so I really cannot understand why it
> is happening. The whole message of lvreduce seems to be strange a bit:
> 
> when I am redicing an LV when it is enabled then it askes for
> confirmation, but when I disabled it just to see what happens, it wrote me
> that since it is not active I cannot reduce it.
> 
> I am completely aware to the fact that first I have to resize the FS
> inside, but it is not the question, as resize2fs seems to work pefectly
> well.

Alright.

> 
> Somehow my feeling is that something is wroking with the consistency
> checking mechanism.
> 
> I would really apprecaite if you could advise me about it.
> 
> 
> I am looking forward to hearing from you.
> 
> 
> Thanks in advance,
> 
> Gabor Lukacs
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
