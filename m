From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Instability with 2.6, recovering (meta)data?
Message-ID: <20031110230857.L16901@uk.sistina.com>
References: <20031109213821.GA4425@amphibian.dyndns.org> <20031110174615.GE20777@amphibian.dyndns.org> <20031110175529.GA1844@amphibian.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031110175529.GA1844@amphibian.dyndns.org>; from toad@amphibian.dyndns.org on Mon, Nov 10, 2003 at 05:55:29PM +0000
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Nov 10 17:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Toad <toad@amphibian.dyndns.org>
Cc: linux-lvm@sistina.com

On Mon, Nov 10, 2003 at 05:55:29PM +0000, Toad wrote:
>   invalid lv in extent map

Thanks for sending me a copy of the metadata.

I've reproduced the problem and found the bug when LVM2
writes out LVM1-formatted VG metadata after an LV
has been deleted.  Working on a fix...

Alasdair
