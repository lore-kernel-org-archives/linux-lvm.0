Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r77DX0V2029723
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 7 Aug 2013 09:33:03 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1V73rG-0007yz-Kb
	for linux-lvm@redhat.com; Wed, 07 Aug 2013 14:32:58 +0100
Date: Wed, 7 Aug 2013 14:32:58 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130807133258.GA28325@agk-dp.fab.redhat.com>
References: <20130806173719.GB15184@mail.waldi.eu.org>
	<52020FD1.2000004@redhat.com>
	<20130807123656.GA18854@mail.waldi.eu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20130807123656.GA18854@mail.waldi.eu.org>
Subject: Re: [linux-lvm] Missing error handling in lv_snapshot_remove
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
To: linux-lvm@redhat.com

On Wed, Aug 07, 2013 at 02:36:57PM +0200, Bastian Blank wrote:
> I'm a developer and use it to trigger an error condition. Please don't
> start with that crap about what a user should or should not do.
 
Use the software however you want, but upstream LVM only supports the
direct use of devices exposed under /dev/$VG.  Any other devices it
creates are private and direct access is unsupported and can cause
problems as you have demonstrated.

These situations you are investigating are caused by external
interference with LVM operations and should not occur if LVM is used
as intended, so it is better for the code to 'fail safe' and stop so the
cause can be investigated and then the system cleaned up safely.  An
attempt to clean up automatically would risk making the situation worse.

Alasdair
