Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7ELwxUs008533
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 17:58:59 -0400
Received: from cobalt0.panici.net (cobalt0.panici.net [207.234.248.139])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7ELwth5016516
	for <linux-lvm@redhat.com>; Mon, 14 Aug 2006 17:58:55 -0400
Received: (from padski@localhost)
	by cobalt0.panici.net (8.10.2/8.10.2) id k7ELwpn14103
	for linux-lvm@redhat.com; Mon, 14 Aug 2006 22:58:51 +0100
Date: Mon, 14 Aug 2006 22:58:51 +0100
From: paddy <paddy@panici.net>
Subject: Re: [linux-lvm] Joining physical volumes
Message-ID: <20060814215838.GB11767@cobalt0.panici.net>
References: <jwv4pwfv08y.fsf-monnier+gmane.linux.lvm.general@gnu.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <jwv4pwfv08y.fsf-monnier+gmane.linux.lvm.general@gnu.org>
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
To: linux-lvm@redhat.com

On Mon, Aug 14, 2006 at 10:56:38AM -0400, Stefan Monnier wrote:
> 
> For historical reasons, my hard drive has now 3 contiguous physical
> partitions, all managed by LVM for the same volume group.
> 
> I'd like to get rid of this silliness and turn those 3 partitions into
> just 1.  I don't have much/any extra space available and I'd rather not
> have to resort to backup/format/restore.
> 
> Is there some clever way to do that?  Ideally, I should be able to do the
> conversion without moving the actual data at all since the same sectors
> will be available.

I've been in the same situation before and never gotten around to doing
anything about it, until I buy a new bigger disk :-)

If the partitions are truly contiguous (not DOS extended partitions for 
instance), then the PEs should all be aligned the same and it ought to
be possible, in a similar fashion to what I describe in another thread
here.  I don't have a pvmerge on my boxes, but then I don't have a 
pvresize or a pvextend, so maybe I'm missing a few bits :-)

does parted do anything with HM LVM ?

backups are good :-)

Regards,
Paddy
-- 
Perl 6 will give you the big knob. -- Larry Wall
