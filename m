Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m74HL9uH016912
	for <linux-lvm@redhat.com>; Mon, 4 Aug 2008 13:21:09 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m74HKGQ7005077
	for <linux-lvm@redhat.com>; Mon, 4 Aug 2008 13:20:32 -0400
Received: from d03relay03.boulder.ibm.com (d03relay03.boulder.ibm.com
	[9.17.195.228])
	by e32.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m74HDq4p020018
	for <linux-lvm@redhat.com>; Mon, 4 Aug 2008 13:13:52 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay03.boulder.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id
	m74HK1on124778
	for <linux-lvm@redhat.com>; Mon, 4 Aug 2008 11:20:02 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m74HK0WJ014072
	for <linux-lvm@redhat.com>; Mon, 4 Aug 2008 11:20:00 -0600
Received: from malahal.beaverton.ibm.com (malahal.beaverton.ibm.com
	[9.47.17.130])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	m74HK0BU012369
	for <linux-lvm@redhat.com>; Mon, 4 Aug 2008 11:20:00 -0600
Date: Mon, 4 Aug 2008 10:19:45 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] create logical volumes over remote file system
	(likesamba)?
Message-ID: <20080804171945.GA16635@us.ibm.com>
References: <1A2D7011B6705B449F66B36B232097C07A7740@x1.ads.i-dmedia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1A2D7011B6705B449F66B36B232097C07A7740@x1.ads.i-dmedia.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Zurell, Falko [Falko.Zurell@idmedia.com] wrote:
>    Hi,
> 
>    I think this is not possible with Samba as Samba will provide a NAS
>    storage (space with filesystem etc.). For LVM you would need raw devices.
>    So maybe iSCSI would be an idea.

Can you create a loop device on a file, and then use LVM?
