From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] 2  LVM questions -  LVM and 2.4.19, and extent based striping.
Message-ID: <20021126222800.E6509@uk.sistina.com>
References: <OFB3E6E776.74CCEE3A-ON85256C7D.0055BB76@LocalDomain> <20021126213244.D6509@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021126213244.D6509@uk.sistina.com>; from agk@uk.sistina.com on Tue, Nov 26, 2002 at 09:32:44PM +0000
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
Date: Tue Nov 26 16:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Nov 26, 2002 at 09:32:44PM +0000, Alasdair Kergon wrote:
> If you have 18 extents (PEs) with 6 on each disk numbered:
>   disk1:   0  1  2  3  4  5
>   disk2:   6  7  8  9 10 11
>   disk3:  12 13 14 15 16 17
[More on the numbering LVM* uses, in case that wasn't clear enough.]

Depending whereabouts those extents are on the disk, 
the *actual* PE numbers that LVM* assigns could be 
completely different (but still consecutive on each disk
inside each segment of the LV) e.g.
    disk1:   0  1  2  3  4  5
    disk2:  50 51 52 53 54 55
    disk3:   8  9 10 11 12 13

And the corresponding logical extent (LE) numbers within the 
logical volume run *along* each stripe of the segment in turn:
    disk1:   0  1  2  3  4  5
    disk2:   6  7  8  9 10 11
    disk3:  12 13 14 15 16 17
So in LE terms, the data get striped across 0, 6 and 12, then 
1, 7 and 13 etc., equivalent to striping across 3 extents each
6 times bigger, just one per disk viz.  [0..5], [6..11] and [12..17].
 
Alasdair
-- 
agk@uk.sistina.com
