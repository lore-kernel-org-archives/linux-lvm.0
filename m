Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r1E0jNfY006765
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2013 19:45:23 -0500
Received: from srv2.trombetti.net (srv2.trombetti.net [65.254.53.252])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1E0jM3H018225
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2013 19:45:22 -0500
Received: from localhost (localhost [127.0.0.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: SASL)
	by srv2.trombetti.net (Postfix) with ESMTPSA id 0A78054240
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2013 19:45:20 -0500 (EST)
Message-ID: <511C33AF.7020506@shiftmail.org>
Date: Thu, 14 Feb 2013 01:45:35 +0100
From: Spelic <spelic@shiftmail.org>
MIME-Version: 1.0
References: <511BB48A.3010009@ubuntu.com>
In-Reply-To: <511BB48A.3010009@ubuntu.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 02/13/13 16:43, Phillip Susi wrote:
> there is one mirror segment for the
> entire logical volume being moved, and a linear for the next logical
> volume.

 >  2.  Every  logical  volume in the volume group is searched for 
contiguous data that need moving according to the command line arguments.
 >       For each piece of data found, a new segment is added to the end 
of the pvmove LV.  This segment takes the form of a temporary mirror

so it DOES behave according to the manpage

breaking it up in smaller subsegments would probably have been wiser, 
except that you risk to induce fragmentation if other LVM operations 
happen during the move.
