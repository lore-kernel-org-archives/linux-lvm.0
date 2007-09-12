Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8C56roN018750
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 01:06:55 -0400
Received: from gk.uu.epigenomics.net (gk.uu.epigenomics.net [195.127.125.226])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l8C56oTV024060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 01:06:52 -0400
From: Robert Sander <robert.sander@epigenomics.com>
Subject: Re: [linux-lvm] is it possible to move lvm2 logvols?
Date: Wed, 12 Sep 2007 05:06:48 +0000 (UTC)
Message-ID: <slrnfeesv8.dn9.robert.sander@raman.epigenomics.epi>
References: <46E719BE.5000202@bppiac.hu>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@ml.epigenomics.com

On Wed, 12 Sep 2007 00:42:06 +0200,
 Farkas Levente <lfarkas@bppiac.hu> wrote:
> hi,
> hi we've got a server with a lvm2 pv with a dozen of logvol in it. under
> the lvm we'd like to create a raid1 array on 2 disk. unfortunately we
> create raid0 under it. but the logvols contains a lots of important
> data. we'd like to
> - put 2 new disks into the system,
> - create the raid1 array on it,
> - put a new volgroup over the raid1,

Hi!

Do not create a new vg.
Add the raid1 as a second pv to the existing vg.
Use pvmove to move the logical volumes from one pv to the other.
This is an online operatipn.

Greetings
-- 
Robert Sander                     Senior Manager Information Systems
Epigenomics AG    Kleine Praesidentenstr. 1    10178 Berlin, Germany
phone:+49-30-24345-0                            fax:+49-30-24345-555
http://www.epigenomics.com             robert.sander@epigenomics.com
