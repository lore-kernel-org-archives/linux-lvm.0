Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JGobVZ020487
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:50:37 -0400
Received: from lvps87-230-0-242.dedicated.hosteurope.de
	(lvps87-230-0-242.dedicated.hosteurope.de [87.230.0.242])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JGoPgW024120
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:50:25 -0400
Date: Wed, 19 May 2010 18:24:01 +0200
From: Michael Guntsche <mike@it-loops.com>
Message-ID: <20100519162401.GA4163@trillian.comsick.at>
References: <059801caf769$fc848350$f58d89f0$@com>
	<4BF40A8B.2000201@alteeve.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BF40A8B.2000201@alteeve.com>
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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

On 2010.05.19 11:58:03 , Digimer wrote:
> On 10-05-19 11:43 AM, kevin wrote:
> >Howdy,
> >
> >(fdisk+mkfs+pvcreate+vgextend+lvextend) is the right way to go about adding
> 
> The mkfs isn't supposed to be there, just set the new drive's
> partition to type '8e' (Linux LVM).
Or use the full device without any partition at all.

/Michael
