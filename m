Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104301544.JAA10700@lynx.turbolabs.com>
Subject: Re: [linux-lvm] New details on VGScan crash on 2.4.4
Date: Mon, 30 Apr 2001 09:44:43 -0600 (MDT)
In-Reply-To: <3AED170B.D5483465@gecpalau.com> from "Glenn Shannon" at Apr 30, 2001 04:40:59 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

Glenn writes:
> Well, after much deliberation as to how BADLY I needed a /usr partition
> under 2.4.4....
> 
> I booted it in single-user (blech) under 2.4.4 and ran vgscan and got:
> 
> segmentation fault
> 
> So I went about investigating as to whether I could get more info than
> that.....
> 
> vgscan -d >& vgscan.log generated the textfile vgscan1.txt I am
> attaching to this email...hopefully it sheds some light (?)

Looks like you have devfs configured but not mounted.  You really need to
mount devfs before running vgscan.  Also, you are far better off to not
use devfs and LVM at the same time.

Granted, this is no reason for vgscan to segfault, but it may fix your
problem.

Cheers, Andreas
-- 
Andreas Dilger                               TurboLabs filesystem development
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
