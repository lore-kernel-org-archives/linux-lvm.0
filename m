Date: Tue, 14 Nov 2006 18:01:25 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvcreate gives 'device-mapper: reload ioctl failed:
	Invalid argument'
Message-ID: <20061114180125.GG30653@agk.surrey.redhat.com>
References: <Pine.LNX.4.64.0611140009360.7393@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0611140009360.7393@localhost>
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

On Tue, Nov 14, 2006 at 12:11:02AM -0500, Matt McHenry wrote:
> # echo "0 31457280 linear 8:11 31457664" | dmsetup -vvvv create 
> maingroup-dvd
> device-mapper: reload ioctl failed: Invalid argument
> Command failed

Now look in your kernel message log for a slightly more detailed error message.

And provide the output of 'pvs -o +dev_size'

Alasdair
-- 
agk@redhat.com
