Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i38EMMj32417
	for <linux-lvm@redhat.com>; Thu, 8 Apr 2004 10:22:22 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i38EMAGl028270
	for <linux-lvm@redhat.com>; Thu, 8 Apr 2004 10:22:10 -0400
Date: Thu, 8 Apr 2004 12:04:53 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm2 weirdness on software RAID5
Message-ID: <20040408100452.GB22162@percy.comedia.it>
References: <1081378532.25836.264.camel@arthur.cbd.careercast.com>
	<20040407234649.GA27033@ossmann.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040407234649.GA27033@ossmann.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Apr 07, 2004 at 05:46:49PM -0600, Michael Ossmann wrote:
>Looks like lvm is configured to allow both /dev/md* and
>/dev/hd* as physical devices.  You probably want to limit it
>to /dev/md* so that it doesn't get confused by things it
>finds on the raw disk partition devices.  You can do this
>with:
Unfortunately this is the default behaviour with lvm2 tools.
i posted a patch on this list, but did not get any feedback.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
