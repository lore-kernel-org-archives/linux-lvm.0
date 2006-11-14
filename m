Date: Tue, 14 Nov 2006 18:26:19 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvcreate gives 'device-mapper: reload ioctl failed:
	Invalid argument'
Message-ID: <20061114182619.GH30653@agk.surrey.redhat.com>
References: <Pine.LNX.4.64.0611140009360.7393@localhost>
	<20061114180125.GG30653@agk.surrey.redhat.com>
	<Pine.LNX.4.58.0611141318040.18875@shell3.speakeasy.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0611141318040.18875@shell3.speakeasy.net>
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
To: Matt McHenry <jerith@speakeasy.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Nov 14, 2006 at 01:20:57PM -0500, Matt McHenry wrote:
> Nov 13 20:03:03 [kernel] device-mapper: table: device 8:11 too small for target

>   PV         VG        Fmt  Attr PSize  PFree   DevSize
>   /dev/sda11 maingroup lvm2 a-   38.15G  23.15G  19.08G
>   /dev/sda12 maingroup lvm2 a-   19.07G  19.07G  19.07G

So your partition /dev/sda11 now has a size of 19GB but lvm2 thinks it
can use 38GB of it.

Have you edited the partition table?

Alasdair
-- 
agk@redhat.com
