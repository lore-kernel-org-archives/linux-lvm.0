Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q49NTdoS023146
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 9 May 2012 19:29:40 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1SSGKA-0005al-Sx
	for linux-lvm@redhat.com; Thu, 10 May 2012 00:29:39 +0100
Date: Thu, 10 May 2012 00:29:38 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20120509232938.GD20530@agk-dp.fab.redhat.com>
References: <4FAAFBE9.2000707@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4FAAFBE9.2000707@redhat.com>
Subject: Re: [linux-lvm] project bugtracker and source
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

On Wed, May 09, 2012 at 04:21:13PM -0700, Andy Grover wrote:
> Hi, is there an LVM bugtracker? I didn't see a link on the LVM2 resource
> page.

(It's about time we updated the web site...it's hinted at on the dm page.)
 
We use the Red Hat bugzilla.

File upstream bugs against Fedora rawhide:
  https://bugzilla.redhat.com/enter_bug.cgi?product=Fedora&component=lvm2&version=rawhide

> Also, any plans to move away from CVS for source control?

There is a read-only git mirror at:
  http://sourceware.org/git/?p=lvm2.git;a=summary
  git://sourceware.org/git/lvm2.git

Alasdair
