From: "Matthew O'Keefe" <okeefe@brule.borg.umn.edu>
Subject: Re: [linux-lvm] [OT] FAKE, HA Tools, LVM, and Oracle.
Message-Id: <20020111082401.B62755@brule.borg.umn.edu>
References: <1010707968.14015.1.camel@UberGeek>
MIME-Version: 1.0
In-Reply-To: <1010707968.14015.1.camel@UberGeek>
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
Date: Fri Jan 11 08:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: okeefe@sistina.com

On Thu, Jan 10, 2002 at 06:12:48PM -0600, Austin Gonyou wrote:
> I'm looking for a way to do active/passive failover with Oracle on XFS +
> LVM. I think FAKE and HA tools would be the best bet, does anyone have
> any other suggestions? I'd sure appreciate them. BTW, connecting by
> fibre to EMC 3630. 
> Thanks.

Austin,
use Oracle Real Application Clusters + GFS + LVM.  You can buy
integrated hardware/software packages that support Oracle
fail-over and clustering: the stuff just works, and works well.

Matt O'Keefe

> -- 
> Austin Gonyou
> Systems Architect, CCNA
> Coremetrics, Inc.
> Phone: 512-698-7250
> email: austin@coremetrics.com
> 
> "It is the part of a good shepherd to shear his flock, not to skin it."
> Latin Proverb
