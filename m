Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84C695C231
	for <linux-lvm@redhat.com>; Mon, 14 Oct 2019 13:19:45 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@redhat.com>) id 1iK0GG-0000Ir-67
	for linux-lvm@redhat.com; Mon, 14 Oct 2019 14:19:44 +0100
Date: Mon, 14 Oct 2019 14:19:44 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20191014131943.GA1058@agk-dp.fab.redhat.com>
References: <CH2PR18MB32066B47726171588477EAC1CF900@CH2PR18MB3206.namprd18.prod.outlook.com>
	<5b456c7b-13bf-b7fc-9347-eb54ccb6cc72@redhat.com>
	<CH2PR18MB32063E1556F117BA9B9F5285CF900@CH2PR18MB3206.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR18MB32063E1556F117BA9B9F5285CF900@CH2PR18MB3206.namprd18.prod.outlook.com>
Subject: Re: [linux-lvm] devices/dir configuration option
	in	/etc/lvm/lvm.conf can be edited?
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Oct 14, 2019 at 10:52:02AM +0000, Gang He wrote:
> That means we should tell the user, you should not edit this option (dir = "/dev") in the lvm.conf, right?

The existing comment is incomplete and should be updated to mention
the other effects.  The option pre-dates udev and so the "newer"
interlocking there ought to be mentioned.  The description of 'advanced'
could also be updated to explain that that means you should not change
it unless you know exactly what you are doing!  The option exists to
simplify some development, test and support scenarios where you want to
have two or more distinct userspace LVM instances running on a single
machine.  For example, to try to reproduce a certain type of
user-reported bug you might set up a temporary /dev in a non-default
location with contents that match that user's system and point the tools
at that using this option.

Alasdair
