Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l25JZpvt015418
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 19:35:51 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1HOIyN-0002hl-Kv
	for linux-lvm@redhat.com; Mon, 05 Mar 2007 19:35:51 +0000
Date: Mon, 5 Mar 2007 19:35:51 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] WARNING: Ignoring duplicate config node:
	filter	(seeking filter)
Message-ID: <20070305193551.GL3319@agk.surrey.redhat.com>
References: <45EC5F32.1060100@davidb.org>
	<20070305191635.75F0E7576E@mailer.at.ds9>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20070305191635.75F0E7576E@mailer.at.ds9>
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

On Mon, Mar 05, 2007 at 08:16:35PM +0100, Cisco wrote:
> filter = [ "a/.*/", "r|/dev/cdrom|", "r|/dev/hda|", "r|/dev/hdb|",
> "r|/cdrom|" ]
 
Oops - the first pattern matches everything so the rest will have no effect:-)

The man page says:
              filter  -- List of patterns to apply to devices found by a scan.
              Patterns are regular expressions delimited by any character  and
              preceded  by a (for accept) or r (for reject).  The list is tra-
              versed in order, and the first regex that matches determines  if
              the device will be accepted or rejected (ignored).  Devices that
              don't match any patterns are accepted. If  you  want  to  reject
              patterns  that don't match, end the list with "r/.*/".  If there
              are several names for the same device (e.g.  symbolic  links  in
              /dev),  if  any  name  matches  any  a  pattern,  the  device is
              accepted; otherwise if any name matches  any  r  pattern  it  is
              rejected;  otherwise  it  is accepted.  As an example, to ignore
              /dev/cdrom you could use: devices { filter=["r|cdrom|"] }

Alasdair
-- 
agk@redhat.com
