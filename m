From: Andreas Dilger <adilger@turbolabs.com>
Date: Mon, 3 Sep 2001 21:53:00 -0600
Subject: Re: [linux-lvm] PBs with LVM over software RAID ( and XFS ? ext2 reiserfs?)
Message-ID: <20010903215300.B32553@turbolinux.com>
References: <3B8E3F0E.8050609@st-peter.stw.uni-erlangen.de> <20010830083546.A20989@sistina.com> <3B8EC633.40202@st-peter.stw.uni-erlangen.de> <3B8F8C5E.7030603@st-peter.stw.uni-erlangen.de> <20010831110512.V541@turbolinux.com> <3B90C9A4.3080005@st-peter.stw.uni-erlangen.de> <3B90EC90.4050606@st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B90EC90.4050606@st-peter.stw.uni-erlangen.de>
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
Cc: linux-xfs@oss.sgi.com, akpm@zip.com.au, neilb@cse.unsw.edu.au

On Sep 01, 2001  16:11 +0200, svetljo wrote:
> clean Linus kernel-2.4.9  LVM-1.0.1rc1                    ext2 and 
> reiserfs segfaults
> clean            linux-2.4.9-ac5 LVM-1.0                        ext2 and 
> reiserfs segfaults
>                   | linux-2.4.10-pre2-xfs LVM-1.0.1rc2      ext2 and 
> reiserfs segfaults, but xfs seems to work
>                   | from SGI's cvs tree  linux-2.4-xfs taken today in 
> the early morning

Is it possible that you are having memory problems?  Did this work with
earlier kernels and it now only fails with 2.4.9?  Have you tried running
with memtest86 to check your RAM?  It seems like you are having too many
problems with different filesystems.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
