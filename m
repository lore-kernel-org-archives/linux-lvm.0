From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030817194931.F25758@uk.sistina.com>
References: <20030816102005.GA12916@gondor.com> <20030816195606.B25758@uk.sistina.com> <20030817114638.GA1839@gondor.com> <20030817184138.E25758@uk.sistina.com> <20030817182602.GA3737@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030817182602.GA3737@gondor.com>; from list039@gondor.com on Sun, Aug 17, 2003 at 08:26:03PM +0200
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
Date: Sun Aug 17 13:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <list039@gondor.com>
Cc: linux-lvm@sistina.com

On Sun, Aug 17, 2003 at 08:26:03PM +0200, Jan Niehusmann wrote:
> only reads ~30MB/s with dd. The only strange thing I saw was that there
> sometimes where some seconds without any disk activity at all. 

That'll be because of the pvmove polling mode - by default
it only checks (and displays) each segment's pvmove progress
every 15 seconds.   For 5 sec. intervals use pvmove -i5
or for best performance (but no progress displays *during*
segments) try -i0.

Alasdair
