From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM 1.1rc2 compile error
Message-ID: <20020605153243.C21313@sistina.com>
References: <1023224082.9106.17.camel@UberGeek>
Mime-Version: 1.0
In-Reply-To: <1023224082.9106.17.camel@UberGeek>; from austin@coremetrics.com on Tue, Jun 04, 2002 at 03:54:42PM -0500
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
Date: Wed Jun  5 08:38:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Andrea seems to have changed the kiobuf structure definition.
Try a vanilla kernel please.

On Tue, Jun 04, 2002 at 03:54:42PM -0500, Austin Gonyou wrote:
> kernel 2.4.19-pre9-aa2
> LVM 1.1rc2 source, patch created applies cleanly. 
> 
> lvm-snap.c:364: structure has no member named `blocks'
> lvm-snap.c:369: structure has no member named `blocks'
> 
> 
> The struct being used is indeed named blocks..but seems undefined or
> inaccessible. Should it be something else?
> 
> -- 
> Austin Gonyou
> Systems Architect, CCNA
> Coremetrics, Inc.
> Phone: 512-698-7250
> email: austin@coremetrics.com
> 
> "One ought never to turn one's back on a threatened danger and 
> try to run away from it. If you do that, you will double the danger. 
> But if you meet it promptly and without flinching, you will 
> reduce the danger by half."
> Sir Winston Churchill



-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
