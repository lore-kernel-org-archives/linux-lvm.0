From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030818151229.B29420@uk.sistina.com>
References: <20030816102005.GA12916@gondor.com> <20030816195606.B25758@uk.sistina.com> <20030817231415.GA4328@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030817231415.GA4328@gondor.com>; from list039@gondor.com on Mon, Aug 18, 2003 at 01:14:15AM +0200
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
Date: Mon Aug 18 09:13:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <list039@gondor.com>
Cc: linux-lvm@sistina.com

On Mon, Aug 18, 2003 at 01:14:15AM +0200, Jan Niehusmann wrote:
> I noticed the WCHAN fields in my ps output were not very useful, because
> they pointed to a module and were not decoded.

Does your System.map file correspond to the running kernel?
[See ps man page / strace to check where it's getting that file from]
 
Alasdair
-- 
agk@uk.sistina.com
