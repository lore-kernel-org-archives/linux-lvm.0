Subject: Re: [linux-lvm] Strange file system errors
From: Jord Tanner <jord@indygecko.com>
In-Reply-To: <20040114234311.GA2199@glorybox.de>
References: <20040114113509.GA745@glorybox.de>
	 <20040114142444.GA2837@redhat.com>  <20040114234311.GA2199@glorybox.de>
Message-Id: <1074125783.18105.55.camel@gecko.indygecko.com>
Mime-Version: 1.0
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
Date: Wed Jan 14 19:17:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Assuming you have IDE drives, it sounds like a write caching problem.
This problem is amplified with the large caches on newer drives. A
sudden power down causes the the data is the cache to be lost. The
kernel doesn't know this has occured, because the drive lies, and claims
that the cache has been flushed, resulting in file system _and_ journal
corruption. 

Try the tests again with write caching off. You can do this with "hdparm
-W0 /dev/hdX"

Jord Tanner

On Wed, 2004-01-14 at 15:43, Kai Weber wrote:
> * Heinz Mauelshagen <mauelshagen@redhat.com>:
> 
> > > system. I have XFS and ext3 partitions. I would like to know, if it is a
> > > LVM problem. 
> > 
> > No.
> 
> Strange! If I do the test on my /boot partition, which is no LVM
> partition, the journal is recovered and the files are not corrupt.
> 
> Any suggestions (if it is no LVM problem) where I could ask about it?
> 
> Regards,
-- 
Jord Tanner <jord@indygecko.com>
