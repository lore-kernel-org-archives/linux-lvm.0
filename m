MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <23995.13827.23398.434894@quad.stoffel.home>
Date: Thu, 31 Oct 2019 15:29:07 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <20191030104713.wf52pgh7fw77cevw@reti>
References: <23992.55411.809240.777787@quad.stoffel.home>
	<20191030104713.wf52pgh7fw77cevw@reti>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: David Teigland <teigland@redhat.com>

>>>>> "Joe" == Joe Thornber <thornber@redhat.com> writes:

Joe> On Tue, Oct 29, 2019 at 08:25:23PM -0400, John Stoffel wrote:
>> >>>>> "Joe" == Joe Thornber <thornber@redhat.com> writes:
>> 
>> [ I saw this and couldn't resist asking for more details ...]
>> 
Joe> Also there are big changes to bcache coming, that remove file
Joe> descriptors from the interface completely.  See the branch
Joe> 2019-09-05-add-io-manager for more info (bcache has been renamed
Joe> io_manager).
>> 
>> Can you post the full URL for this, and maybe give us a teaser on what
>> to expect?  I run lvache on my home system and I'd love to know how to
>> A) improve reporting of how well it works, and B) whether I'm using it
>> right, and of course C) if bcache would be a better replacement.
>> 
>> I'm using Linux v5.0.21 (self compiled) on Debian 9.11 with lvcache
>> setup.  It's a pair of mirrored 250gb SSDs in front of 4tb of mirrored
>> disk.
>> 
>> So anything where I can use my SSDs to cache my data accesses is
>> certainly interesting.

Joe> Sorry, I think we're getting confused with similarly named
Joe> things.  There is a component in LVM source called 'block cache'
Joe> that we use to scan devices in parallel (under the hood it uses
Joe> aio).  That component is being renamed.  It's nothing to do with
Joe> the disk caching technology called 'bcache'.

Ah... that's a good reason for this rename then. 

Joe> However, Dave Teigland has been adding support to LVM for a new
Joe> caching target that emphasises caching writes.  So keep an eye
Joe> out for that.

Will do. It's never really been clear if lvcache has really helped or
not, the testing was in-conclusive.

John
