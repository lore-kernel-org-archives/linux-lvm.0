Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2GMpqiQ017148
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 18:51:52 -0400
Received: from lists.commandprompt.com (host-159.commandprompt.net
	[207.173.203.159])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2GMpZKp030719
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 18:51:35 -0400
Received: from [192.168.1.2] (or-69-34-217-90.sta.embarqhsd.net [69.34.217.90])
	(authenticated bits=0)
	by lists.commandprompt.com (8.13.8/8.13.8) with ESMTP id n2GMwFUw020680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 15:58:15 -0700
Subject: Re: [linux-lvm] fsync() and LVM
From: "Joshua D. Drake" <jd@commandprompt.com>
In-Reply-To: <49BECA5A.3040407@gmail.com>
References: <49BA9BF9.3070507@esiway.net>
	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>
	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
	<49BC511E.5040402@esiway.net>
	<Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com>
	<49BE9F73.8050109@gmail.com>
	<87f94c370903161236y197edd7ehef3dc8eefc6d617b@mail.gmail.com>
	<49BEB683.7020209@gmail.com>
	<87f94c370903161354v2e43f13ci914f45175ca6af6f@mail.gmail.com>
	<49BEC1CC.5050900@gmail.com>
	<87f94c370903161436y40eddb3pe162bfa64a90e371@mail.gmail.com>
	<49BECA5A.3040407@gmail.com>
Date: Mon, 16 Mar 2009 15:51:27 -0700
Message-Id: <1237243887.29552.43.camel@jd-laptop.pragmaticzealot.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: jd@commandprompt.com,
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 2009-03-16 at 16:53 -0500, Les Mikesell wrote:

> The point of fsync() is for an application to know that a write has been 
> safely committed, as for example sendmail would do before acknowledging 
> to the sender that a message has been accepted.  The question isn't 
> whether an application can call fsync() but rather whether it's return 
> status is lying, making the underlying storage unsuitable for anything 
> that needs reliability.

Right and for databases this is critical. So enlightenment here would be
good.

Sincerely,

Joshua D. Drake


> 
-- 
PostgreSQL - XMPP: jdrake@jabber.postgresql.org
   Consulting, Development, Support, Training
   503-667-4564 - http://www.commandprompt.com/
   The PostgreSQL Company, serving since 1997
