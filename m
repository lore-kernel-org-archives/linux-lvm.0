References: <55C86723.4000707@siteground.com>
	<20150810174900.GC22719@redhat.com> <55C9AD4F.5050900@siteground.com>
	<20150811143526.GB29369@redhat.com>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <55CAF9DD.3090707@redhat.com>
Date: Wed, 12 Aug 2015 09:46:37 +0200
MIME-Version: 1.0
In-Reply-To: <20150811143526.GB29369@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvremove does not pass discards if volume is part
 of thin pool
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
To: vaLentin chernoZemski <valentin@siteground.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 08/11/2015 04:35 PM, Mike Snitzer wrote:
> I'll have to defer to the lvm2 developers, I thought we added explicit
> logging when lvm2 issues discards (as part of lvremove, etc) -- Peter,
> and/or Alasdair?
> 

Yes, we log that like (visible in the verbose -vvv output):

  "Discarding X extents offset Y sectors on /dev/Z."

Also, when removing a volume, we issue this message:

# lvremove vg1/lvol0
Do you really want to remove and DISCARD logical volume lvol0? [y/n]: 

For this, the "devices/issue_discards=1" must be set - it's not
by default.

-- 
Peter
