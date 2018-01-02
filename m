Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EC6660BE4
	for <linux-lvm@redhat.com>; Tue,  2 Jan 2018 18:43:35 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@redhat.com>) id 1eWRXC-0008KI-8J
	for linux-lvm@redhat.com; Tue, 02 Jan 2018 18:43:34 +0000
Date: Tue, 2 Jan 2018 18:43:34 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20180102184334.GA22713@agk-dp.fab.redhat.com>
References: <12562310-b26a-8a83-9481-d8b54fda40d5@gmail.com>
	<e70ef50c-08ed-b75b-df30-8eae007fa556@redhat.com>
	<cdefc95e-38bc-d071-c592-838991d488f2@gmail.com>
	<d5495aca-c9db-099a-13f2-f602df311a7f@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5495aca-c9db-099a-13f2-f602df311a7f@redhat.com>
Subject: Re: [linux-lvm] unable to exclude LVs using global_filter
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

The key concept to grasp is that LVM works with devices (i.e. major
number + minor number pairs) rather than filesystem paths and it makes a
single "use or ignore" decision for each device (not for each path).

One device might be reachable through more than one filesystem path that
lvm has been configured to check and, if so, all the paths are checked
against the filter independently and the results feed into that single
decision according to the rules described.

Alasdair
