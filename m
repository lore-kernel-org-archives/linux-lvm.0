From: Andreas Dilger <adilger@turbolabs.com>
Date: Wed, 12 Sep 2001 17:21:02 -0600
Subject: Re: [linux-lvm] LVM
Message-ID: <20010912172102.B1541@turbolinux.com>
References: <20010912160743.5D20E4326@oscar.casa.dyndns.org> <NBBBJHKIOKPKOGOEPEDPMEDPDNAA.stuart@bh90210.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NBBBJHKIOKPKOGOEPEDPMEDPDNAA.stuart@bh90210.net>
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

On Sep 12, 2001  15:41 -0700, IT3 Stuart B. Tener, USNR-R wrote:
> 	I am curious what version of lilo in fact supports ReiserFS tails. I am running Mandrake 8.0, and using the lilo supplied therewith, and have been booting a / partition as ReiserFS (with tails I believe, how do I check?).

At least version 21.6+ support reiserfs tails (maybe earlier, I don't know).
You should be able to verify with "strings /sbin/lilo | grep -i reiserfs".
What it does is unpack the tail on any kernel/initrd files so that LILO
can map the blocks directly.  In a way, it is strange that this is needed,
since I thought tails only applied to files < 64kB or similar...

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
