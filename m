Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2JIt6Rf022486
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2010 14:55:06 -0400
Received: from EXHUB016-4.exch016.msoutlookonline.net
	(exhub016-4.exch016.msoutlookonline.net [207.5.72.225])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2JIsrEt021455
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2010 14:54:53 -0400
Message-ID: <4BA3C87C.7020608@cfl.rr.com>
Date: Fri, 19 Mar 2010 14:54:52 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4BA3BEBE.2010204@cfl.rr.com>
	<f4f537b51003191136r5f0d96f1m3c0ed8315382009c@mail.gmail.com>
In-Reply-To: <f4f537b51003191136r5f0d96f1m3c0ed8315382009c@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Data alignment
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

On 3/19/2010 2:36 PM, Eugene Vilensky wrote:
> Align the partition?

Then I waste 512k on the MBR, and another 512k on the pv header.  I'd
like to avoid that if possible and it seems like --dataalignoffset
should let me do that, but it doesn't accept negative numbers.
