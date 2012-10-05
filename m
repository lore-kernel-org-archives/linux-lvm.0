Message-ID: <506EA7C8.409@redhat.com>
Date: Fri, 05 Oct 2012 10:26:32 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <mailman.18903.1349274978.3548.linux-lvm@redhat.com>
	<506C5CD8.2070502@mohawksoft.com> <506CFA0B.4000006@tlinx.org>
	<506D055E.901@mohawksoft.com> <506D1931.4040102@tlinx.org>
	<506D624A.5070104@mohawksoft.com> <506DA0B4.5020208@redhat.com>
	<506DA504.8010509@mohawksoft.com>
In-Reply-To: <506DA504.8010509@mohawksoft.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Mark Woodward <markw@mohawksoft.com>
Cc: Linda Walsh <lvm@tlinx.org>, LVM general discussion and development <linux-lvm@redhat.com>

On 10/04/2012 04:02 PM, Mark Woodward wrote:
> On 10/04/2012 10:44 AM, Bryn M. Reeves wrote:
>> Really? I'd be surprised if it even builds against modern kernels or
>> device-mapper.
> Well.....
> The LVM2 code that ships with most distros still uses the old interfaces 
> and still (Ubuntu 12.04) seemst to create a COW file with SnAp

Yes; that's the traditional dm-snapshot target that has been in the
kernel for years. The Zumastor/ddsnap stuff was a separate project to
replace that using a new metadata format and target - they are not the
same and the Zumastor snapshot code was never merged in the kernel.

>> Snapshots using the thinp target use the metadata format described in
>> dm-thin-metadata.c.
> 
> Where are these files to be found?

In drivers/md in the kernel sources - the dm-thin stuff was merged after
3.1 (October last year); see commits starting with 991d9fa.

Regards,
Bryn.
