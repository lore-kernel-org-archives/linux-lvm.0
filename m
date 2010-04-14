Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3ELCoSe027149
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 17:12:50 -0400
Received: from EXHUB016-1.exch016.msoutlookonline.net
	(exhub016-1.exch016.msoutlookonline.net [207.5.72.163])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3ELCaA3032560
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 17:12:37 -0400
Message-ID: <4BC62FBF.6030302@cfl.rr.com>
Date: Wed, 14 Apr 2010 17:12:31 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4BC58DF3.608@redhat.com> <4BC5D58F.2030809@cfl.rr.com>
	<Pine.LNX.4.64.1004141603170.14791@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1004141603170.14791@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Problems resizing physical volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 4/14/2010 4:05 PM, Stuart D. Gathman wrote:
> Is that with GRUB or LILO?  Last I knew, grub on EL5.4 didn't support
> booting from LVM.  I assume LILO would work, since it goes by absolute
> sectors.  Which GRUB version supports LVM?

Grub2.  I think it even understands striped volumes.  It does not
understand snapshots yet.
