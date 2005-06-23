Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5N0HRu05413
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 20:17:27 -0400
Received: from pd4mo2so.prod.shaw.ca (shawidc-mo1.cg.shawcable.net
	[24.71.223.10])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5N0HJwk032681
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 20:17:22 -0400
Received: from pd4mr6so.prod.shaw.ca (pd4mr6so-qfe3.prod.shaw.ca [10.0.141.69])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0III00HU5GQPH2P6@l-daemon> for linux-lvm@redhat.com; Wed,
	22 Jun 2005 18:16:01 -0600 (MDT)
Received: from pn2ml10so.prod.shaw.ca ([10.0.121.80])
	by pd4mr6so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0III007X0GQP0240@pd4mr6so.prod.shaw.ca> for
	linux-lvm@redhat.com; Wed, 22 Jun 2005 18:16:01 -0600 (MDT)
Received: from [192.168.1.124]
	(S010600015300352b.vc.shawcable.net [24.86.210.170])
	by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28
	2003))
	with ESMTP id <0III0067OGQOPG@l-daemon> for linux-lvm@redhat.com; Wed,
	22 Jun 2005 18:16:00 -0600 (MDT)
Date: Wed, 22 Jun 2005 17:16:00 -0700
From: Terry Rigby <t-rigby@shaw.ca>
Message-id: <200506221716.00221.t-rigby@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Content-disposition: inline
Subject: [linux-lvm] lvextend
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
To: linux-lvm@redhat.com

I am trying to add a full hard drive to my LV by following the directions at 
TLDP.org.  It says there to use lvextend -L +XXG where XX is the size in GB 
you want to add to the LV.  Is there a more simple way to just add a whole 
hard drive ie: /dev/hde

It seems like a pain to have to manually figure out the size of the hard drive 
then add it using lvextend -L +200GB for a 200GB hard drive especially since 
we all know its not actually 200GB.

Thanks for your response.

Terry Rigby
