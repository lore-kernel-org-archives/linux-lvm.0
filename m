References: <12562310-b26a-8a83-9481-d8b54fda40d5@gmail.com>
	<e70ef50c-08ed-b75b-df30-8eae007fa556@redhat.com>
	<cdefc95e-38bc-d071-c592-838991d488f2@gmail.com>
	<d5495aca-c9db-099a-13f2-f602df311a7f@redhat.com>
From: Gordon Messmer <gordon.messmer@gmail.com>
Message-ID: <21dfe68f-95ab-fd2e-8c2a-e576c6ed7cb8@gmail.com>
Date: Tue, 2 Jan 2018 10:58:10 -0800
MIME-Version: 1.0
In-Reply-To: <d5495aca-c9db-099a-13f2-f602df311a7f@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [linux-lvm] unable to exclude LVs using global_filter
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Marian Csontos <mcsontos@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 01/02/2018 10:17 AM, Marian Csontos wrote:
> I do not think that log shows what is processed. LVM displays device 
> names according to different option - preferred_names it is.

I see.  It seems to me that, for the purpose of troubleshooting filter 
processing, the literal path that matches a filter option should be logged.

> If lvmetad is in use, which by default it is, run `pvscan -vvvv 
> --cache $DEV_MAJOR:$DEV_MINOR` - that should be more helpful WRT which 
> devices are scanned and accepted as Physical Volumes.

I see the following in the ouptut:

#device/dev-cache.c:356         /dev/dm-3: Added to device cache (253:3)
#device/dev-cache.c:352         /dev/VolGroup/vm_wiki_data: Aliased to 
/dev/dm-3 in device cache (preferred name) (253:3)
#device/dev-cache.c:352 /dev/disk/by-id/dm-name-VolGroup-vm_wiki_data: 
Aliased to /dev/VolGroup/vm_wiki_data in device cache (253:3)
#device/dev-cache.c:352 
/dev/disk/by-id/dm-uuid-LVM-LaE2AjV9UKn6sAhmbduHGzY0TsRtfr9fwKOoFpMNpYX98umwKoXfH0qQb2MG7bCx: 
Aliased to /dev/VolGroup/vm_wiki_data in device cache (253:3)
#device/dev-cache.c:352 
/dev/disk/by-id/lvm-pv-uuid-NRKTXX-I9D8-Vxb1-hKcX-rjJX-GNhB-jgsXiW: 
Aliased to /dev/VolGroup/vm_wiki_data in device cache (253:3)
#device/dev-cache.c:352         /dev/mapper/VolGroup-vm_wiki_data: 
Aliased to /dev/VolGroup/vm_wiki_data in device cache (253:3)

...understanding that all of those paths are filtered individually was 
the bit I was missing.

> IMHO the documentation is confusing if not straight incorrect. I hate 
> that and IMHO we should fix how the filtering works, but that would be 
> an incompatible change, and those are not loved. :-(
>
> How it actually works is: if ANY path is accepted, the device is. In 
> upstream the lvm.conf also says (emphasis mine):
>
> "When multiple path names exist for a block device, if *any path* name 
> matches an 'a' pattern before an 'r' pattern, then the device is 
> accepted. If all the path names match an 'r' pattern first, then the 
> device is rejected."

The description of filtering is... maybe a touch long, and that specific 
bit is very important and easy to miss.  It might be more clear to move 
that statement to a paragraph of its own.

Alternatively, if devices are accepted when no pattern matches, maybe 
emptying the default filter would be a better approach.  That way the 
default configuration would accept all devices.  If someone introduces 
an r filter, it will actually work as expected.  It's nearly impossible 
to effectively blacklist a device if the default "a" filter is retained, 
and it doesn't appear to serve a function if the system accepts block 
devices that match no path.

> May be we should replace the "device" in the last sentence by "path" 
> so it would say:
>
> "The first regex in the list to match the path is used, producing the 
> 'a' or 'r' result for *that path*."

I'm not sure that really conveys the bit that I, personally, missed, 
which is that in order to reject a device, you must reject all of the 
paths by which it is referenced.  If the default "a" filter is retained, 
then you'd probably want to be clear about that, and possibly describe 
at least one way to get a list of all of the paths that lead to a given 
block device.

Thanks for the help understanding the filter system.  I'll work with 
this a bit and come back if my understanding is still incorrect.
