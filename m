From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030816154708.GA17166@gondor.com>
References: <20030816102005.GA12916@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030816102005.GA12916@gondor.com>
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
Date: Sat Aug 16 10:48:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Aug 16, 2003 at 12:20:06PM +0200, Jan Niehusmann wrote:
> On my computer, pvmove just hangs at 0.2% done. First it looked like the
> reason was that I hadn't loaded dm-mirror before calling pvmove.

I just noticed I forgot an important detail: Version numbers :-)

# pvmove --version
  LVM version:     2.00.05 (2003-07-18)
  Library version: 1.00.02-ioctl (2003-07-12)
  Driver version:  4.0.1

Jan
