Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2QAR0uB009246
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 05:27:00 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2QAQsRD018820
	for <linux-lvm@redhat.com>; Sun, 26 Mar 2006 05:26:54 -0500
Date: Sun, 26 Mar 2006 12:26:53 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] online resize
Message-ID: <20060326102653.GL14018@percy.comedia.it>
References: <20060316130827.5D17912ED4@bluewhale.planbit.co.uk>
	<200603260246.13779.krakrjak@volumehost.net>
	<20060326092923.GJ14018@percy.comedia.it>
	<200603260407.27160.krakrjak@volumehost.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200603260407.27160.krakrjak@volumehost.net>
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

On Sun, Mar 26, 2006 at 04:07:27AM -0600, Zac Slade wrote:
>On Sunday 26 March 2006 03:29, Luca Berra wrote:
>> On Sun, Mar 26, 2006 at 02:46:13AM -0600, Zac Slade wrote:
>> >ext2/3, resizable offline reliably.  Online resize is a *very*
>> > experimental experiment.  Have good backups.
>>
>> ext2/3 online resize is available as default in RedHat 4, and it just
>> works.
>I'm glad that's the case for you.  If it works don't fix it.  However, from 
>recent experience it is not release quality (especially for shrinking).
if you have any horror story, please share it, it will surely help other
users out there.

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
