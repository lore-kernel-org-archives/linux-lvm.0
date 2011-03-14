Date: Mon, 14 Mar 2011 13:17:26 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110314171726.GA18249@redhat.com>
References: <4D7E4689.9060300@cox.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4D7E4689.9060300@cox.net>
Subject: Re: [linux-lvm] Advanced Format disks mixed with regular disks?
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
Content-Transfer-Encoding: 7bit
To: Ron Johnson <ron.l.johnson@cox.net>
Cc: linux-lvm@redhat.com

On Mon, Mar 14 2011 at 12:47pm -0400,
Ron Johnson <ron.l.johnson@cox.net> wrote:

> Hi,
> 
> Is there any concern with mixing 4KB-sector drives with 512-byte
> sector drives in the same LV?

Both LVM2 and Device Mapper have been updated to accommodate stacking
such a mix of drives.

See this for a bit more detail:
http://people.redhat.com/msnitzer/docs/io-limits.txt

Particularly, the "Stacking I/O Limits" section.

The concern raised for partial (4k) writes to the 512b drive was
discussed a bit more here: http://lkml.org/lkml/2010/2/22/295
