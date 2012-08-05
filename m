Date: Sun, 5 Aug 2012 23:14:52 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20120805221452.GE16335@agk-dp.fab.redhat.com>
References: <501EE710.9070703@profihost.ag>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <501EE710.9070703@profihost.ag>
Subject: Re: [linux-lvm] dm thinp: pool get's bigger than allowd virtual	disk
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
To: Stefan Priebe <s.priebe@profihost.ag>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Aug 05, 2012 at 11:35:12PM +0200, Stefan Priebe wrote:
> this will waste 123,86g for all the time ?! As i can't use them.

Did you have it configured to auto-expand to a size larger than you
know you need?  (See logs / dmeventd / lvm.conf)

Alasdair
