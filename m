Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3FG1vkj031222
	for <linux-lvm@redhat.com>; Tue, 15 Apr 2008 12:01:57 -0400
Received: from pretender.frop.net (pretender.frop.net [70.85.16.90])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3FG1jkX016423
	for <linux-lvm@redhat.com>; Tue, 15 Apr 2008 12:01:45 -0400
Date: Tue, 15 Apr 2008 12:01:44 -0400
From: dave@frop.net
Subject: Re: [linux-lvm] Increase LV size of snapshot (not COW table size)
Message-ID: <20080415160144.GA31651@pretender.frop.net>
References: <20080415025610.GB8011@pretender.frop.net>
	<234BF196-FE40-4B32-AC84-FB336EC830DA@engineyard.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <234BF196-FE40-4B32-AC84-FB336EC830DA@engineyard.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

ok, thanks

I'd rather do this at the block device level than at the filesystem level. It seems like this is possible using dmsetup directly, similarly to what is described in this blog post.

http://jons-thoughts.blogspot.com/2007/11/creating-sparse-block-devices.html

Are there any caveats to getting your own dm maps to play nice with lvm? Can i just pretend that lvs are block devices and map onto them?

On Tue, Apr 15, 2008 at 12:48:15AM -0700, Jayson Vantuyl wrote:
> You'll probably have better luck with unionfs.  LVM doesn't really do  
> what you're asking for.
> 
