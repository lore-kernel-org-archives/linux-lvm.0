From: "'Andreas Dilger'" <adilger@turbolabs.com>
Subject: Re: [linux-lvm] only found 0 of 5120 LEs for LV
Message-ID: <20011130165739.D26775@lynx.no>
References: <C9B993D4214AD511BC010002A537DFE30A8BD5@acsexchweb.corp.acsalaska.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C9B993D4214AD511BC010002A537DFE30A8BD5@acsexchweb.corp.acsalaska.com>; from snay@acsalaska.com on Fri, Nov 30, 2001 at 01:29:24PM -0900
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
Date: Fri Nov 30 17:56:07 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nay, Shawn" <snay@acsalaska.com>
Cc: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On Nov 30, 2001  13:29 -0900, Nay, Shawn wrote:
> Well the pvdata -E output for my drives was empty, no LV's listed.

Well, it sounds like the same bug that Lars had - LV table and part
of PE table were zero'd out.  In his case, there was a backup LV table
that we could use, and rebuilding the PE table was obvious given the
context.

Have you tried vgcfgrestore yet?  Do you get anything useful from
"pvdata -avP <dev>"  on each device?

> This is kind of disappointing.  I have been using LVM under AIX for some
> time and am familiar with the concepts and it's not that complicated.

Well, I was a long time AIX LVM user, and I agree that it was bullet-proof.
The Linux LVM code isn't there yet.  Always have backups.

> -----Original Message-----
> > From: Andreas Dilger [mailto:adilger@turbolabs.com]
> > Send the output of "pvdata -E /dev/whatever" for all the PVs, and we can
> > see if your LV even exists anymore.  If it is overwritten, I'm wondering
> > if this is the same bug as hit Lars.  Maybe related to the recent change
> > to zero out unused parts of the VGDA.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
