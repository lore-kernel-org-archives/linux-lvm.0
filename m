From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030817173326.C25758@uk.sistina.com>
References: <20030816102005.GA12916@gondor.com> <20030816195606.B25758@uk.sistina.com> <20030817161022.GA2902@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030817161022.GA2902@gondor.com>; from list039@gondor.com on Sun, Aug 17, 2003 at 06:10:22PM +0200
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
Date: Sun Aug 17 11:34:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Aug 17, 2003 at 06:10:22PM +0200, Jan Niehusmann wrote:
> Perhaps the problem is that source and target PV have exactly the same
> number of extents? Of-by-one error, if the target volume gets completely
> filled up by the pvmove?

Who knows?

The log file might show whether that theory is correct or not.

If you want me to look at this, you need to supply some of the 
information requested in my last email: your description of the problem
so far is too vague.
 
Alasdair
-- 
agk@uk.sistina.com
