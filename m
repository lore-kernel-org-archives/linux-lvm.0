Return-Path: <jlundell@pobox.com>
Mime-Version: 1.0
Message-Id: <p05100313b776de2f4b7e@[207.213.214.37]>
In-Reply-To: <20010715160247.I7624@weta.f00f.org>
References: <E15LL3Y-0000yJ-00@the-village.bc.nu>
 <p05100307b7762dc5d8ad@[207.213.214.37]>
 <20010715160247.I7624@weta.f00f.org>
Date: Sat, 14 Jul 2001 22:46:20 -0700
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
To: Chris Wedgwood <cw@f00f.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Andrew Morton <andrewm@uow.edu.au>, Andreas Dilger <adilger@turbolinux.com>, "Albert D. Cahalan" <acahalan@cs.uml.edu>, Ben LaHaise <bcrl@redhat.com>, Ragnar Kjxrstad <kernel@ragnark.vestdata.no>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mike@bigstorage.com, kevin@bigstorage.com, linux-lvm@sistina.com

At 4:02 PM +1200 2001-07-15, Chris Wedgwood wrote:
>On Sat, Jul 14, 2001 at 10:33:44AM -0700, Jonathan Lundell wrote:
>
>     What's worse, though the spec is not explicit on this point, it
>     appears that the write cache is lost on a SCSI reset, which is
>     typically used by drivers for last-resort error recovery. And of
>     course a SCSI bus reset affects all the drives on the bus, not
>     just the offending one.
>
>Doesn't SCSI have a notion of write barriers?
>
>Even if this is required, the above still works because for anything
>requiring a barrier, you wait for a positive SYNCHRONIZE CACHE

Sure, if you keep all your write buffers around until then, so you 
can re-write if the sync fails. And if you don't crash in the 
meantime.
-- 
/Jonathan Lundell.
