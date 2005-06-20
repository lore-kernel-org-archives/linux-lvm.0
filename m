Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5KDR9u04173
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 09:27:09 -0400
Received: from server.echohome.org (s233-64-196-242.try.wideopenwest.com
	[64.233.242.196])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5KDQwCt016282
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 09:26:59 -0400
Received: from www.echohome.org (localhost.localdomain [127.0.0.1])
	by server.echohome.org (8.12.8/8.12.8) with ESMTP id j5KDQnb5029833
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 09:26:49 -0400
Message-ID: <36801.64.233.242.196.1119274009.squirrel@www.echohome.org>
In-Reply-To: <200506201517.01268.krienke@uni-koblenz.de>
References: <1119268975.25392.34.camel@volt>
	<200506201517.01268.krienke@uni-koblenz.de>
Date: Mon, 20 Jun 2005 09:26:49 -0400 (EDT)
Subject: Re: [linux-lvm] Is LVM safe?
From: "Erik Ohrnberger" <Erik@echohome.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: Erik@echohome.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Mon, June 20, 2005 9:17, Rainer Krienke said:
>
> The main difference between a partition and lvm is in my eyes that in lvm
> you
> usually do not have a single disk where your data is on. Instead you will
> have a bunch of disks and possibly your data are spread across all of
> these
> disks (depending on the setup of your volumegroups).
> (snip)

Hmm.
The thought just crossed my mind that the failure rate of the LVM would be
the sum of the failure rates of all the disks in your LVM.
