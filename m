Message-ID: <506EAAD0.5040706@redhat.com>
Date: Fri, 05 Oct 2012 10:39:28 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <mailman.18903.1349274978.3548.linux-lvm@redhat.com>
	<506C5CD8.2070502@mohawksoft.com> <506CFA0B.4000006@tlinx.org>
	<506D055E.901@mohawksoft.com> <506D1931.4040102@tlinx.org>
	<506D624A.5070104@mohawksoft.com> <506DA0B4.5020208@redhat.com>
	<506DA504.8010509@mohawksoft.com> <506E0701.1070103@bmsi.com>
In-Reply-To: <506E0701.1070103@bmsi.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 10/04/2012 11:00 PM, Stuart D Gathman wrote:
> On 10/04/2012 11:02 AM, Mark Woodward expounded in part:
>>
>>> snapshot target and metadata format. It does not share code with
>>> current (or historic afaik) LVM2/device-mapper and has been dead for a
>>> number of years (last commits around 2008).
>>>
>>>> get the code. It old and not supported currently, but still works.
>>>> I
>>> Really? I'd be surprised if it even builds against modern kernels or
>>> device-mapper.
>> ddsnap was the Zumastor snapshot tool which uses a different in-kernel
>> Well.....
>> The LVM2 code that ships with most distros still uses the old 
>> interfaces and still (Ubuntu 12.04) seemst to create a COW file with SnAp
> 
> This utility (ddsnap work alike) requires no kernel changes, and only 
> depends on the layout of the COW (and only on the changed block table):
> 
> http://www.opensvc.com/init/default/doc_storage_dds

This is closer to the kind of thing that Linda was originally asking
about. It seems to let you extract deltas and move them around and
re-apply them for replication purposes so it's similar to ddsnap in that
it's distributed although as you say it's entirely in userspace and
doesn't requite the ddsnap device-mapper target.

Regards,
Bryn.
