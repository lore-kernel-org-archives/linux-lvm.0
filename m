From: Andreas Dilger <adilger@turbolabs.com>
Date: Wed, 5 Sep 2001 12:32:11 -0600
Subject: Re: [linux-lvm] PBs with LVM over software RAID ( and XFS ? ext2 reiserfs?)
Message-ID: <20010905123211.J32553@turbolinux.com>
References: <B45465FD9C23D21193E90000F8D0F3DF404FF5@mailsrv.linkvest.com> <3B95E36E.6070703@st-peter.stw.uni-erlangen.de> <20010905120549.H32553@turbolinux.com> <3B966C63.7080309@st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B966C63.7080309@st-peter.stw.uni-erlangen.de>
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

On Sep 05, 2001  20:18 +0200, svetljo wrote:
> i was writing to Nail Brown about the XFS mount problem  but i think he 
> stop writing to me after i couldn't recreate the problem
> 
> which kernel should i test 2.4.5 2.4.6 2.4.7

If you had one that previously worked, then start with that one and
work forwards until it stops working (maybe dividing the kernel version
numbers in half for each try to narrow it down quicker).

If you have never had this working properly, try some early kernel like
2.4.5 and see if it works.  If not then I suspect you have a RAM problem,
and you may want to swap/remove SIMM/DIMMs to see if you can isolate it.

There is a whole document in linux/Documentation/, like Oops-tracing.txt,
BUG-HUNTING, etc.

Nobody HAS to help you with this problem (and it seems the Sistina
folks are quiet on this issue) because you are not paying them anything.
That is one of the good/bad features of Linux - you can _usually_ get
free support for a problem, but you may have to do it yourself too.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
