Date: Wed, 22 Aug 2001 17:35:28 +0100
From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Mail troubles at hermes.sistina.com[208.210.145.141]?
Message-ID: <20010822173528.B10677@uk.sistina.com>
References: <3B83CDA2.AB7F6B3D@tls.msk.ru>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B83CDA2.AB7F6B3D@tls.msk.ru>; from mjt@tls.msk.ru on Wed, Aug 22, 2001 at 07:20:02PM +0400
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: linux-lvm@sistina.com

On Wed, Aug 22, 2001 at 07:20:02PM +0400, Michael Tokarev wrote:
> Today morning I noticied that our mailserver
> rejected some mails from hermes.sistina.com
> due to invalid (non-FQDN) SMTP HELO argument
Thanks for bringing this to our attention!
Our sysadmin team has now fixed this particular problem.

>  451 Cannot check <postmaster@sistina.com> at this time -
>  please try later)
> So Sistina also have no valid postmaster address
> that is also required by RFC?  
No - what you saw was of course a *transient* error as the 
error code starts with a 4 not a 5 (see the RFC).

There *is* a postmaster address, but there was a 
transient problem affecting certain deliveries, including
messages sent to the postmaster address, but not the list
addresses.

Again, I believe this is also now resolved, but do let
us know if you notice any more problems!

Alasdair
-- 
agk@uk.sistina.com
