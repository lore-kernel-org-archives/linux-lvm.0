From: Andreas Dilger <adilger@turbolabs.com>
Date: Wed, 3 Oct 2001 21:15:08 -0600
Subject: Re: [linux-lvm] Re: partition table read incorrectly
Message-ID: <20011003211508.O8954@turbolinux.com>
References: <200110031901.TAA04080@vlet.cwi.nl> <20011004013950.A16757@cistron.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011004013950.A16757@cistron.nl>
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
To: linux-lvm@sistina.com, alan@lxorguk.ukuu.org.uk, linux-kernel@vger.kernel.org

On Oct 04, 2001  01:39 +0200, Wichert Akkerman wrote:
> Previously Andries.Brouwer@cwi.nl wrote:
> > But why do you call it wrong?
> 
> I deleted all partitions with fdisk so I expect none to be there.
> fdisk shows none, but the kernel does.

The safest thing to do at this point is to simply delete the whole thing:

dd if=/dev/zero of=/dev/sdb count=1

then pvcreate the disk again.  If you already have data on the PV in
question, you can "dd if=/dev/zero of=/dev/sdb bs=1 seek=510 count=2"
to remove only the partition signature.

Note also that it is a bug in LVM that it did not zero the whole thing
in the first place.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
