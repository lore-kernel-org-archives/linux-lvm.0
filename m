Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] Updated patch VFS-lock for 2.4.18+ XFS enabled
    kernels
References: <Pine.LNX.4.21.0204030944360.30084-100000@miami.datech2.er.heitec.net>
In-Reply-To: <Pine.LNX.4.21.0204030944360.30084-100000@miami.datech2.er.heitec.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16shNR-0008V7-00@hermes.sistina.com>
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
Date: Wed Apr  3 03:49:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, Holger Rauch <Holger.Rauch@heitec.de>

On Wed, 3 Apr 2002 17:52, Holger Rauch wrote:
> Hi!
>
> I tried your patch on a 2.4.18 kernel with XFS, but I got the following
> error during the linking phase
>
> fs/fs.o: In function `fsync_dev_lockfs':
> fs/fs.o(.text+0x2918): undefined reference to `DQUOT_SYNC_DEV'
>
> During compilation, I also got a warning about an implicit declaration of
> DQUOT_SYNC_DEV.
>
> I could apply the patch with no problems, however.
>
> What went wrong here? How can I get rid of these errors?
>
> Any help will be greatly appreciated!

I'm sorry to hear that your having problems.  It appears that your 2.4.18-xfs 
kernel doesn't have the new Quota code.

Where did you get your 2.4.18-xfs kernel from?  Is it from SGI XFS CVS? or 
from the official split patches? or another source?

If is is from the official split patches did you include the 
xfs-2.4.18-split-quota32 patch?  It appears that oss.sgi.com is down at the 
moment so I cannot check the current file name.

Nathan Scott has advised me that I should change the name of the patch anyway 
as it relates to any kernel that has the new Quota code not just the XFS 
kernel.

>
> Greetings,
>
> 	Holger
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
Adrian Head

(Public Key available on request.)
