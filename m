Date: Thu, 02 Sep 2004 15:15:51 -0500
From: "P. Larry Nelson" <lnelson@uiuc.edu>
Subject: Re: [linux-lvm] 2 TB limit
In-reply-to: <20040512163244.C23665@homer.msp.redhat.com>
Message-id: <41377F77.7050201@uiuc.edu>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <005601c412af$748d71a0$1fa0a8c0@blec>
	<200403261813.50041.krustev@krustev.net>
	<20040326161644.GF12948@null.msp.redhat.com>
	<20040512163244.C23665@homer.msp.redhat.com>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: agk@redhat.com

On 5/12/2004 4:32 PM, Alasdair G Kergon wrote:

> On Fri, Mar 26, 2004 at 10:16:44AM -0600, AJ Lewis wrote:
> 
>>The PE size limitation isn't present in lvm2 (The version of lvm that works
>>in 2.6) if you use the native lvm2 format.  So you should be able to create
>>larger than 2TB LVs with LVM2.  Just FYI.
> 
> 
> As those of you monitoring the lvm-cvs mailing list may have noticed, 
> I've added code to the LVM2 CVS tree to help people simulate large devices
> for testing purposes on 2.6 kernels with the latest -udm patches.
> 
>   lvcreate --type zero -L16T vg  # Create 16TB 'zero' device
>   lvcreate -s vg/lvol0 -L1G      # Create snapshot of it
> 
> Then use the snapshot as a 'sparse' device, in the example, supporting
> upto 1GB of actual data.
> 
> [At some point I'll merge it into a one-line command with --type sparse]
> 
> NB There's been a lot of change in CVS recently (and more to come)
> so I expect some new bugs to show up along with the new features:-(
>  
> Alasdair

Being confined to running RedHat and using their updates and RPMs,
I'm running stock RHEL-ES3 file servers with latest RH kernel of
2.4.21-15.0.4.ELsmp and lvm-1.0.3-15.  I'm led to understand that
the ES3 kernel has portions of the 2.6 kernel in it, but I don't
think it has the portion that can handle >2TB file systems.

I have had a need to go to >2TB file systems for some time and am
sort of limping along by stringing together many 2TB file systems.

Can anyone (perhaps our list contributor from RedHat?) tell me when
I can expect a kernel and lvm from RedHat that will allow me to go
beyond the 2TB limit?

Thanks!
- Larry
-- 
P. Larry Nelson (217-244-9855) | Systems/Network Administrator
461 Loomis Lab                 | U of I, CITES Departmental Services
1110 W. Green St., Urbana, IL  | Consultant to: High Energy Physics Group
MailTo:lnelson@uiuc.edu        | http://www.uiuc.edu/ph/www/lnelson
-------------------------------------------------------------------------
  "Information without accountability is just noise."  - P.L. Nelson
