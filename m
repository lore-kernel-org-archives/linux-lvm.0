From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] LVM1 & XFS
Message-Id: <20020202225744.P763@lynx.adilger.int>
References: <E16XErl-0007zh-00@hermes.sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16XErl-0007zh-00@hermes.sistina.com>; from
    ahead@bigpond.net.au on Sun, Feb 03, 2002 at 03:07:20PM +1000
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
Date: Sun Feb  3 00:03:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Head <ahead@bigpond.net.au>
Cc: linux-xfs@oss.sgi.com, linux-lvm@sistina.com

On Feb 03, 2002  15:07 +1000, Adrian Head wrote:
> There still seems to be problems as I can run the tests by hand successfully 
> but as soon as I put the commands in a script I get Oopses.

Well, running the oops through ksymoops and posting it would be a good
start to figuring out where the problems are.

> The question I would like to ask any LVM gurus is why would there be a 
> difference between running the tests by hand and running them in a script?

Timing issues.  Maybe it isaccessing memory that has been freed already.
Maybe it isn't getting a lock on some stuct and if you do it slowly, the
operation has a chance to complete before another one deletes the struct.
Who knows, the ksymoops output will hopefully point us where to look.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
