Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i2C7cM805127
	for <linux-lvm@redhat.com>; Fri, 12 Mar 2004 02:38:22 -0500
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i2C7cMt16486
	for linux-lvm@redhat.com; Fri, 12 Mar 2004 01:38:22 -0600
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [RFC][PATCH] proper DESTDIR handling for device-mapper and LVM2
Message-ID: <20040312013822.C4622@homer.msp.redhat.com>
References: <4051388C.3050700@backtobasicsmgmt.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4051388C.3050700@backtobasicsmgmt.com>; from kpfleming@backtobasicsmgmt.com on Thu, Mar 11, 2004 at 09:11:56PM -0700
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
Date: Fri Mar 12 02:36:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Mar 11, 2004 at 09:11:56PM -0700, Kevin P. Fleming wrote:
> device-mapper and LVM2 Makefiles a little more useful, and to fix a 
> number of problems with the current DESTDIR handling. 

Thanks for the tidying: I'll work through this properly late next week.  
(Office moves today.)  Quick comments: I'd prefer not to see DESTDIR in 
Makefiles though: only in the template, and some (I thought most?) people 
*do* want to pick up some include files etc. from their DESTDIR (they're not
installed on their main system, or the ones on their system are different
versions from the ones in DESTDIR which has the correct environment the
software uses when it runs): perhaps that should be split into a separate
configuration option (enabled by default)?

Alasdair
