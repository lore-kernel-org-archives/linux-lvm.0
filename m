Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9UAooe8021827
	for <linux-lvm@redhat.com>; Thu, 30 Oct 2008 06:50:51 -0400
Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m9UAootF019644
	for <linux-lvm@redhat.com>; Thu, 30 Oct 2008 06:50:50 -0400
Message-ID: <49098F73.7000706@redhat.com>
Date: Thu, 30 Oct 2008 10:41:55 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] dmraid - where is the raid done?
References: <1224269483.17821.39.camel@pc.ilinx>
	<c268e4660810270656u72bb8e29n69866ccf77a0fef2@mail.gmail.com>
In-Reply-To: <c268e4660810270656u72bb8e29n69866ccf77a0fef2@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
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

Drew wrote:
> 2008/10/17 Brian J. Murrell <brian@interlinx.bc.ca>:
>> I think this is the right place for dmraid questions.  Please redirect
>> me if it's not.  Thanx.
> 
> Try the folks over at the software raid list. They'd be your best bet.
> 
> list: linux-raid@vger.kernel.org
> 

Wrong list - that's for the Linux MD RAID subsystem (mdadm, /dev/md* and
friends). You're looking for ataraid-list:

http://www.redhat.com/mailman/listinfo/ataraid-list

Which is the place for discussion of dmraid development.

Regards,
Bryn.
