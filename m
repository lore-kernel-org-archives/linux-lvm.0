Message-ID: <4976024E.4030508@redhat.com>
Date: Tue, 20 Jan 2009 16:56:46 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 2GB limit
References: <4975932A.6090902@bortal.de> <4975B1A6.3090902@redhat.com>
	<1c748a490901200843i1cf9a6ean4ff622c59e75843@mail.gmail.com>
In-Reply-To: <1c748a490901200843i1cf9a6ean4ff622c59e75843@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Larry Dickson <ldickson@cuttedge.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Larry Dickson wrote:
> We have considerable experience getting parted to work. Basically, the
> distinction between primary and extended partitions is not needed, nor are
> partition types. There are other subtle differences too. Very annoyingly,

Correct.

> SOME versions of parted interpret megabytes and even kilobytes (but not

Older versions, right?

> sectors) as decimal only. For these you have to use unit B (bytes) to regain
> control. Experiment a little, to see what uses counting from 1 or counting
> from 0, and what uses last-index or total-size, as these off-by-1 errors can
> be killer.

If you find problems like this with recent versions then please let us 
know via the parted mailing lists:

http://www.gnu.org/software/parted/lists.shtml

Ironing out the UI inconsistencies in parted is one of the areas that 
we are keen to improve at the moment so if you hit issues like this, 
we would very much like to hear about them.

Regards,
Bryn.
