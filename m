Date: Tue, 25 Jul 2017 01:30:41 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20170725003041.GA13539@agk-dp.fab.redhat.com>
References: <20170509154822.13396-1-enric.balletbo@collabora.com>
	<20170509154822.13396-2-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20170509154822.13396-2-enric.balletbo@collabora.com>
Subject: Re: [linux-lvm] [PATCH 1/2] dmsetup: add support to output
	devices	in bootformat style
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
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Kees Cook <keescook@chromium.org>, Mike Snitzer <snitzer@redhat.com>, linux-lvm@redhat.com

I've adapted the way this patch interacts with the various other permitted
command line options and committed it.

On Tue, May 09, 2017 at 05:48:21PM +0200, Enric Balletbo i Serra wrote:
>  dmsetup table <device...> --bootformat
 
I went for --concise in the end, as I expect it will have wider uses than just
booting.

Alasdair
