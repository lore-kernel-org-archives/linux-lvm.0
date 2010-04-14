Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3ELSk33032235
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 17:28:47 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1O2A8c-0005R9-41
	for linux-lvm@redhat.com; Wed, 14 Apr 2010 22:28:46 +0100
Date: Wed, 14 Apr 2010 22:28:46 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20100414212845.GD13021@agk-dp.fab.redhat.com>
References: <4BC58DF3.608@redhat.com> <4BC5D58F.2030809@cfl.rr.com>
	<Pine.LNX.4.64.1004141603170.14791@bmsred.bmsi.com>
	<4BC62FBF.6030302@cfl.rr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BC62FBF.6030302@cfl.rr.com>
Subject: Re: [linux-lvm] Problems resizing physical volume
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

On Wed, Apr 14, 2010 at 05:12:31PM -0400, Phillip Susi wrote:
> Grub2.  

Dangerous code which can mis-process configurations it does not recognise.
I advise people not to use it unless they've tested their specific metadata
gets processed by it correctly.

Alasdair
