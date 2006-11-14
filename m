Date: Tue, 14 Nov 2006 18:31:59 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvcreate gives 'device-mapper: reload ioctl failed:
	Invalid argument'
Message-ID: <20061114183159.GI30653@agk.surrey.redhat.com>
References: <Pine.LNX.4.64.0610281720370.9047@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0610281720370.9047@localhost>
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

On Sat, Oct 28, 2006 at 05:26:55PM -0400, Matt McHenry wrote:
> thought that maybe one of my pvs was bad, so I tried to add a new pv 
> (sda12) and migrate off of the most-recently-added one (sda11), but the 

Could you have created the new one by subtracting space from the old one?
You need to undo that change to the partition table.

Alasdair
-- 
agk@redhat.com
