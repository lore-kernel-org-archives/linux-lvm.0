From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] LVM and Linux quotas
Message-ID: <20040129022703.GA15422@MAIL.13thfloor.at>
References: <20040127231733.GA25501@oddprocess.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040127231733.GA25501@oddprocess.org>
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
Date: Wed Jan 28 21:28:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jan 27, 2004 at 06:17:33PM -0500, Matthew Daubenspeck wrote:
> First off, please excuse the the newbie question :)
> 
> Does LVM work with the standard Linux quotas? I did some googling and
> found nothing other then people having problems. Does it work?

although there is nothing like 'standard Linux quotas',
because (almost) every filesystem, either brings a bunch 
of quota routines, if not an entire quota system (like xfs) 
with it, or doesn't support quota at all (like jfs), but 
in any case the quota stuff lies somewhere between blocklevel 
and filelevel access, and I don't think that there are many 
possibilities for collisions with something like raid or
lvm/devmapper (which is basically slightly below block level).

the 'standard' filesystem is ext2 (or ext3 nowadays ;) and
the ext2/ext3 quota had some issues for a while, mainly
because it is fairly complex and not widely used. AFAIK
none of those issues where ever related to lvm or md.

to answer your question, yes ext2/ext3 quota and the
journaled quota xfs provides do work on lvm (over raid5)
(at least for me ;)

HTH,
Herbert

> -- 
> :wq!
> 
>   Matthew Daubenspeck
>   http://www.oddprocess.org
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
