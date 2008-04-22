Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3MH9r44023409
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 13:09:53 -0400
Received: from smtp02.atlngahp.sys.nuvox.net (smtp-out2.atlngahp.sys.nuvox.net
	[70.43.63.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3MH9dwM026268
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 13:09:39 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp02.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3MH9bAq017543
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 13:09:37 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id ECD90370545
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 13:09:36 -0400 (EDT)
Message-ID: <480E1BD1.3020601@Media-Brokers.com>
Date: Tue, 22 Apr 2008 13:09:37 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshot question...
References: <480DBE54.1090406@Media-Brokers.com>	<chaz20080422104744.GI20413@artesyncp.com>	<480E121A.7020100@Media-Brokers.com>
	<20080422164712.GA22544@pretender.frop.net>
In-Reply-To: <20080422164712.GA22544@pretender.frop.net>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 4/22/2008, dave@frop.net (dave@frop.net) wrote:
> The snapshot *looks like* a copy of the original volume for all 
> intents and purposes.  You can ignore the fact that it really only 
> saves the difference between the two volumes.  As far as you are 
> concerned, the snapshot is identical to the volume it was created 
> from at the time of the snapshot. 

and

> Your snapshot device is a *virtual* device. And if you do a cat
> /dev/vg/snapshot, you'll get 100GB worth of data which will be
> exactly the same as you would have gotten if you had done a cat
> /dev/vg/original at the time you did the snapshot.

<lightbulb>
Ahh... like say a link (soft? hard? not that it matters)...

Ok, makes sense now...

And yes, I figured the COW stuff was LVM voodoo-magic, so its good to 
know that I don't 'need to know'... :)
</lightbulb>

At least,  I hope I got it now...

Lastly...

Should the snapshot volume fill up, what happens to the original? I'm 
guessing that it would be protected from any kind of data loss?

Thanks for the hand-holding...

-- 

Best regards,

Charles
