Date: Sat, 6 Dec 2014 01:40:13 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20141206014013.GA2541@agk-dp.fab.redhat.com>
References: <loom.20141203T163029-461@post.gmane.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <loom.20141203T163029-461@post.gmane.org>
Subject: Re: [linux-lvm] ThinProvisioned lvm's Don't Activate or Mount
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
To: Rock <roark.maccado@gmail.com>
Cc: linux-lvm@redhat.com

On Wed, Dec 03, 2014 at 04:12:18PM +0000, Rock wrote:
>   Thin pool transaction_id is 649, while expected 647.

You can't "undo" changes to a thin pool like that.

Because of the way the data is stored changes to thin devices generally 
cannot be reversed.

What change were you trying to revert?

Alasdair
