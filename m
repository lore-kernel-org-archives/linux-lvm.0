Return-Path: <jlundell@pobox.com>
Mime-Version: 1.0
Message-Id: <p0510031cb7778611bd3f@[207.213.214.37]>
In-Reply-To: <20010716032220.B10635@weta.f00f.org>
References: <E15LL3Y-0000yJ-00@the-village.bc.nu>
 <0107142211300W.00409@starship> <20010715153607.A7624@weta.f00f.org>
 <01071515442400.05609@starship> <20010716023911.A10576@weta.f00f.org>
 <p05100317b7775fc2bd15@[207.213.214.37]>
 <20010716032220.B10635@weta.f00f.org>
Date: Sun, 15 Jul 2001 10:44:28 -0700
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
Cc: Daniel Phillips <phillips@bonn-fries.net>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Andrew Morton <andrewm@uow.edu.au>, Andreas Dilger <adilger@turbolinux.com>, "Albert D. Cahalan" <acahalan@cs.uml.edu>, Ben LaHaise <bcrl@redhat.com>, Ragnar Kjxrstad <kernel@ragnark.vestdata.no>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mike@bigstorage.com, kevin@bigstorage.com, linux-lvm@sistina.com

At 3:22 AM +1200 2001-07-16, Chris Wedgwood wrote:
>On Sun, Jul 15, 2001 at 08:06:39AM -0700, Jonathan Lundell wrote:
>
>     At first glance, by the way, the only write barrier I see in the
>     SCSI command set is the synchronize-cache command, which completes
>     only after all the drive's dirty buffers are written out. Of
>     course, without write caching, it's not an issue.
>
>Is the spec you have distributable? I believe some of the early drafts
>were, but the final spec isn't.
>
>I'd really like to check it out myself, I alwasy assumed SCSI had the
>smarts for write-barriers and force-unit-access but I guess I was
>wrong.
>
>Anyhow, I'd like to see the spec for myself if it is something I can
>get hold of.

I was referring to IBM's spec, as implemented in their recent SCSI 
and FC drives. You can find a copy at 
http://www.storage.ibm.com/techsup/hddtech/prodspec/ddyf_spi.pdf

WRITE EXTENDED has a bit (FUA) that will let you force that 
particular write to go to disk immediately, independent of write 
caching, but there's no suggestion that it otherwise acts as a write 
barrier for cached writes.

WRITE VERIFY implies a CACHE SYNCHRONIZE, so it's a write barrier, 
but an expensive (because synchronous) one.
-- 
/Jonathan Lundell.
