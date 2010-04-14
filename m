Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3EMRewp027853
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 18:27:41 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1O2B3c-0005hj-Gb
	for linux-lvm@redhat.com; Wed, 14 Apr 2010 23:27:40 +0100
Date: Wed, 14 Apr 2010 23:27:40 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20100414222740.GE13021@agk-dp.fab.redhat.com>
References: <4BC58DF3.608@redhat.com> <4BC5D58F.2030809@cfl.rr.com>
	<Pine.LNX.4.64.1004141603170.14791@bmsred.bmsi.com>
	<4BC62FBF.6030302@cfl.rr.com>
	<20100414212845.GD13021@agk-dp.fab.redhat.com>
	<Pine.LNX.4.64.1004141752130.14791@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1004141752130.14791@bmsred.bmsi.com>
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

On Wed, Apr 14, 2010 at 05:57:05PM -0400, Stuart D. Gathman wrote:
> This reduces LVM to the equivalent of a partition as far as the
> boot code is concerned.
 
That's been discussed, but nothing happened.  It's pretty easy to do.

Instead a primitive parser was written for grub2 independently of the
LVM2 developers that can read a subset of LVM2 metadata while being
unaware of its own limitations - so it is straightforward to generate
correct LVM2 metadata that the parser will misinterpret and use to
activate volumes jumbling up your data.  Don't use it without first
testing it processes your specific metadata correctly.

A supportable redesign would see the code that grubN uses provided
by the upstream LVM2 package (in some agreed form - library or
source) so that the grub package itself has no specific LVM2 knowledge,
but imports what it needs through some agreed interface.

If people want to work on this - i.e. liase with the grub and lvm
developers to design and code up a suitable interface - please step
forward and start talking to us!

Alasdair
