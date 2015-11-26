Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAQGhsdx027508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2015 11:43:54 -0500
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1a1zeD-0001yK-Nz
	for linux-lvm@redhat.com; Thu, 26 Nov 2015 16:43:53 +0000
Date: Thu, 26 Nov 2015 16:43:53 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20151126164353.GA5235@agk-dp.fab.redhat.com>
References: <565734C4.5020402@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <565734C4.5020402@windriver.com>
Subject: Re: [linux-lvm] thin_check called with wrong path during
	"vgchange	-ay"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Nov 26, 2015 at 10:35:16AM -0600, Chris Friesen wrote:
> controller-0:/home/wrsroot# vgchange -ay cinder-volumes
>   Check of thin pool cinder-volumes/cinder-volumes-pool failed 
> (status:1). Manual repair required (thin_dump --repair  
> /dev/mapper/cinder-volumes-cinder-volumes-pool_tmeta)!

I don't see that upstream. Try upgrading lvm2.

Alasdair
