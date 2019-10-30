References: <23992.55411.809240.777787@quad.stoffel.home>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <9849f6a1-2504-d0c9-46c1-bd0d83fcf468@redhat.com>
Date: Wed, 30 Oct 2019 09:45:25 +0100
MIME-Version: 1.0
In-Reply-To: <23992.55411.809240.777787@quad.stoffel.home>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] bcache now to become io-manager?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, John Stoffel <john@stoffel.org>

On 10/30/19 1:25 AM, John Stoffel wrote:
>>>>>> "Joe" == Joe Thornber <thornber@redhat.com> writes:
> 
> [ I saw this and couldn't resist asking for more details ...]
> 
> Joe> Also there are big changes to bcache coming, that remove file
> Joe> descriptors from the interface completely.  See the branch
> Joe> 2019-09-05-add-io-manager for more info (bcache has been renamed
> Joe> io_manager).
> 
> Can you post the full URL for this, and maybe give us a teaser on what

For reference: 
https://sourceware.org/git/?p=lvm2.git;a=shortlog;h=refs/heads/2019-09-05-add-io-manager

> to expect?  I run lvache on my home system and I'd love to know how to
> A) improve reporting of how well it works, and B) whether I'm using it
> right, and of course C) if bcache would be a better replacement.
> 
> I'm using Linux v5.0.21 (self compiled) on Debian 9.11 with lvcache
> setup.  It's a pair of mirrored 250gb SSDs in front of 4tb of mirrored
> disk.
> 
> So anything where I can use my SSDs to cache my data accesses is
> certainly interesting.

"bcache" is a confusing name for internal block-cache used to read lvm 
metadata from disks, not that bcache one might think it is and does not 
aim to replace any of lvmcache, dm-cache, dm-writecache, or bcache. It 
should make lvm operations faster and is not supposed to affect data access.

-- Marian

> 
> John
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
