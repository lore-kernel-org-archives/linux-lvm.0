Received: from reti (vpn50-31.rdu.redhat.com [172.16.50.31])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i2596euq031786
	for <linux-lvm@redhat.com>; Fri, 5 Mar 2004 09:06:40 GMT
Received: from joe by reti with local (Exim 4.30)
	id 1AzBIz-000114-R6
	for linux-lvm@redhat.com; Fri, 05 Mar 2004 09:07:41 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] LVM Multi Path Support
Message-ID: <20040305090741.GD744@reti>
References: <20040303190349.14912.qmail@web60910.mail.yahoo.com> <20040304093054.GS662@reti> <200403051112.38529.franc@tech.sirca.org.au>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200403051112.38529.franc@tech.sirca.org.au>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Mar  5 04:05:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Mar 05, 2004 at 11:12:38AM +1100, Franc Carter wrote:
> LVM appears to do the 'right thing for me' in that it recognises
> that the the two PVs are one (I assume via the UUID) and ignore
> the second LUN.

Yes, LVM writes a label to the start of a PV to identify it.

> I'd like to know if this is just good luck, or if it's behaviour
> I can rely ?

I don't think it's defined which of the 2 devices LVM will choose,
does this matter ?  If so you could always set up a filter in lvm.conf
to remove one (probably advisable anyway).

- Joe
