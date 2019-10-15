Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E89A06012C
	for <linux-lvm@redhat.com>; Tue, 15 Oct 2019 02:19:40 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6735330860CB
	for <linux-lvm@redhat.com>; Tue, 15 Oct 2019 02:19:36 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Tue, 15 Oct 2019 02:18:58 +0000
From: Gang He <GHe@suse.com>
Date: Tue, 15 Oct 2019 02:19:17 +0000
Message-ID: <CH2PR18MB3206671AFA3354070E908D85CF930@CH2PR18MB3206.namprd18.prod.outlook.com>
References: <CH2PR18MB32066B47726171588477EAC1CF900@CH2PR18MB3206.namprd18.prod.outlook.com>
	<5b456c7b-13bf-b7fc-9347-eb54ccb6cc72@redhat.com>
	<CH2PR18MB32063E1556F117BA9B9F5285CF900@CH2PR18MB3206.namprd18.prod.outlook.com>
	<20191014131943.GA1058@agk-dp.fab.redhat.com>
In-Reply-To: <20191014131943.GA1058@agk-dp.fab.redhat.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] devices/dir configuration
 option	in	/etc/lvm/lvm.conf can be edited?
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Alasdair,

Thank for comments.
That means we should update the comments to the latest, this can help to tell the user "this is advanced option".

Thanks
Gang

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Alasdair G Kergon
> Sent: 2019��10��14�� 21:20
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Subject: Re: [linux-lvm] devices/dir configuration option in /etc/lvm/lvm.conf
> can be edited?
> 
> On Mon, Oct 14, 2019 at 10:52:02AM +0000, Gang He wrote:
> > That means we should tell the user, you should not edit this option (dir =
> "/dev") in the lvm.conf, right?
> 
> The existing comment is incomplete and should be updated to mention the
> other effects.  The option pre-dates udev and so the "newer"
> interlocking there ought to be mentioned.  The description of 'advanced'
> could also be updated to explain that that means you should not change it
> unless you know exactly what you are doing!  The option exists to simplify
> some development, test and support scenarios where you want to have two or
> more distinct userspace LVM instances running on a single machine.  For
> example, to try to reproduce a certain type of user-reported bug you might set
> up a temporary /dev in a non-default location with contents that match that
> user's system and point the tools at that using this option.
> 
> Alasdair
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
