Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9JEcLKo024774
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 10:38:21 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9JEcKpv031533
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 10:38:20 -0400
Date: Wed, 19 Oct 2011 10:37:51 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <20111019142412.GA15290@redhat.com>
Message-ID: <alpine.LRH.2.00.1110191035090.5801@bmsred.bmsi.com>
References: <6198ad06f8735602ebb56546ec3469b6.squirrel@webmail.ocsa-data.net>
	<1319033348.1827.41.camel@deela.quest-ce.net>
	<20111019142412.GA15290@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM blocks discard for remove commands
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Yann Droneaud <yann@droneaud.fr>

On Wed, 19 Oct 2011, Mike Snitzer wrote:

>> Does it apply for the blocks holding meta data,
>> e.g. will pvremove issue discard requests for the PV meta data ?
>
> The discards are only issued for the physical extents that were used in
> a volume's data area.  PV metadata isn't discarded, and really there
> would be little benefit to doing so.

The metadata is written over so that the PV is no longer recognized. 
I think that issuing a discard for the metadata would actually be
incorrect.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
