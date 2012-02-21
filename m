Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1LGoD6d002846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 11:50:14 -0500
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1Rzsur-0003px-Iz
	for linux-lvm@redhat.com; Tue, 21 Feb 2012 16:50:13 +0000
Date: Tue, 21 Feb 2012 16:50:13 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20120221165013.GB14666@agk-dp.fab.redhat.com>
References: <20120221102932.19eb3218@bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20120221102932.19eb3218@bettercgi.com>
Subject: Re: [linux-lvm] mirror_region_size default: 4096 six times
	faster	than 512?
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

On Tue, Feb 21, 2012 at 10:29:32AM -0600, Ray Morris wrote:
> If 4096 is OFTEN several times faster than 512, would it make sense 
> to consider canging the default?

Hard to know, really.

What could be useful though would be some tuning scripts, that run tests like
that on a given installation and suggest tweaks like that.

Alasdair
