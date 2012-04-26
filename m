Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q3QEwFDa023199
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2012 10:58:15 -0400
Received: from fmailhost02.isp.att.net (fmailhost02.isp.att.net
	[204.127.217.102])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3QEwDoH003679
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2012 10:58:14 -0400
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id 15E3B2D6BFA
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2012 10:58:12 -0400 (EDT)
Received: from bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-maia, port 10024)
	with LMTP id 03242-03-2 for <linux-lvm@redhat.com>;
	Thu, 26 Apr 2012 10:58:11 -0400 (EDT)
Date: Thu, 26 Apr 2012 10:58:11 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20120426145811.GA3329@bdmcc-us.com>
References: <20120424132419.GA2244@bdmcc-us.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20120424132419.GA2244@bdmcc-us.com>
Subject: Re: [linux-lvm] Missing PV
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
To: linux-lvm@redhat.com

On Tue, Apr 24, 2012 at 09:24:19AM -0400, Brian McCullough wrote:
> I have encountered a situation where vgscan and vgchange are complaining
> about a missing UUID.
> 
> As far as I know, all, or almost all, of the LV is on the PV that is
> known ( how do I know for sure? ), so I think that I am trying to just
> "remove" the PV and recover what I can of the LV.

Sorry to be dense, but I don't feel confident about proceeding before I
know what the next step should be.

I am pretty sure that I can remove the "lost" PV, using the
instructions that I have found in multiple places, including the
referenced slide deck, but I have not been able to find anything about
recovering the LV that spans from the existing PV into the lost one.

Since most, if not all of the existing data from that LV is on the
"good" PV, I would hope that I can recover that filesystem.  The
question is "How?"



> I have read Milan Brosz' slides from 2009, and the only piece that I
> seem to be missing is the recovery of the LV.
> 
> 
> I have made a copy of the PV to work with and the procedure that I need
> to follow, as I understand it, is as follows:
> 
> 
> vgscan
> vgchange -a y ( fails )
> vgchange -a y --partial
> vgreduce --removemissing vgname
> 
> then what?
> 
> I have done:
> 
> pvs -o +uuid
> lvs -o +devices
> 
> But am not sure how to interpret the results.  lvs shows two entries for
> the LV that I am interested in.  The second entry shows "unknown device(0)".  


Thanks,
Brian
