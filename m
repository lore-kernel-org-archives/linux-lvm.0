Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l22E1xQk001653
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 09:01:59 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l22E1uLC003641
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 09:01:57 -0500
Date: Fri, 2 Mar 2007 15:01:53 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] partition table needed for lvm ?
Message-ID: <20070302140153.GB12744@percy.comedia.it>
References: <20070301171425.30ktkd2oroo4cco0@www.mail.yale.edu>
	<20070301231907.GG3319@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20070301231907.GG3319@agk.surrey.redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Mar 01, 2007 at 11:19:07PM +0000, Alasdair G Kergon wrote:
>On Thu, Mar 01, 2007 at 05:14:25PM -0500, Chris Hunter wrote:
>> Do I reallly need to make partition tables on all my disks to use lvm2 ?
> 
>Other packages such as the installer like to have them.

what about the fact that on many storage creating an ms-dos compatible
partition usually results in screwing io alignment?

Do _NOT_ use partitions, they are evil and should have been shot long
ago.

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
