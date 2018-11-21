Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C25F15C221
	for <linux-lvm@redhat.com>; Wed, 21 Nov 2018 09:57:02 +0000 (UTC)
Received: from postamt.cs.uni-dortmund.de (postamt.cs.uni-dortmund.de
	[129.217.4.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 265B13082B70
	for <linux-lvm@redhat.com>; Wed, 21 Nov 2018 09:57:00 +0000 (UTC)
Received: from postweb.cs.uni-dortmund.de (postweb [129.217.4.49])
	(authenticated bits=0)
	by postamt.cs.uni-dortmund.de (8.12.6/8.12.6) with ESMTPSA id
	wAL9uwSS021328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 21 Nov 2018 10:56:58 +0100 (MET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 21 Nov 2018 10:56:58 +0100
From: Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
In-Reply-To: <1542382913.30686.3@mail.gathman.org>
References: <e5147fd46fc8d3acf7eebac26a50852f@cs.uni-dortmund.de>
	<20181115175718.GE5291@agk-dp.fab.redhat.com>
	<2a7f4f1fc1a54fd6eca7d7bc9a6249ae@cs.uni-dortmund.de>
	<1542382913.30686.3@mail.gathman.org>
Message-ID: <ae2dff6f425466ed773e8e5330fce33e@cs.uni-dortmund.de>
Subject: Re: [linux-lvm] lvcreate from a setuid-root binary
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

On 2018-11-16 16:41, Stuart D. Gathman wrote:
> It's not very elegant, but the quick and dirty solution is to use sudo

probably you had not yet read that far in this thread, but I already 
wrote that sudo does not work when called from pam_exec.

To get the stderr and stdout results of sudo, I wrote a shell script 
wrapper around it, and the results are (maybe because sudo itself uses 
PAM?):

sudo: unable to change to root gid: Operation not permitted
sudo: unable to initialize policy plugin

Someone wrote that he assumes that pam_exec ignores the setuid-bit in 
the file permissions, but that is obviously wrong, as this whole thread 
is about why lvcreate, when being called from my setuid-root-binary, has 
permission problems though all three (real, effective and saved) UIDs 
are 0 (and of course I checked that they really are 0).

Regards
   Christoph
