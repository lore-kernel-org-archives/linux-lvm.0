From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030817195423.G25758@uk.sistina.com>
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
Date: Sun Aug 17 13:55:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <list039@gondor.com>
Cc: linux-lvm@sistina.com

On Sun, Aug 17, 2003 at 08:26:03PM +0200, Jan Niehusmann wrote:
> (But I don't know what core 1 1024 2 means)

core means the data recording the state of the mirror is
held in-core - i.e. it is not a persistent mirror
[No other options apart from 'core' available yet]

1 means 1 parameter associated with 'core' follows:
  1024 is the number of sectors moved at once (ie 512KB)

2 means 2 mirror devices follow
 
Alasdair
-- 
agk@uk.sistina.com
