From: Holger Rauch <Holger.Rauch@heitec.de>
Subject: Re: [linux-lvm] Updated patch VFS-lock for 2.4.18+ XFS enabled
    kernels
In-Reply-To: <20020403095008.1FD14B8206@christel.heitec.net>
Message-Id: <Pine.LNX.4.21.0204031731490.30983-100000@miami.datech2.er.heitec.net>
MIME-Version: 1.0
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
Date: Wed Apr  3 09:40:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>
Cc: linux-lvm@sistina.com

Hi Adrian!

Thanks a lot for your reply! I was able to fix my problem by substituting
DQUOT_SYNC by DQUOT_SYNC_DEV in include/linux/quotaops.h and
fs/buffer.c. I simply did a

find . -name "*.[ch]" | xargs grep -n DQUOT_SYNC

starting from /usr/src/linux. (I think somebody else mailed this already). 

On Wed, 3 Apr 2002, Adrian Head wrote:

> I'm sorry to hear that your having problems.  It appears that your 2.4.18-xfs 
> kernel doesn't have the new Quota code.

Indeed, it doesn't. I was overlooking that your patch is only for kernels
with the new quota code in your previous mail. Sorry.

> Where did you get your 2.4.18-xfs kernel from?  Is it from SGI XFS CVS? or 
> from the official split patches? or another source?

It is the 2.4.18 kernel coming with Debian testing (Woody) with the
included xfs and evms patches applied.

> If is is from the official split patches did you include the 
> xfs-2.4.18-split-quota32 patch?  It appears that oss.sgi.com is down at the 
> moment so I cannot check the current file name.

You don't have to, but thanks anyway for your help.

> [..] 
> Nathan Scott has advised me that I should change the name of the patch anyway 
> as it relates to any kernel that has the new Quota code not just the XFS 
> kernel.

If it for any kernel having the new quota code, then this is probably a
good idea.

Greetings,

	Holger
