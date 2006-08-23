Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7NETnJZ026895
	for <linux-lvm@redhat.com>; Wed, 23 Aug 2006 15:29:49 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GFtjp-0003fC-G2
	for linux-lvm@redhat.com; Wed, 23 Aug 2006 15:29:49 +0100
Date: Wed, 23 Aug 2006 15:29:49 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] after vgreduce --remove-missing,
	*no* lvm commands work correctly
Message-ID: <20060823142949.GA13859@agk.surrey.redhat.com>
References: <1156095294.3778.5.camel@dividebyzero.somewhere.localtld>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1156095294.3778.5.camel@dividebyzero.somewhere.localtld>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Aug 20, 2006 at 01:34:54PM -0400, Andrew Jones wrote:
> I'm at the end of my rope on this one.  

Resort to vgcfgrestore to put your metadata back how it was.
[edit backup file by hand if necessary first to remove things that have gone]

Evidently vgreduce --removemissing doesn't handle active pvmoves.

Alasdair
-- 
agk@redhat.com
