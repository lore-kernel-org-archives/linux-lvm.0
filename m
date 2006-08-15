Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7F9u1QU001788
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 05:56:01 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7F9tsc7006269
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 05:55:55 -0400
Date: Tue, 15 Aug 2006 11:55:53 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Running LVM on shared lun's
Message-ID: <20060815095553.GE21221@percy.comedia.it>
References: <1154987972.16651.28.camel@localhost.localdomain>
	<9AF3EE740197A64881ED6E9265B2C31170DAC5@SVL1XCHCLUPIN02.enterprise.veritas.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9AF3EE740197A64881ED6E9265B2C31170DAC5@SVL1XCHCLUPIN02.enterprise.veritas.com>
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

On Tue, Aug 08, 2006 at 09:23:04AM -0700, David Chan wrote:
> 
>Don't think LVM is cluster aware.  Doing so can potentially cause loss
>of LV's/data due to metadata corruption on the LVM level.  
LVM2 supports cluster locking, either using internal locking which works
with CMAN or GULM, or by using an external locking library that can be
customized to work with every cluster software that supports locking of
resources.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
