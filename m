Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4QG30003356
	for <linux-lvm@redhat.com>; Wed, 26 May 2004 12:03:00 -0400
Received: from outmta-1.esr.lvcm.net (outmta-1.esr.lvcm.net [24.234.0.14])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4QG2sHA019450
	for <linux-lvm@redhat.com>; Wed, 26 May 2004 12:02:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by outmta-1.esr.lvcm.net (Postfix) with ESMTP id 018A92411D
	for <linux-lvm@redhat.com>; Wed, 26 May 2004 09:04:22 -0700 (PDT)
Received: from outmta-1.esr.lvcm.net ([127.0.0.1])
	by localhost (outmta-1.esr.lvcm.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 15714-02 for <linux-lvm@redhat.com>;
	Wed, 26 May 2004 09:04:21 -0700 (PDT)
Received: from mlug.missouri.edu (ip68-104-28-32.lv.lv.cox.net [68.104.28.32])
	by outmta-1.esr.lvcm.net (Postfix) with ESMTP id 75931241CF
	for <linux-lvm@redhat.com>; Wed, 26 May 2004 09:04:21 -0700 (PDT)
Message-ID: <40B4BFBB.2010308@mlug.missouri.edu>
Date: Wed, 26 May 2004 09:03:07 -0700
From: Michael <mogmios@mlug.missouri.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] /boot on lvm?
References: <40A72846.5050801@mlug.missouri.edu>	<20040516084236.GB8872@percy.comedia.it>
	<40A73771.2030604@osp.nl>
	<20040526153118.GA31460@mail1.smilehouse.com>
In-Reply-To: <20040526153118.GA31460@mail1.smilehouse.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


>>Having your root in a resizable volume has many advantages I think.
>>    
>>
When I installed Fedora Core 2 the other day the installation program 
was nice enough to allow me to setup LVM as easily as I could have setup 
none LVM partitions but it wouldn't let me put /boot in LVM. Since I'd 
already been told that doing so was possible I was a little disappointed 
but otherwise everything worked well. It did let me put /usr, /var, and 
/home in LVM.
