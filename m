Return-Path: <tack@orion.dok.org>
Date: Fri, 27 Jul 2001 11:51:24 -0400
From: Jason Tackaberry <tack@linux.com>
Subject: Re: [linux-lvm] Nasty bug in lvm and/or md and/or reiserfs
Message-ID: <20010727115124.D4262@linux.com>
References: <OF1CCD62F0.EF95DF65-ON85256A96.00536B19@raleigh.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF1CCD62F0.EF95DF65-ON85256A96.00536B19@raleigh.ibm.com>; from corryk@us.ibm.com on Fri, Jul 27, 2001 at 10:20:42AM -0500
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

> any drives besides root. I actually had to fsck the mounted root fs to
> correct the /etc/mtab problem. My root is ext2 on LVM. No md or Reiser.
> But I don't believe the problem had anything to do with LVM. I believe
> it was just due to really bad filesystem corruption.

Interesting.  This indeed seems to vindicate md.  Maybe I'll have
another serious look at it. :)

Cheers,
Jason.
