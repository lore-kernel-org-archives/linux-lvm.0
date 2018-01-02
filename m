References: <12562310-b26a-8a83-9481-d8b54fda40d5@gmail.com>
	<e70ef50c-08ed-b75b-df30-8eae007fa556@redhat.com>
	<cdefc95e-38bc-d071-c592-838991d488f2@gmail.com>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <d5495aca-c9db-099a-13f2-f602df311a7f@redhat.com>
Date: Tue, 2 Jan 2018 19:17:12 +0100
MIME-Version: 1.0
In-Reply-To: <cdefc95e-38bc-d071-c592-838991d488f2@gmail.com>
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gordon Messmer <gordon.messmer@gmail.com>

On 01/02/2018 04:35 PM, Gordon Messmer wrote:
> On 01/02/2018 03:03 AM, Marian Csontos wrote:
>> Filters accept any device if any of it's "names" (all symbolic links) 
>> is matched by an a pattern ("a|.*/|" in your case) and matches no 
>> previous r pattern
> 
> I don't follow you.  The name being processed in that log *does* match a 
> previous r pattern.
I do not think that log shows what is processed. LVM displays device 
names according to different option - preferred_names it is.

If lvmetad is in use, which by default it is, run `pvscan -vvvv --cache 
$DEV_MAJOR:$DEV_MINOR` - that should be more helpful WRT which devices 
are scanned and accepted as Physical Volumes.

> 
>> for example anything in /dev/mapper/ is accepted. 

^ THIS! In your case the /dev/mapper/vm_* link IS accepted by the 
"a|.*/|" in global_filter. And /dev/disk/by-*/* too. And maybe others...

> 
> 
> Yes, I'd considered that might be an issue, but that's not the block 
> device name that the logs indicate is being used.  A path that I've 
> specifically rejected is being processed.  If a second path to the block 
> device might be processed, then I can see the need to make additional 
> changes, but I can't solve that problem without understanding the basic 
> logic of the filter system.
> 
> The documentation in lvm.conf says "The first regex in the list to match 
> the path is used, producing the 'a' or 'r' result for the device." but 
> that doesn't seem to be correct.

IMHO the documentation is confusing if not straight incorrect. I hate 
that and IMHO we should fix how the filtering works, but that would be 
an incompatible change, and those are not loved. :-(

How it actually works is: if ANY path is accepted, the device is. In 
upstream the lvm.conf also says (emphasis mine):

"When multiple path names exist for a block device, if *any path* name 
matches an 'a' pattern before an 'r' pattern, then the device is 
accepted. If all the path names match an 'r' pattern first, then the 
device is rejected."

May be we should replace the "device" in the last sentence by "path" so 
it would say:

"The first regex in the list to match the path is used, producing the 
'a' or 'r' result for *that path*."

And:

"When multiple path names exist for a block device"

could be safely discarded - as it is true most of if not all the time 
(or replaced by "Keep in mind devices nowadays are linked from many 
places in the /dev tree, and")

So we would have the following:

"If any path name matches an 'a' pattern before an 'r' pattern, then the 
device is accepted."

I am not a native speaker, but to me that is consistent with current 
behavior which is unlikely to change. I will send a patch to see if it 
is opposed by anyone...

-- Martian


> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
