Date: Tue, 14 Nov 2006 18:47:12 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvcreate gives 'device-mapper: reload ioctl failed:
	Invalid argument'
Message-ID: <20061114184712.GJ30653@agk.surrey.redhat.com>
References: <Pine.LNX.4.64.0610281720370.9047@localhost>
	<20061114183159.GI30653@agk.surrey.redhat.com>
	<Pine.LNX.4.58.0611141334290.18875@shell3.speakeasy.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0611141334290.18875@shell3.speakeasy.net>
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
Cc: linux-lvm@redhat.com

On Tue, Nov 14, 2006 at 01:43:07PM -0500, Matt McHenry wrote:
> 1) remove the unused sda12 pv; remove the sda12 partition; delete and
> re-create the sda11 partition to take up the space formerly occupied by
> the sda12 partition

Use vgreduce to remove sda12 from the volume group.
Then edit the partition table to put things back i.e. delete 12 and
extend 11, then reboot.
(You may have some data corruption from what got written to sda12.)
 
Alasdair
-- 
agk@redhat.com
