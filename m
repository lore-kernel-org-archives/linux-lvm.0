Date: Mon, 1 Dec 2014 19:36:23 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20141201193623.GA19758@agk-dp.fab.redhat.com>
References: <547CBD81.4070907@ubuntu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <547CBD81.4070907@ubuntu.com>
Subject: Re: [linux-lvm] flakey target isn't flaking
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
To: Phillip Susi <psusi@ubuntu.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Dec 01, 2014 at 02:12:01PM -0500, Phillip Susi wrote:
> And it never sees any errors.  What gives?
 
Try writes not reads.
The documentation is unclear.
Or work out a sensible way to enhance it to do more little things.

Alasdair
