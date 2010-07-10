Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6AFoWVw016676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 10 Jul 2010 11:50:33 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1OXcK0-00075q-66
	for linux-lvm@redhat.com; Sat, 10 Jul 2010 16:50:32 +0100
Date: Sat, 10 Jul 2010 16:50:32 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20100710155031.GA26290@agk-dp.fab.redhat.com>
References: <AANLkTikfqJRdgmf2ib9pz23p2IAz-fogXaSzfCv0tgEB@mail.gmail.com>
	<1278722281.8612.37@raydesk1.bettercgi.com>
	<Pine.LNX.4.64.1007092051070.29512@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1007092051070.29512@bmsred.bmsi.com>
Subject: Re: [linux-lvm] efficiently copying snapshot data.
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

On Fri, Jul 09, 2010 at 09:01:02PM -0400, Stuart D. Gathman wrote:
> Copy to a regular LV on the target system, and then do some dmsetup 
> and metadata magic to turn the LV (which is a copy of a COW table) into a
> snapshot of the master LV with the COW already populated.

> I don't think such a utility exists.

lvconvert -s  does this, regardless of what the man page might lead you
to believe!

Alasdair
