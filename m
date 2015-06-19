Date: Sat, 20 Jun 2015 00:09:10 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20150619230910.GA16636@agk-dp.fab.redhat.com>
References: <87lhff4u8l.fsf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87lhff4u8l.fsf@gmail.com>
Subject: Re: [linux-lvm] lvcreate - device not cleared Aborting. Failed
	to	wipe start of new LV.
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
To: csanyipal@gmail.com
Cc: linux-lvm@redhat.com

On Fri, Jun 19, 2015 at 05:02:02PM +0200, csanyipal@gmail.com wrote:
> on my Debian Jessie system I want to create a LV with command:
> lvcreate --size 10.10G -n var bubba
>  Rounding up size to full physical extent 10.10 GiB
>  /dev/bubba/var: not found: device not cleared

The device wasn't created by udev before LVM tried to access it to wipe it.

Look in your system message log to see if the kernel gave any errors.
Otherwise check your udev configuration conforms to the way that
particular version of Debian expects things to work.

Alasdair
