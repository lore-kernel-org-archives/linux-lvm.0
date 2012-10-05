Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q95BQKGD022278
	for <linux-lvm@redhat.com>; Fri, 5 Oct 2012 07:26:20 -0400
Received: from qmta11.emeryville.ca.mail.comcast.net
	(qmta11.emeryville.ca.mail.comcast.net [76.96.27.211])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q95BQJrT005140
	for <linux-lvm@redhat.com>; Fri, 5 Oct 2012 07:26:19 -0400
Message-ID: <506EC2AC.8090505@mohawksoft.com>
Date: Fri, 05 Oct 2012 07:21:16 -0400
From: Mark Woodward <markw@mohawksoft.com>
MIME-Version: 1.0
References: <mailman.18903.1349274978.3548.linux-lvm@redhat.com>
	<506C5CD8.2070502@mohawksoft.com> <506CFA0B.4000006@tlinx.org>
	<506D055E.901@mohawksoft.com> <506D1931.4040102@tlinx.org>
	<506D624A.5070104@mohawksoft.com> <506DA0B4.5020208@redhat.com>
	<506DA504.8010509@mohawksoft.com> <506EA7C8.409@redhat.com>
In-Reply-To: <506EA7C8.409@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] access or interface to list of blocks that have,
 changed	via C.O.W.?
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
To: "Bryn M. Reeves" <bmr@redhat.com>
Cc: Linda Walsh <lvm@tlinx.org>, LVM general discussion and development <linux-lvm@redhat.com>

On 10/05/2012 05:26 AM, Bryn M. Reeves wrote:
> On 10/04/2012 04:02 PM, Mark Woodward wrote:
>> On 10/04/2012 10:44 AM, Bryn M. Reeves wrote:
>>> Really? I'd be surprised if it even builds against modern kernels or
>>> device-mapper.
>> Well.....
>> The LVM2 code that ships with most distros still uses the old interfaces
>> and still (Ubuntu 12.04) seemst to create a COW file with SnAp
> Yes; that's the traditional dm-snapshot target that has been in the
> kernel for years. The Zumastor/ddsnap stuff was a separate project to
> replace that using a new metadata format and target - they are not the
> same and the Zumastor snapshot code was never merged in the kernel.
So, after this discussion, I went to my Ubuntu 12.04 system (3.2.0) and 
tried some of my LVM2 utilities, and they read the header but found no 
changes in a snapshot when clearly there had been some.

It seems I am wrong, but I'm a little confused, did the developers 
change the format of the snapshot data COW file without changing the 
file header signature? If so, that is very bad thing to do. If the COW 
format has changed and the device header signature has not, how does one 
correctly determine how the data is stored?
>
>>> Snapshots using the thinp target use the metadata format described in
>>> dm-thin-metadata.c.
>> Where are these files to be found?
> In drivers/md in the kernel sources - the dm-thin stuff was merged after
> 3.1 (October last year); see commits starting with 991d9fa.
>
> Regards,
> Bryn.
