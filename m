Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2EJAd121245
	for <linux-lvm@redhat.com>; Tue, 14 Mar 2006 14:10:39 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2EJAUvQ000477
	for <linux-lvm@redhat.com>; Tue, 14 Mar 2006 14:10:31 -0500
Date: Tue, 14 Mar 2006 20:10:29 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] I/O error
Message-ID: <20060314191028.GA25405@percy.comedia.it>
References: <4415681D.5080806@arnet.net.ar>
	<Pine.LNX.4.63.0603130956290.2557@tungsten.msp.technicality.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.63.0603130956290.2557@tungsten.msp.technicality.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Mar 13, 2006 at 09:57:27AM -0600, Nate Carlson wrote:
>You might want to download QLogic's drivers for the card, and build them 
>with multipath support.. then you'll only see the drives once, and it 
>should hopefully clear out these errors for you.
>
>(The multipath driver used to be included in the qlogic drivers in the 
>kernel, but were removed for some reason I Don't recall..)
probably because multipath-tools is a cleaner solution?

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
