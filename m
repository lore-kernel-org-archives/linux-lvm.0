Return-Path: <gibbs@scsiguy.com>
Message-Id: <200107151747.f6FHlAU60256@aslan.scsiguy.com>
In-Reply-To: Your message of "Sun, 15 Jul 2001 08:06:39 PDT."
             <p05100317b7775fc2bd15@[207.213.214.37]> 
Date: Sun, 15 Jul 2001 11:47:10 -0600
From: "Justin T. Gibbs" <gibbs@scsiguy.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Lundell <jlundell@pobox.com>
Cc: Chris Wedgwood <cw@f00f.org>, Daniel Phillips <phillips@bonn-fries.net>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Andrew Morton <andrewm@uow.edu.au>, Andreas Dilger <adilger@turbolinux.com>, "Albert D. Cahalan" <acahalan@cs.uml.edu>, Ben LaHaise <bcrl@redhat.com>, Ragnar Kjxrstad <kernel@ragnark.vestdata.no>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mike@bigstorage.com, kevin@bigstorage.com, linux-lvm@sistina.com

>Consider the possibility (probability, I think) that SCSI drives blow 
>away their (unwritten) write cache buffers on a SCSI bus reset, and 
>that a SCSI bus reset is a routine, albeit last-resort, error 
>recovery technique. (It's also necessary; by the time a driver gets 
>to a bus reset, all else has failed. It's also, in my experience, not 
>especially rare.)

I have never seen this to be the case.  The SCSI spec is quite clear
in stating that a bus reset only affects "I/O processes that have not
completed, SCSI device reservations, and SCSI device operating modes".
The soft reset section clarifies the meaning of "completed commands"
as:
	e) An initiator shall consider an I/O process to be completed
	   when it negates ACK for a successfully received COMMAND
	   COMPLETE message.
	f) A target shall consider an I/O process to be completed when
	   it detects the transition of ACK to false for the COMMAND
	   COMPLETE message with the ATN signal false.

As the soft reset section also specifies how to deal with initiators
that are not expecting soft reset semantics, I believe this applies to
either reset model.

If we look at the section on caching for direct access devices we see,
"[write-back cached] data may be lost if power to the device is lost or
a hardware failure occurs".  There is no mention of a bus reset having
any effect on commands already acked as completed to the intiator.

>The fix for that particular problem--disabling write caching--is 
>simple enough, though it presumably has a performance consequence. A 
>second benefit of disabling write caching is that the drive can't 
>reorder writes (though of course the system still might).

Simply disabling the write cache does not guarantee the order of writes.
For one, with tagged I/O and the use of the SIMPLE_Q tag qualifier,
commands may be completed in any order.  If you want some semblance of
order, either disable the write cache or use the FUA bit in all writes,
and use the ORDERED tag qualifier.  Even when using these options,
it is not clear that the drive cannot reorder writes "slightly" to
make track writes more efficient (e.g. two separate commands to write
sequential sectors on the same track may be written in reverse order).

>At first glance, by the way, the only write barrier I see in the SCSI 
>command set is the synchronize-cache command, which completes only 
>after all the drive's dirty buffers are written out. Of course, 
>without write caching, it's not an issue.

The ordered tag qualifier gives you barier semantics with the caveats
listed above.

--
Justin
