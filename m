From: Andreas Dilger <adilger@turbolabs.com>
Date: Tue, 2 Oct 2001 15:17:51 -0600
Subject: Re: [linux-lvm] Re: linux2.4.10/lvm1.0.1rc3 does not compile
Message-ID: <20011002151751.O8954@turbolinux.com>
References: <20011002200722.18323.qmail@web14404.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011002200722.18323.qmail@web14404.mail.yahoo.com>
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

On Oct 02, 2001  13:07 -0700, Aman Shahi wrote:
> If I am not mistaken. the function 
> static void __upadte_hardsectsize(lv_t *lv) 
> has been declared and called as it is in lvm.c. But in
> the definition it has been written as 
> static void __update_hardblocksize(lv_t *lv)
> 
> so changing __update_hardblocksize(lv_t *lv)
> in ~/LVM/1.0.1-rc3/kernel/lvm.c and
> ~linux-2.4.10/drivers/md/lvm.c 
> to  __update_hardsectsize(lv_t *lv)
> should resolve this compilation problem.

Yes, this is my fault.  I was moving over some minor changes from my
other LVM tree and trying to generate a patch for Linus, but I must
have made a mistake in search & replace of variable names hitting this
function name as well.  Ah, the joys of having so many LVM source trees
to work with.

I've fixed the CVS, if someone wants to make a new -rc4 release quickly.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
