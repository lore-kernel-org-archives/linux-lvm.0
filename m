Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i2BDap808102
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 08:36:51 -0500
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i2BDaot21828
	for linux-lvm@redhat.com; Thu, 11 Mar 2004 07:36:50 -0600
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2-Snapshot
Message-ID: <20040311073650.B4622@homer.msp.redhat.com>
References: <20040310173002.75ca7590.Christoph.Pleger@uni-dortmund.de> <20040311092007.GD2138@reti> <1079007845.6842.4.camel@albert.localnet>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1079007845.6842.4.camel@albert.localnet>; from craig@postnewspapers.com.au on Thu, Mar 11, 2004 at 08:24:05PM +0800
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Mar 11 08:34:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Mar 11, 2004 at 08:24:05PM +0800, Craig Ringer wrote:
> Is there any chance to tweak lvm in the mean time, so that it doesn't
> /try/ to take a snapshot? 

Yes, I'm working on this.

I'll update the installation documentation to refer to the information
about upgrading recently added to the HOWTO:

  http://www.tldp.org/HOWTO/LVM-HOWTO/lvm2faq.html

Alasdair
-- 
agk@redhat.com
