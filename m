Return-Path: <jlundell@pobox.com>
Mime-Version: 1.0
Message-Id: <p0510030ab77546a455f2@[10.128.7.49]>
In-Reply-To: <200107132204.f6DM4TR3014602@webber.adilger.int>
References: <200107132204.f6DM4TR3014602@webber.adilger.int>
Date: Fri, 13 Jul 2001 17:49:55 -0700
From: Jonathan Lundell <jlundell@pobox.com>
Subject: [linux-lvm] Re: [PATCH] 64 bit scsi read/write
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>, Chris Wedgwood <cw@f00f.org>
Cc: "Albert D. Cahalan" <acahalan@cs.uml.edu>, Ben LaHaise <bcrl@redhat.com>, Ragnar Kjxrstad <kernel@ragnark.vestdata.no>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mike@bigstorage.com, kevin@bigstorage.com, linux-lvm@sistina.com

At 4:04 PM -0600 2001-07-13, Andreas Dilger wrote:
>**) As I said in my previous posting, it depends on if/how MD RAID does
>    write ordering of I/O to the data sector and the parity sector.  If
>    it holds back the parity write until the data I/O(s) are complete, and
>    trusts the data over parity on recovery, you should be OK unless you
>    have multiple failures (i.e. bad disk + crash).  If it doesn't do this
>    ordering, or trusts parity over data, then you are F***ed (I doubt it
>    would have this problem).

That wouldn't help, would it, if >1 data sectors were being written.

The fault mode of a sector simply not being written seems like a real 
weak point of both RAID-1 and RAID-5. Not that RAID-5 parity ever 
gets checked, I think, under normal circumstances, nor RAID-1 mirrors 
get compared, but if they were check and there was an parity or 
mirror-compare error and no other indication of a fault (eg CRC), 
there's no way to recover correct data.
-- 
/Jonathan Lundell.
