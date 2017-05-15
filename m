Date: Mon, 15 May 2017 11:02:05 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20170515160205.GA15170@redhat.com>
References: <61de26b1-0849-e71f-133c-a8357b773ee9@mglug.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61de26b1-0849-e71f-133c-a8357b773ee9@mglug.de>
Subject: Re: [linux-lvm] Howto change cachepolicy on cached thinpool devices?
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
To: Oliver Rath <rath@mglug.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, May 15, 2017 at 03:25:11PM +0200, Oliver Rath wrote:
> Hi list,
> 
> caching the _tdata part of a thinpool works fine now. Unfortunatly with
> lvchange it is not possible to change the policy (vg:dmivg,
> cachepool:dmipool,thinpool:winthinpool):

> # lvchange --cachepolicy cleaner /dev/mapper/dmivg-winthinpool_tdata
>   Operation not permitted on hidden LV dmivg/winthinpool_tdata.

Thanks, this is fixed here
https://sourceware.org/git/?p=lvm2.git;a=commit;h=5406191cb9112dea6d8a618ae1da815f816291f6
