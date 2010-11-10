Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAAFC1ij002012
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 10:12:01 -0500
Received: from EXHUB016-4.exch016.msoutlookonline.net
	(exhub016-4.exch016.msoutlookonline.net [207.5.72.225])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAAFBkwN021576
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 10:11:46 -0500
Message-ID: <4CDAB63A.9090504@cfl.rr.com>
Date: Wed, 10 Nov 2010 10:11:54 -0500
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4CDAAE84.5060806@gmail.com>
In-Reply-To: <4CDAAE84.5060806@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Bad disk?
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
Cc: Mauricio Tavares <raubvogel@gmail.com>

On 11/10/2010 9:39 AM, Mauricio Tavares wrote:
> Yesterday I added a hard drive (to put extra stuff on it) to my ubuntu
> 10.10 box and created a LVM in it. Then copied some files to it and
> restarted the machine to see if it would mount into the right
> mountpoint. It didn't. So I decided to see if it was there (vg in
> question is export):

None of the errors you posted mention a physical disk at all, so there
isn't anything wrong with them.  To find out what dm-0 is you need to
poke around with dmsetup.
