Received: from arthur.brq.redhat.com (dhcp131-213.brq.redhat.com
	[10.34.131.213])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1EDPkkR016378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 14 Feb 2013 08:25:48 -0500
Message-ID: <511CE5DA.50205@redhat.com>
Date: Thu, 14 Feb 2013 14:25:46 +0100
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <511BB48A.3010009@ubuntu.com> <511C33AF.7020506@shiftmail.org>
	<20130214005854.GF24130@agk-dp.fab.redhat.com>
In-Reply-To: <20130214005854.GF24130@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvmove doesn't work the way the man page says
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 02/14/2013 01:58 AM, Alasdair G Kergon wrote:
> On Thu, Feb 14, 2013 at 01:45:35AM +0100, Spelic wrote:
>> breaking it up in smaller subsegments would probably have been wiser,
>
> The plan was always for more frequent checkpoints, but it involves more
> complicated code and there's simply been no need to do this: given how rarely
> pvmove is used, the current approach seems to be good enough and nobody's
> written the extra code yet.
>
> Alasdair

Should not then the man page be fixed to match actual behavior (and not 
only at this place)? Otherwise it is a wish list.

Bugzilla is IMO more appropriate tracker for RFEs.

-- Marian


>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
